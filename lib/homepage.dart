import 'package:cupertino/cupertino_popup.dart';
import 'package:cupertino/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentSliderValue = 0.0;
  String? _sliderStatus;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.purple,
        middle: Text(
          'Cupertino slider',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              child: Text('CalendarHome'),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CalendarHome(),
                  ),
                );
              },
            ),
            Text('$_currentSliderValue'),
            CupertinoSlider(
              key: const Key('slider'),
              value: _currentSliderValue,
              divisions: 100,
              max: 100,
              onChangeStart: (double value) {
                setState(() {
                  _sliderStatus = 'Sliding';
                });
              },
              onChangeEnd: (double value) {
                setState(() {
                  _sliderStatus = 'Finished sliding';
                });
              },
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Text(
              _sliderStatus ?? '',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                    fontSize: 20,
                  ),
            ),
            CupertinoButton(
              child: Text('Go to Home Page'),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
