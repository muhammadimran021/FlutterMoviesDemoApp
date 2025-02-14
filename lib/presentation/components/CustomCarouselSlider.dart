import 'package:flutter/material.dart';
import 'package:my_movie_app/data/models/TopRatedMoviesRootModel.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<Result> images;
  final double height;

  const CustomCarouselSlider({
    super.key,
    required this.images,
    this.height = 200.0,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              bool isActive = index == _currentIndex;
              return _buildCarouselItem( 'https://image.tmdb.org/t/p/w500/${widget.images[index].posterPath!}', isActive);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(String imageUrl, bool isActive) {
    double scale = isActive ? 1.0 : 0.8;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Transform.scale(
          scale: scale,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.images.length,
        (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}
