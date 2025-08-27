import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/core/constants/app_constants.dart';
import 'package:urmallng_mob_app_v1/features/home/domain/product_model.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/widgets/product_card.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({super.key});

  final List<Product> products = const [
    Product(
      id: '1',
      name: 'Wireless Headphones',
      imageUrl: AppConstants.product1,
      price: 99.99,
      description: 'High-quality wireless headphones with noise cancellation.',
      isFavorite: false,
    ),
    Product(
      id: '2',
      name: 'Smart Watch',
      imageUrl: AppConstants.product2,
      price: 149.99,
      description: 'A sleek smart watch with fitness tracking features.',
      isFavorite: false,
    ),
    Product(
      id: '3',
      name: 'Gaming Mouse',
      imageUrl: AppConstants.product3,
      price: 59.99,
      description: 'Ergonomic gaming mouse with customizable buttons.',
      isFavorite: false,
    ),
    Product(
      id: '4',
      name: '4K Monitor',
      imageUrl: AppConstants.product4,
      price: 399.99,
      description: 'A high-resolution 4K monitor for stunning visuals.',
      isFavorite: false,
    ),
    Product(
      id: '5',
      name: 'Bluetooth Speaker',
      imageUrl: AppConstants.product5,
      price: 79.99,
      description: 'Portable Bluetooth speaker with deep bass.',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and "See All" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Products',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              // Using a TextButton for better UX
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to the ProductsPage
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Horizontal list of product cards
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            // Only apply horizontal padding to the ListView itself
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                // Apply symmetric padding for spacing between cards
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 160,
                    height: double.infinity,
                    child: ProductCard(product: product),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
