import 'package:cupertino/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.amber,
        middle: Text(
          'CupertinoPopupSurface',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          CupertinoButton(
            child: Text('Homepage'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => DatePickerApp(),
                ),
              );
            },
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent)),
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.3),
                  builder: (BuildContext builder) {
                    return CupertinoPopupSurface(
                      isSurfacePainted: true,
                      child: Container(
                          padding: const EdgeInsetsDirectional.all(20),
                          color: CupertinoColors.white,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).copyWith().size.height *
                                  0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FlutterLogo(
                                style: FlutterLogoStyle.horizontal,
                                size: 100,
                              ),
                              const Material(
                                  child: Text(
                                "Are you an India developer?",
                                style: TextStyle(
                                  color: CupertinoColors.black,
                                  fontSize: 18,
                                ),
                              )),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("NO")),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.lightGreen)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("YES")),
                                  ]),
                            ],
                          )),
                    );
                  });
            },
            child: const Text("Cupertino Popup Surface"),
          ),
        ]),
      ),
    );
  }
}
