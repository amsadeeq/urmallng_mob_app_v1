import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:urmallng_mob_app_v1/features/home/domain/product_model.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  int _selectedImageIndex = 0;
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImageCarousel(),
            _buildProductInfo(),
            _buildSizeAndQuantity(),
            _buildDescription(),
            _buildReviewsSummary(),
            _buildRecommendedProducts(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // App bar with back button, wishlist, and share icons
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Product Details',
        style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(AppColors.primaryColor),
            iconSize: WidgetStateProperty.all(20),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(AppColors.primaryColor),
            iconSize: WidgetStateProperty.all(20),
          ),
        ),
      ],
    );
  }

  // Product image carousel
  Widget _buildProductImageCarousel() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: 3,
        onPageChanged: (index) {
          // Handle page change if needed
          setState(() {
            _selectedImageIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            widget.product.imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
          );
        },
      ),
    );
  }

  // Product Info
  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
        ],
      ),
    );
  }

  // Size selection and quantity adjustment
  Widget _buildSizeAndQuantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildSizeSelector(), _buildQuantitySelector()],
      ),
    );
  }

  Widget _buildSizeSelector() {
    return const Text('Size options will go here');
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(FluentIcons.subtract_24_regular),
          onPressed: () {
            if (_quantity > 1) {
              setState(() {
                _quantity--;
              });
            }
          },
        ),
        Text('$_quantity', style: const TextStyle(fontSize: 18)),
        IconButton(
          icon: const Icon(FluentIcons.add_24_regular),
          onPressed: () {
            setState(() {
              _quantity++;
            });
          },
        ),
      ],
    );
  }

  // Product description with expand/collapse

  Widget _buildDescription() {
    // You'll need to define your product description text
    const String longDescription = "Your product description goes here...";
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            widget.product.description ?? longDescription,
            maxLines: _isDescriptionExpanded ? null : 3,
            overflow: TextOverflow.fade,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isDescriptionExpanded = !_isDescriptionExpanded;
              });
            },
            child: Text(_isDescriptionExpanded ? 'See Less' : 'See More'),
          ),
        ],
      ),
    );
  }

  // Reviews summary section
  Widget _buildReviewsSummary() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Reviews summary will go here.'),
    );
  }

  // Recommended products section

  Widget _buildRecommendedProducts() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Recommended products carousel will go here.'),
    );
  }

  // Bottom bar with Add to Cart and Buy Now buttons
  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}
