import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
class CalendarHome extends StatelessWidget {
  const CalendarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: OnboardingOverview()
    );
  }
}

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
      },
      pages: [
        WhatsNewPage(
          title: const Text("What's New Template"),
          features: const [
            WhatsNewFeature(
              title: Text('Showcase your App Features'),
              description: Text(
                  'Clean and minimalistic iOS styled template for showing app features e.g. in a new update.'),
              icon: Icon(CupertinoIcons.star),
            ),
            WhatsNewFeature(
              title: Text("Styled Icons and Buttons"),
              description: Text(
                  "To create consistent look, icons and buttons are styled to match your CupertinoTheme's primaryColor. "),
              icon: Icon(CupertinoIcons.paintbrush),
            ),
            WhatsNewFeature(
              title: Text('Style Flexiblity'),
              description: Text(
                  "What's New Template can be styled to match new and old iOS versions of onboarding or your own preferences."),
              icon: Icon(CupertinoIcons.gear),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
          title: Text('Multiple Pages'),
          body: Icon(
            CupertinoIcons.square_stack_3d_down_right,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Sunny'),
          body: Icon(
            CupertinoIcons.sun_max,
            size: 200,
          ),
        ),
      ],
    );
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.cyan,
          middle: Text('Cupertino Onbord',style: TextStyle(fontSize: 15,color: Colors.white),),
        ),
        child: Center(
          child: Text("Welcome to INDIA",style: TextStyle(fontSize: 25),),
        ),
      );
  }
}