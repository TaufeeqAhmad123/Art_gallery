import 'package:animate_do/animate_do.dart';
import 'package:art_gallery/const/appExtension.dart';
import 'package:art_gallery/const/text_style.dart';
import 'package:art_gallery/views/explore.dart';
import 'package:art_gallery/widget/app_gradient.dart';
import 'package:art_gallery/widget/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradient(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              14.vspace,
              Padding(
                padding: kPagePadding,
                child: FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(CupertinoIcons.cube_box, color: Colors.white),
                      Icon(CupertinoIcons.shopping_cart, color: Colors.white),
                    ],
                  ),
                ),
              ),
              15.vspace,
              Padding(
                padding: kPagePadding,
                child: FadeInRight(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'Share your art with',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: kPagePadding,
                child: FadeInLeft(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'wonderful world! 🖌️🎨',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 1.h),
                child: FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'Your art is style and now you can share\nart with your friends and unknown people',
                    style: GoogleFonts.poppins(
                      color: Colors.white38,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              20.vspace,
              Padding(
                padding: kPagePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      child: Text(
                        'Popular Art',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: TextButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ExploreView()));
                        },
                       child :Text( 'See all',
                        style: subtitleStyle(
                          context,
                        ).copyWith(color: Colors.white70),)
                      ),
                    ),
                  ],
                ),
              ),
              10.vspace,
             ProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
