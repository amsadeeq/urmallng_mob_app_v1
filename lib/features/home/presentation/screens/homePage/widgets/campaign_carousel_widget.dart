import 'dart:async';

import 'package:flutter/material.dart';

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
      child: SizedBox(
        height: 150, // Adjust height as needed
        child: PageView.builder(
          controller: _controller,
          // scrollDirection: Axis.horizontal,
          itemCount: _itemCount, // Number of campaign banners
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Campaign Banner ${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
    );
  }
}
