import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/main_home/main_home_page.dart';
import 'package:hackathon2022/views/screens/page_2.dart';
import 'package:hackathon2022/views/screens/page_3.dart';
import 'package:iconsax/iconsax.dart';

import 'views/widgets/FABBottomBarNavigation.dart';
import 'package:alan_voice/alan_voice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  _MyHomePageState() {
    _initAlanButton();
  }
  void _initAlanButton() {
    AlanVoice.addButton(
        "f9f23d68d7018705d0f0fb27ee575e8a2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
        bottomMargin: 10);
    AlanVoice.onCommand.add((command) {
      var commandName = command.data["commands"] ?? "";
      switch (commandName) {
        case 'home':
          // Navigator.push(
          //     context, MaterialPageRoute(builder: ((context) => Page_2())));
          _incrementCounter();
          break;
        case 'notification':
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Page_3())));
          break;
      }
      if (commandName == "home") {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => Page_2())));
      }
    });

    AlanVoice.onEvent.add((event) {
      debugPrint("got new event ${event.data.toString()}");
    });

    AlanVoice.onButtonState.add((state) {
      debugPrint("got new button state ${state.name}");
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _activate() {
    AlanVoice.activate();
  }

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          _activate();
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
            color: AppColors.alt700,
            shape: BoxShape.circle,
          ),
          child:
              const Icon(Iconsax.emoji_happy, color: AppColors.white, size: 24),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedFab,
        items: [
          FABBottomAppBarItem(iconData: Iconsax.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Iconsax.flag_2, text: 'Campaign'),
          FABBottomAppBarItem(iconData: Iconsax.cup, text: 'Challenge'),
          FABBottomAppBarItem(iconData: Iconsax.user, text: 'Account'),
        ],
        backgroundColor: AppColors.white,
        color: AppColors.grey900,
        notchedShape: const CircularNotchedRectangle(),
        selectedColor: AppColors.alt700,
      ),
    );
  }
}
