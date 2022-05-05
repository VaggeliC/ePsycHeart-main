// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_local_variable, unused_element, avoid_print, deprecated_member_use, sized_box_for_whitespace

import 'package:easy_localization/easy_localization.dart';
import 'package:epsycheart/core/utilities/app_theme.dart';
import 'package:epsycheart/geriatric/incontinence/screens/home_screen.dart';
import 'package:epsycheart/geriatric/incontinence/screens/reminders_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weekday_selector/weekday_selector.dart';

import '../model/alarm_info.dart';
import '../services/data.dart';
import '../services/notification_api.dart';
import '../widgets/my_input_field.dart';

List<bool> findRemindedDays = [];

class AddReminder extends StatefulWidget {
  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  List<bool> listOfBools = List.filled(7, false);

  List<String> listOfBoolsconverted = [];
  final _formKey =
      GlobalKey<FormState>(); //για να έχουμε προσβαση στο state Form
  String newTaskTitle = '';
  DateTime _selectedDate = DateTime.now();
  String _startTime = '';
  TimeOfDay? pickedTime;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  // const AddReminder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'geriatric.incontinence.addReminder.addReminder'.tr(),
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyInputField(
              title: 'geriatric.incontinence.addReminder.titleReminder'.tr(),
              hint: 'geriatric.incontinence.addReminder.enterTitle'.tr(),
              controller: _textEditingController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'geriatric.incontinence.addReminder.weekday',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ).tr(),
            WeekdaySelector(
              onChanged: (v) {
                print(v);
                setState(() {
                  listOfBools[v % 7] = !listOfBools[v % 7];
                });
              },
              values: listOfBools,
            ),
            MyInputField(
              title: 'geriatric.incontinence.addReminder.time'.tr(),
              // hint: _startTime,
              hint: 'geriatric.incontinence.addReminder.enterTimeOf'.tr(),
              controller: _timeController,
              widget: IconButton(
                onPressed: () {
                  _getTimePicker();
                },
                icon: Icon(
                  Icons.access_alarm,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 45),
                primary: AppTheme.orange,
                onPrimary: AppTheme.black,
              ),
              onPressed: () async {
                List<int> weekdays = [];
                listOfBoolsconverted = getIt(listOfBools);
                if (_formKey.currentState!.validate() &&
                    listOfBools.contains(true)) {
                  //ama periexei esw ena true shmainei pvs έχει επιλέξει εστω μια μερα για remind
                  final alarm = AlarmInfo(
                      timeOfDay: _startTime,
                      dateTime: _selectedDate,
                      tilte: _textEditingController.text,
                      values: listOfBoolsconverted);

                  for (int i = 0; i < 7; i++) {
                    if (listOfBools[i] == true) {
                      if (i == 0) {
                        weekdays.add(7);
                      } else {
                        weekdays.add(i);
                      }
                    }
                  }
                  print(weekdays);

                  Provider.of<Data>(context, listen: false).addAlarm(alarm);
                  print(alarm.tilte.hashCode);
                  NotificationApi.showScheduledNotification(
                      id: alarm.tilte.hashCode,
                      title: alarm.tilte,
                      body: 'Reminder',
                      alarm: alarm,
                      weekdays: weekdays);

                  Navigator.pop(context);

                }
              },
              child: Text(
                'geriatric.incontinence.addReminder.add',
                style: TextStyle(
                  color: AppTheme.white,fontSize: 28,
                ),
              ).tr(),
            )
          ],
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023));

    if (_pickedDate != null) {
      setState(() {
        _selectedDate = _pickedDate;
        print(_selectedDate);
        _dateController.text = DateFormat('MM-dd-yyyy').format(_pickedDate);
      });
    }
  }

  _getTimePicker() async {
    pickedTime = await _showTimePicker();
    print(pickedTime);
    String _formatedTime = pickedTime!.format(context);

    if (pickedTime == null) {
      print("Time cancelled");
    } else {
      setState(() {
        _startTime = _formatedTime;
        _timeController.text = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, _) {
          return MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: _!);
        });
  }
}

List<String> getIt(List<bool> values) {
  List<String> listBoolconverted = <String>[];
  values.forEach((item) => item == true
      ? listBoolconverted.add('true')
      : listBoolconverted.add('false'));
  return listBoolconverted;
}
