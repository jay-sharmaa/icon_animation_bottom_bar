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
            BottomBarItem(icon: Icons.alarm, label: 'Alarm'),
            BottomBarItem(icon: Icons.person, label: 'Person'),
          ],
          selectedIndex: selectedIndex,
          onTap: _onTabTapped,
          floatingWidget: Image.asset('assets/example.jpg', scale: 12,), 
          iconSelectedColor: Colors.blueAccent,
          iconColor: Colors.black,
          textSelectedColor: Colors.blue,
          textColor: Colors.black,
          verticalPadding: 6,
          bottomBarHeight: 84,
          alignParameter: 15,
        ),
      ),
    );
  }
}
