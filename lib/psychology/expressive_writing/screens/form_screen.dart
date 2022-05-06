import 'package:epsycheart/cognitive/common/constants/spacing_constants.dart';
import 'package:epsycheart/cognitive/common/widgets/layouts/action_screen_layout.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:epsycheart/core/widgets/language_button.dart';
import 'package:epsycheart/psychology/expressive_writing/screens/results_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/psychology/expressive_writing/model/alert_util.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:async';

import '../utilities/constantscolors.dart';

class ExpressiveWritingForm extends StatefulWidget {
  const ExpressiveWritingForm({Key? key}) : super(key: key);

  @override
  _ExpressiveWritingFormState createState() => _ExpressiveWritingFormState();
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

class _ExpressiveWritingFormState extends State<ExpressiveWritingForm> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  late Stopwatch _stopwatch;
  late Timer _timer;
  RegExp regExp = RegExp(" ");
  int wordcount = 0;
  int test =0;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ActionScreenLayout(
        title: 'psychology.expressiveWriting.expressiveWritingTitle'.tr(),
        //  flexContentArea: 30,
        flexActionsArea: 800,
        verticalAreaSpacing: SpacingConstants.spacingXXL,
        // card grid
        flexContentArea: 50,
        screenActions: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Scrollbar(
                //alignment: Alignment.topCenter,
                child: Card(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 550),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'psychology.expressiveWriting.formPage.header',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ).tr(),
                          Text(
                            'psychology.expressiveWriting.formPage.text',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 19,
                            ),
                          ).tr(),
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: AppTheme.black,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          ...[
                            _FormDatePicker(
                              date: date,
                              onChanged: (value) {
                                setState(() {
                                  date = value;
                                });
                              },
                            ),
                          ].expand(
                                (widget) =>
                            [
                              widget,
                              const SizedBox(
                                height: 22,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  'psychology.expressiveWriting.formPage.timer'
                                      .tr() +
                                      formatTime(
                                          _stopwatch.elapsedMilliseconds),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      background: Paint()
                                        ..strokeWidth = 25.0
                                        ..color = Colors.grey
                                        ..style = PaintingStyle.stroke
                                        ..strokeJoin = StrokeJoin.round)),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              //hintText: 'Write your thoughts and feelings...',
                              //labelText: 'Description',
                            ),
                            onChanged: (value) {
                              _stopwatch.start();
                              description = value;
                              print(description);
                              // description.trim();

                              if (kDebugMode)  {
                                wordcount = regExp.allMatches(value).length+1;
                                print(wordcount);
                              }

                            },
                            maxLines: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ElevatedButton(
                              onPressed: () =>
                              {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate() &&
                                    wordcount > 0)
                                  {
                                    _stopwatch.stop(),
                                    print(formatTime(
                                        _stopwatch.elapsedMilliseconds)),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ResultsScreen(
                                                  wordCount: wordcount,
                                                  timeText: formatTime(
                                                      _stopwatch
                                                          .elapsedMilliseconds),
                                                  description: description,
                                                )))),
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    ),
                                  }
                                else
                                  {
                                    AlertUtil.showAlert(
                                        context,
                                        'psychology.expressiveWriting.formPage.alert'
                                            .tr(),
                                        'psychology.expressiveWriting.formPage.textAlert.'
                                            .tr())
                                  }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: AppTheme.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              child: const Text(
                                'psychology.expressiveWriting.formPage.submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ).tr(),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]);
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'psychology.expressiveWriting.formPage.date'.tr() +
                  intl.DateFormat.yMd().format(widget.date),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}