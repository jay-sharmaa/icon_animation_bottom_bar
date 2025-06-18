import 'package:flutter/material.dart';
import 'package:icon_animation_bottom_bar/icon_animation_bottom_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    print('Tapped index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Selected: $selectedIndex')),
        bottomNavigationBar: IconAnimationBottomBar(
          items: [
            BottomBarItem(icon: Icons.home, label: 'Home'),
            BottomBarItem(icon: Icons.email, label: 'Search'),
            BottomBarItem(icon: Icons.settings, label: 'Alarm'),
            BottomBarItem(icon: Icons.abc, label: 'Fax'),
          ],
          selectedIndex: selectedIndex,
          onTap: _onTabTapped,
          floatingWidget: Icon(Icons.abc)
        ),
      ),
    );
  }
}
