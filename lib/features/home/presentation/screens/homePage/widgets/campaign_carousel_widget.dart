import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:urmallng_mob_app_v1/shared/styles/app_colors.dart';

class CampaignCarouselWidget extends StatefulWidget {
  const CampaignCarouselWidget({super.key});

  @override
  State<CampaignCarouselWidget> createState() => _CampaignCarouselWidgetState();
}

class _CampaignCarouselWidgetState extends State<CampaignCarouselWidget> {
  final PageController _controller = PageController();
  final int _itemCount = 3;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _itemCount - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 170, // Adjust height as needed
            child: PageView.builder(
              controller: _controller,
              // scrollDirection: Axis.horizontal,
              itemCount: _itemCount, // Number of campaign banners
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 230, 230),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Ramadan offer! \nBanner ${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                            ),
                            onPressed: () {
                              // Handle button press
                            },
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Image.asset(
                        'assets/images/c$index.png', // Replace with actual image paths
                        width: 150,
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            onDotClicked: (index) {
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            effect: const WormEffect(
              paintStyle: PaintingStyle.stroke,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 8,
              dotWidth: 8,
              type: WormType.thin,
            ),
          ),
        ],
      ),
    );
  }
}
