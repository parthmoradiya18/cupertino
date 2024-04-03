import 'dart:ui';

import 'package:cupertino/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDialogs extends StatefulWidget {
  const CupertinoAlertDialogs({super.key});

  @override
  State<CupertinoAlertDialogs> createState() => _CupertinoAlertDialogsState();
}

class _CupertinoAlertDialogsState extends State<CupertinoAlertDialogs> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.orangeAccent,
        middle: Text(
          'CupertinoAlertDialog',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            CupertinoButton(
              child: Text('Go to Home Page'),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
            OutlinedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent)),
              onPressed: () {
                showCupertinoModalPopup<void>(
                    context: context,
                    anchorPoint: const Offset(10, 5),
                    barrierColor: Colors.red.withOpacity(0.5),
                    barrierDismissible: true,
                    filter: ImageFilter.blur(),
                    routeSettings: const RouteSettings(
                        arguments: Object(), name: "Made In India"),
                    semanticsDismissible: true,
                    useRootNavigator: true,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('cupertionAlertDialog'),
                          content:
                              const Text('Proceed with destructive action?'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(textStyle: TextStyle(color: Colors.orangeAccent),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                            CupertinoDialogAction(textStyle: TextStyle(color: Colors.green.shade800),
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ));
              },
              child: const Text('CupertinoAlertDialog',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
