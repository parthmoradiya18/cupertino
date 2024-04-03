import 'dart:ui';
import 'package:cupertino/Cupertinoalertdialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheets extends StatefulWidget {
  const CupertinoActionSheets({super.key});

  @override
  State<CupertinoActionSheets> createState() => _CupertinoActionSheetsState();
}

class _CupertinoActionSheetsState extends State<CupertinoActionSheets> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.lightGreenAccent,
        middle: Text(
          'CupertinoActionSheet',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            CupertinoButton(
              child: Text('CupertinoAlertDialogs'),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => CupertinoAlertDialogs(),
                  ),
                );
              },
            ),
            OutlinedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightGreen)),
              onPressed: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.7),
                  builder: (BuildContext context) => CupertinoActionSheet(
                    title: const Text('Made In India'),
                    message: const Text('ActionSheet'),
                    actions: <CupertinoActionSheetAction>[
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Default Action',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Action',
                            style: TextStyle(
                              color: Colors.green,
                            )),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Destructive Action'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'CupertinoActionSheet',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
