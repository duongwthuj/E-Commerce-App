import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TCarouselSlider extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final Duration autoScrollDuration;
  final bool autoScroll;
  final EdgeInsetsGeometry padding;

  const TCarouselSlider({
    super.key,
    required this.items,
    this.height = 200,
    this.autoScrollDuration = const Duration(seconds: 3),
    this.autoScroll = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  });

  @override
  State<TCarouselSlider> createState() => _TCarouselSliderState();
}

class _TCarouselSliderState extends State<TCarouselSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.autoScroll) {
      _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
        if (_pageController.hasClients) {
          _currentPage = (_currentPage + 1) % widget.items.length;
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.padding,
                child: widget.items[index],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.items.length,
          effect: WormEffect(
            dotColor: Colors.grey,
            activeDotColor: Theme.of(context).primaryColor,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}
