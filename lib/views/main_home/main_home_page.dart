import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/images.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/png/main_home.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            scrollDirection: Axis.vertical,
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/originals/da/51/c2/da51c26fe3398b0f8314fee17a98e0e7.jpg'),
                    ),
                    Expanded(
                      child: Text(
                        '1226 Univercity Road',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: 16.0,
                              height: 19.0 / 16.0,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(Iconsax.notification),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
