import 'package:flutter/material.dart';

class HorizontalScrollTable extends StatefulWidget {
  final Widget child;
  final double minWidth;

  const HorizontalScrollTable({
    super.key,
    required this.child,
    required this.minWidth,
  });

  @override
  State<HorizontalScrollTable> createState() => _HorizontalScrollTableState();
}

class _HorizontalScrollTableState extends State<HorizontalScrollTable> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final actualWidth = constraints.maxWidth > widget.minWidth
            ? constraints.maxWidth
            : widget.minWidth;

        return Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: actualWidth,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
