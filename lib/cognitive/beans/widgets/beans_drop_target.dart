import 'package:epsycheart/cognitive/beans/widgets/bean.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class BeansDropTarget extends StatelessWidget {
  final Color? targetColor;

  const BeansDropTarget({Key? key, this.targetColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      builder: (context, candidateData, rejectedData) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
              child: targetColor != null ? Bean(color: targetColor!) : null,
              decoration: BoxDecoration(
                color: AppTheme.white,
                border: Border.all(color: AppTheme.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              )),
        );
      },
    );
  }
}
