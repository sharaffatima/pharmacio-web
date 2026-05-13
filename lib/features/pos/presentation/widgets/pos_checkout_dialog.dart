import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../inventory/data/models/inventory_api_item.dart';
import '../../data/models/pos_barcode_lookup_response.dart';
import '../../data/models/pos_checkout_request_body.dart';
import '../../data/models/pos_payment.dart';
import '../../logic/cubit/pos_cubit.dart';

class PosCheckoutDialog extends StatefulWidget {
  const PosCheckoutDialog({super.key});

  @override
  State<PosCheckoutDialog> createState() => _PosCheckoutDialogState();
}

class _PosCheckoutDialogState extends State<PosCheckoutDialog> {
  final _quantityController = TextEditingController(text: '1');
  final _unitPriceController = TextEditingController();
  final _amountPaidController = TextEditingController();
  final _discountPercentageController = TextEditingController(text: '0');
  final _barcodeController = TextEditingController();
  final FocusNode _barcodeFocusNode = FocusNode();

  int? _selectedInventoryIndex;
  String _selectedPaymentMethod = 'cash';
  bool _isLoadingInventory = false;
  bool _isCheckingOut = false;
  bool _isLookingUpBarcode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInventoryItems();
      _focusBarcodeInput();
    });
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _unitPriceController.dispose();
    _amountPaidController.dispose();
    _discountPercentageController.dispose();
    _barcodeController.dispose();
    _barcodeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PosCubit>();
    final availableItems = _selectableInventoryItems(cubit.inventoryItems);
    final hasInventory = availableItems.isNotEmpty;
    final selectedInventoryIndex =
        _selectedInventoryIndex != null &&
            _selectedInventoryIndex! < availableItems.length
        ? _selectedInventoryIndex
        : null;
    final inventoryDropdownKey = ValueKey(
      '${selectedInventoryIndex ?? 'none'}-${availableItems.length}',
    );

    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 520.w,
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.gainsboro, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackOverlay08,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.barcode, style: AppTextStyles.font13GreyRegular),
            verticalSpace(6),
            TextField(
              controller: _barcodeController,
              focusNode: _barcodeFocusNode,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: _buildInputDecoration(AppStrings.barcode).copyWith(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () => _onBarcodeSubmitted(_barcodeController.text),
                ),
              ),
              onSubmitted: _onBarcodeSubmitted,
            ),
            verticalSpace(16),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.shopping_cart_checkout,
                    size: 18.sp,
                    color: AppColors.skyBlue,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.newCheckout,
                        style: AppTextStyles.font16BlackSemiBold,
                      ),
                      verticalSpace(2),
                      Text(
                        AppStrings.enterSaleDetails,
                        style: AppTextStyles.font12GreyRegular,
                      ),
                      verticalSpace(4),
                      Row(
                        children: [
                          Icon(
                            Icons.qr_code_scanner,
                            size: 14.sp,
                            color: AppColors.skyBlue,
                          ),
                          horizontalSpace(6),
                          Text(
                            AppStrings.barcodeReady,
                            style: AppTextStyles.font12GreyRegular.copyWith(
                              color: AppColors.skyBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Icon(
                      Icons.close,
                      size: 18.sp,
                      color: AppColors.coolGrey,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(18),
            Row(
              children: [
                Text(
                  AppStrings.inventoryItem,
                  style: AppTextStyles.font13GreyRegular,
                ),
                if (_isLookingUpBarcode) ...[
                  horizontalSpace(8),
                  SizedBox(
                    width: 14.r,
                    height: 14.r,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.skyBlue,
                    ),
                  ),
                ],
              ],
            ),
            verticalSpace(6),
            if (_isLoadingInventory)
              const LoadingWidget()
            else
              DropdownButtonFormField<int>(
                key: inventoryDropdownKey,
                initialValue: selectedInventoryIndex,
                isExpanded: true,
                decoration: _buildInputDecoration(AppStrings.selectItem),
                dropdownColor: AppColors.white,
                style: _fieldTextStyle,
                hint: Text(AppStrings.selectItem, style: _hintTextStyle),
                iconEnabledColor: AppColors.coolGrey,
                iconDisabledColor: AppColors.coolGrey,
                items: List.generate(availableItems.length, (index) {
                  final item = availableItems[index];
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(
                      '${item.product ?? AppStrings.unknown} (Qty: ${item.quantity ?? 0})',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: _fieldTextStyle,
                    ),
                  );
                }).toList(),
                onChanged: hasInventory
                    ? (value) {
                        setState(() {
                          _selectedInventoryIndex = value;
                        });
                      }
                    : null,
              ),
            if (!hasInventory) ...[
              verticalSpace(8),
              Text(
                AppStrings.noInventoryItemsToSell,
                style: AppTextStyles.font12GreyRegular,
              ),
            ],
            verticalSpace(12),
            Row(
              children: [
                Expanded(
                  child: _buildDialogField(
                    controller: _quantityController,
                    label: AppStrings.quantitySold,
                    keyboardType: TextInputType.number,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: _buildDialogField(
                    controller: _unitPriceController,
                    label: AppStrings.unitPrice,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.paymentMethod,
                        style: AppTextStyles.font13GreyRegular,
                      ),
                      verticalSpace(6),
                      DropdownButtonFormField<String>(
                        key: ValueKey(_selectedPaymentMethod),
                        initialValue: _selectedPaymentMethod,
                        isExpanded: true,
                        decoration: _buildInputDecoration(
                          AppStrings.paymentMethod,
                        ),
                        dropdownColor: AppColors.white,
                        style: _fieldTextStyle,
                        iconEnabledColor: AppColors.coolGrey,
                        iconDisabledColor: AppColors.coolGrey,
                        items: [
                          DropdownMenuItem(
                            value: 'cash',
                            child: Text(
                              AppStrings.cash,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: _fieldTextStyle,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'card',
                            child: Text(
                              AppStrings.card,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: _fieldTextStyle,
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedPaymentMethod = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: _buildDialogField(
                    controller: _amountPaidController,
                    label: AppStrings.amountPaid,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            _buildDialogField(
              controller: _discountPercentageController,
              label: '${AppStrings.discount} (%)',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            verticalSpace(20),
            if (_isCheckingOut)
              const Center(child: LoadingWidget())
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.gainsboro),
                      foregroundColor: AppColors.coolGrey,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 11.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        color: AppColors.coolGrey,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  ElevatedButton.icon(
                    onPressed: hasInventory ? _handleCheckout : null,
                    icon: Icon(Icons.check, size: 16.sp),
                    label: Text(AppStrings.checkout),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.charcoalBlack,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 11.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  List<InventoryApiItem> _selectableInventoryItems(
    List<InventoryApiItem> items,
  ) {
    final seenIds = <int>{};
    final selectableItems = <InventoryApiItem>[];

    for (var index = 0; index < items.length; index++) {
      final item = items[index];
      final id = item.id;
      if (id == null) {
        selectableItems.add(item);
        continue;
      }
      if (seenIds.contains(id)) continue;
      seenIds.add(id);
      selectableItems.add(item);
    }

    return selectableItems;
  }

  Future<void> _loadInventoryItems() async {
    final cubit = context.read<PosCubit>();
    if (cubit.inventoryItems.isNotEmpty || _isLoadingInventory) return;

    setState(() => _isLoadingInventory = true);
    await cubit.fetchInventoryItems();

    if (!mounted) return;
    setState(() => _isLoadingInventory = false);
  }

  Widget _buildDialogField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font13GreyRegular),
        verticalSpace(6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: _fieldTextStyle,
          decoration: _buildInputDecoration(label),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.offWhiteGrey,
      hintText: hint,
      hintStyle: _hintTextStyle,
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.gainsboro),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.gainsboro),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.skyBlue, width: 1.5),
      ),
    );
  }

  TextStyle get _fieldTextStyle =>
      AppTextStyles.font14BlackRegular.copyWith(color: AppColors.black);

  TextStyle get _hintTextStyle =>
      AppTextStyles.font12GreyRegular.copyWith(color: AppColors.coolGrey);

  void _focusBarcodeInput() {
    if (!mounted) return;
    FocusScope.of(context).requestFocus(_barcodeFocusNode);
  }

  void _onBarcodeSubmitted(String value) {
    final barcode = value.trim();
    _barcodeController.clear();

    if (barcode.isEmpty) {
      _focusBarcodeInput();
      return;
    }
    _handleBarcodeLookup(barcode);
  }

  Future<void> _handleBarcodeLookup(String barcode) async {
    if (_isLookingUpBarcode) return;

    setState(() => _isLookingUpBarcode = true);

    try {
      final response = await context.read<PosCubit>().barcodeLookup(barcode);
      final resolvedResponse = response.hasAnyData
          ? response
          : PosBarcodeLookupResponse(barcode: barcode, unitPrice: '0.00');

      await _loadInventoryItems();
      _applyBarcodeResult(resolvedResponse);
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = exception.maybeWhen(
        notFound: (_) => AppStrings.barcodeNotFound,
        orElse: () => NetworkExceptions.getErrorMessage(exception),
      );
      showAppSnackBar(context, message);
    } finally {
      if (mounted) {
        setState(() => _isLookingUpBarcode = false);
      }
      _focusBarcodeInput();
    }
  }

  void _applyBarcodeResult(PosBarcodeLookupResponse response) {
    final unitPrice = _normalizePrice(response.unitPrice);
    final availableItems = _selectableInventoryItems(
      context.read<PosCubit>().inventoryItems,
    );
    final inventoryId = response.inventoryId;
    final matchedIndex = inventoryId == null
        ? null
        : availableItems.indexWhere((item) => item.id == inventoryId);

    setState(() {
      _quantityController.text = '1';
      _unitPriceController.text = unitPrice;
      _amountPaidController.text = '';
      _discountPercentageController.text = '0';

      if (matchedIndex != null && matchedIndex >= 0) {
        _selectedInventoryIndex = matchedIndex;
      }
    });
  }

  String _normalizePrice(String? value) {
    if (value == null || value.trim().isEmpty) return '0.00';
    final parsed = double.tryParse(value.trim());
    if (parsed == null) return '0.00';
    return parsed.toStringAsFixed(2);
  }

  Future<void> _handleCheckout() async {
    final availableItems = _selectableInventoryItems(
      context.read<PosCubit>().inventoryItems,
    );
    if (availableItems.isEmpty) {
      showAppSnackBar(context, AppStrings.noInventoryItemsToSell);
      return;
    }

    final quantity = int.tryParse(_quantityController.text.trim());
    final unitPrice = double.tryParse(_unitPriceController.text.trim());
    final amountPaid = double.tryParse(_amountPaidController.text.trim());
    final discountText = _discountPercentageController.text.trim();
    final discountPercentage = double.tryParse(
      discountText.isEmpty ? '0' : discountText,
    );
    final selectedIndex = _selectedInventoryIndex;
    final selectedItem =
        selectedIndex != null &&
            selectedIndex >= 0 &&
            selectedIndex < availableItems.length
        ? availableItems[selectedIndex]
        : null;
    final hasSelectedInventory = selectedItem != null;
    final selectedInventoryId = selectedItem?.id;

    if (hasSelectedInventory && selectedInventoryId == null) {
      showAppSnackBar(context, AppStrings.cannotCheckoutMissingInventoryId);
      return;
    }

    if (!hasSelectedInventory ||
        quantity == null ||
        quantity <= 0 ||
        unitPrice == null ||
        unitPrice <= 0 ||
        amountPaid == null ||
        amountPaid <= 0 ||
        discountPercentage == null ||
        discountPercentage < 0 ||
        discountPercentage > 100) {
      showAppSnackBar(context, AppStrings.validValuesForAllFields);
      return;
    }

    setState(() => _isCheckingOut = true);

    try {
      final requestBody = PosCheckoutRequestBody(
        items: [
          PosCheckoutItemRequestBody(
            inventoryId: selectedInventoryId,
            quantity: quantity,
            unitPrice: unitPrice.toStringAsFixed(2),
            discountPercentage: "0.00",
          ),
        ],
        payments: [
          PosPayment(
            paymentMethod: _selectedPaymentMethod,
            amountPaid: amountPaid.toStringAsFixed(2),
          ),
        ],
        discountPercentage: discountPercentage.toStringAsFixed(2),
      );

      await context.read<PosCubit>().checkout(requestBody);

      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _isCheckingOut = false);
      }
    }
  }
}
