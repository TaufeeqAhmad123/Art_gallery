import 'package:animate_do/animate_do.dart';
import 'package:art_gallery/const/appExtension.dart';
import 'package:art_gallery/const/const.dart';
import 'package:art_gallery/model/productmodel.dart';
import 'package:art_gallery/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  int? hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[300],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          10.vspace,
          Expanded(
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 7,

              itemCount: exploreProducts.length,
              itemBuilder: (context, index) {
                final imageData = exploreProducts[index];

                return GestureDetector(
                  onLongPress: () {
                    openDialog(imageData, profile);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailView(product: imageData, index: index),
                      ),
                    );
                  },
                  child: FadeIn(
                    delay: Duration(milliseconds: index * 100),
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(imageData.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void openDialog(final Product imageData, final String profile) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Pic and Name
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(profile),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Mike Zungiya',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Main Image
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(imageData.imageUrl, fit: BoxFit.cover),
              ),

              // Action Row
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border_outlined, color: Colors.black),
                    Icon(Icons.person_add_alt_1_outlined, color: Colors.black),
                    Icon(Icons.send_outlined, color: Colors.black),

                    Icon(Icons.bookmark_border, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
