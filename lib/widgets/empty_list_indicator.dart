import 'package:flutter/cupertino.dart';

import 'exception_indicator.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  final String? emptyMessage;
  final String? emptyTitle;
  const EmptyListIndicator({super.key, this.emptyMessage,this.emptyTitle});

  @override
  Widget build(BuildContext context) {
    return ExceptionIndicator(
      title: emptyTitle ?? 'noData',
      message: emptyMessage ?? 'noDataFilter',
      assetName: 'ImagePath.emptyBox',
    );
  }
}
