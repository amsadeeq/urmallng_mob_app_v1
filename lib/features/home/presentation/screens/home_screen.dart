import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/cart_page.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/homePage/home_page.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/products_page.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/profile_page.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/whishlist_page.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Example selected index for bottom navigation
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _pages = [
    const HomePage(),
    const CartPage(),
    const ProductsPage(),
    const WhishlistPage(),
    const ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconButton(
            icon: Image.asset(AppConstants.avatar, height: 50),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 1),
            Text(
              'AM Sadeeq',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.oFFwhite,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              icon: Icon(
                FluentIcons.search_20_filled,
                size: 25,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                print('Cart button pressed');
                // Handle cart button press
              },
            ),
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColors.oFFwhite,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Badge(
              label: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: IconButton(
                icon: Icon(
                  FluentIcons.alert_20_regular,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  print('Notification button pressed');
                  // Handle cart button press
                },
              ),
            ),
          ),
        ],

        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: AppColors.oFFwhite,
          buttonBackgroundColor: AppColors.oFFwhite,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          index: _selectedIndex,
          height: 60,
          items: [
            CurvedNavigationBarItem(
              child: Icon(
                FluentIcons.home_20_regular,
                size: _selectedIndex == 0 ? 25 : 22,
                color: _selectedIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
              ),
              labelStyle: TextStyle(
                color: _selectedIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                fontSize: 12,
              ),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Badge(
                label: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                child: Icon(
                  FluentIcons.cart_20_regular,
                  size: _selectedIndex == 1 ? 25 : 22,
                  color: _selectedIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.textPrimary,
                ),
              ),
              labelStyle: TextStyle(
                color: _selectedIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                fontSize: 12,
              ),
              label: 'Cart',
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(
                color: _selectedIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                fontSize: 12,
              ),
              child: Icon(
                FluentIcons.grid_20_regular,
                size: _selectedIndex == 2 ? 25 : 22,
                color: _selectedIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
              ),
              label: 'Products',
            ),

            CurvedNavigationBarItem(
              labelStyle: TextStyle(
                color: _selectedIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                fontSize: 12,
              ),
              child: Icon(
                FluentIcons.heart_20_regular,
                size: _selectedIndex == 3 ? 25 : 22,
                color: _selectedIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
              ),
              label: 'Wishlist',
            ),

            CurvedNavigationBarItem(
              labelStyle: TextStyle(
                color: _selectedIndex == 4
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                fontSize: 12,
              ),
              child: Icon(
                FluentIcons.person_20_regular,
                size: _selectedIndex == 4 ? 25 : 22,
                color: _selectedIndex == 4
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
              ),
              label: 'Profile',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
