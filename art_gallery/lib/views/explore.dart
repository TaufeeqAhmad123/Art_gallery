import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final List<String> imageUrls = [
    'assets/art1.jpg',
    'assets/art1.jpg',
    'assets/art3.jpg',
    'assets/art4.jpg',
    'assets/art5.jpg',
    'assets/art6.jpg',
    'assets/art7.jpg',
    'assets/earth.jpg',
    'assets/mountain.jpg',
    'assets/mountain1.jpg',
    'assets/mountain2.jpg',
  ];
final List<Map<String, String>> imageList = [
    {"image": "assets/art1.jpg", "name": "Art by Anna"},
    {"image": "assets/art1.jpg", "name": "Sunset Vibes"},
    {"image": "assets/art3.jpg", "name": "Modern Deco"},
    {"image": "assets/art7.jpg", "name": "Urban Style"},
    {"image": "assets/art5.jpg", "name": "Gallery Glow"},
    {"image": "assets/art4.jpg", "name": "Abstract Flow"},
    {"image": "assets/art6.jpg", "name": "Abstract Flow"},
  ];
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 7,
            
            itemCount: imageList.length,
              itemBuilder: (context, index) {
                 final imageData = imageList[index];
                
             return  MouseRegion(
              onEnter: (_) => setState(() => hoveredIndex = index),
              onExit: (_) => setState(() => hoveredIndex = null),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageData["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (hoveredIndex == index)
                    Positioned(
                      top: 8,
                      left: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          imageData["name"]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
              },
            ),
          ),
        ],
      ),
    );
  }
}
