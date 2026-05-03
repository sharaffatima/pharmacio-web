import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(3),
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.skyBlue),
              ),
            ),
          ),
          if (message != null && message!.trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message!,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.coolGrey),
              ),
            ),
        ],
      ),
    );
  }
}
