import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/homePage/widgets/campaign_carousel_widget.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/homePage/widgets/categories_widget.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/homePage/widgets/products_widget.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/homePage/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchBarWidget(),
              CampaignCarouselWidget(),
              const SizedBox(height: 20),
              CategoriesWidget(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Featured Products',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
