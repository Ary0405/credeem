import 'package:flutter/material.dart';
import 'package:loyalty_app/screens/history_screen.dart';
import 'package:loyalty_app/screens/settings_screen.dart';
import 'package:loyalty_app/screens/store_screen_temp.dart';
import 'package:loyalty_app/screens/swap_screen.dart';

import '../custom_icons.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const StoreScreenTemp(),
    const Historyscreen(),
    const SwapScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // to keep the size, when opening the keyboard
      body: screens[_selectedIndex],
      backgroundColor: const Color(0xff0D1127),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: const Color(0xFF151517),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFE0E063),
        unselectedItemColor: const Color(0xFF838383),
        iconSize: 36,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              CustomIcons.star_7,
            ),
            label: 'Points',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.history,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.swap,
            ),
            label: 'Swap',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.profile,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
