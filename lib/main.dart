import 'package:flutter/material.dart';
import 'package:hackathon2022/constants/colors.dart';
import 'package:hackathon2022/views/screens/speech_text.dart';
import 'package:hackathon2022/views/screens/speech_text_recognizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
      home: SpeechText(),
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
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  String _lastSelected = 'TAB: 0';

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
            Text(
              _speechToText.isListening
                  ? '$_lastWords'
                  : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          _speechToText.isNotListening ? _startListening : _stopListening;
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
