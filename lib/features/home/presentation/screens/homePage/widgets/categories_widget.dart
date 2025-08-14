import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Number of categories
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle category button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                        right: Radius.circular(50),
                      ),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Category ${index + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
