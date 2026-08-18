import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/home_screen.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Placeholder screens for the tabs
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // You need to create this
    const Center(child: Text('Categories Page')),
    const Center(child: Text('Cart Page')),
    const Center(child: Text('Orders Page')),
    const Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            activeIcon: Icon(FluentIcons.home_24_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.grid_24_regular),
            activeIcon: Icon(FluentIcons.grid_24_filled),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.cart_24_regular),
            activeIcon: Icon(FluentIcons.cart_24_filled),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.box_24_regular),
            activeIcon: Icon(FluentIcons.box_24_filled),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_24_regular),
            activeIcon: Icon(FluentIcons.person_24_filled),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textSecondary,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }
}
