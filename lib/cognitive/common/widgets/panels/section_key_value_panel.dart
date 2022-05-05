import 'package:auto_size_text/auto_size_text.dart';
import 'package:epsycheart/cognitive/common/constants/font_constants.dart';
import 'package:epsycheart/cognitive/common/widgets/panels/base_panel.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:flutter/material.dart';

class SectionKeyValuePanelItem {
  final String? title;
  final Map<String, String> data;

  SectionKeyValuePanelItem({this.title, this.data = const {}});
}

class SectionKeyValuePanel extends StatelessWidget {
  final String? title;
  final List<SectionKeyValuePanelItem> dataSections;

  const SectionKeyValuePanel(
      {Key? key, this.dataSections = const [], this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sections = dataSections.map((section) {
      final titleWidget = section.title != null
          ? AutoSizeText(
              section.title!,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: FontConstants.fontSizeM,
                  color: AppTheme.black,
                  fontWeight: FontWeight.w500),
              minFontSize: FontConstants.fontSizeS,
              maxFontSize: FontConstants.fontSizeM,
            )
          : null;

      final entries = section.data.entries
          .map(
            (e) => Flexible(
                child: Row(
              children: [
                Expanded(
                    child: AutoSizeText(
                  e.key,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  minFontSize: FontConstants.fontSizeS,
                  maxFontSize: FontConstants.fontSizeL,
                )),
                Expanded(
                    child: AutoSizeText(
                  e.value,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  // style: TextStyle(fontWeight: FontWeight.w500),
                  minFontSize: FontConstants.fontSizeS,
                  maxFontSize: FontConstants.fontSizeL,
                ))
              ],
            )),
          )
          .toList();

      return Expanded(
          child: Column(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (titleWidget != null) Expanded(child: titleWidget),
          ...entries
        ],
      ));
    }).toList();

    return BasePanel(children: sections);
  }
}
