import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/features/home/domain/product_model.dart';
import 'package:urmallng_mob_app_v1/features/home/presentation/screens/product_details_screen.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void _addToCart() {
    // Implement your add to cart functionality here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('1 item added to cart'),
        backgroundColor: AppColors.successGreen,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        animation: CurvedAnimation(
          parent: AnimationController(
            vsync: ScaffoldMessenger.of(context),
            duration: const Duration(milliseconds: 300),
          )..forward(),
          curve: Curves.easeInOut,
        ),
        // Custom dismiss direction is already set to horizontal, but to emphasize right-to-right:
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.only(right: 16, left: 100, bottom: 600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 5,
      onTap: () {
        //Handle card tap if needed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: widget.product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            const SizedBox(height: 10),
            _buildProductDetails(),
          ],
        ),
      ),
    );
  }

  // Private method to build product image and the favourite icon
  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.asset(
              widget.product.imageUrl,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          _buildFavoriteIcon(),
        ],
      ),
    );
  }

  // Private method to build the favorite icon
  Widget _buildFavoriteIcon() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.white,
        child: Icon(
          widget.product.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.product.isFavorite
              ? AppColors.primaryColor
              : AppColors.grey,
          size: 16,
        ),
      ),
    );
  }

  // Private method to build product details name, and price
  Widget _buildProductDetails() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          _buildPriceAndAddToCart(),
        ],
      ),
    );
  }

  // Private method to build price and add to cart button
  Widget _buildPriceAndAddToCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Price
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            // passed price with strikethrough
            Text(
              '\$${(widget.product.price * 1.2).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        // Add to Cart Button
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primaryColor,
          child: IconButton(
            onPressed: () {
              // Handle add to cart action
              _addToCart();
            },
            icon: const Icon(
              FluentIcons.cart_20_regular,
              size: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
