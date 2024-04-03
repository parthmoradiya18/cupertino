import 'package:cupertino/cupertinoactionsheets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DatePickerApp());

class DatePickerApp extends StatelessWidget {
  const DatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(color: Colors.pinkAccent,
      debugShowCheckedModeBanner: false,
      home: DatePickerExample(),
    );
  }
}

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime date = DateTime.now();
  DateTime time = DateTime.now();
  DateTime dateTime = DateTime.now();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 200,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'CupertinoDatePicker',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text('CupertinoActionSheets'),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => CupertinoActionSheets(),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Date : '),
                  Text(
                    '${date.month}-${date.day}-${date.year}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: Colors.blueGrey,
                onPressed: () => showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => Container(
                          height: 200,
                          padding: const EdgeInsets.only(top: 6.0),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          color: CupertinoColors.systemBackground
                              .resolveFrom(context),
                          child: CupertinoDatePicker(
                            initialDateTime: date,
                            backgroundColor: Colors.white,
                            dateOrder: DatePickerDateOrder.mdy,
                            maximumYear: 2025,
                            minimumYear: 1,
                            minuteInterval: 1,
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() => date = newDate);
                            },
                          ),
                        )),
                child: const Text(
                  'Date Picker',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Time : '),
                  Text(
                    '${time.hour}:${time.minute}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: Colors.purpleAccent.shade200,
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: time,
                    backgroundColor: Colors.white,
                    dateOrder: DatePickerDateOrder.mdy,
                    maximumYear: 2025,
                    minimumYear: 1,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() => time = newTime);
                    },
                  ),
                ),
                child: const Text(
                  'Time Picker',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Date&Time : '),
                  Text(
                    '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                color: Colors.lime.shade800,
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    initialDateTime: dateTime,
                    backgroundColor: Colors.white,
                    dateOrder: DatePickerDateOrder.dmy,
                    maximumYear: 2025,
                    minimumYear: 1,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() => dateTime = newDateTime);
                    },
                  ),
                ),
                child: const Text(
                  'Date&Time Picker',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
