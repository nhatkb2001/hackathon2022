import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: PageScrollPhysics(),
        slivers: [
          
        ]
      ),
    );
  }
}