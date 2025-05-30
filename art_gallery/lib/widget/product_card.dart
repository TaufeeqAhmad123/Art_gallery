import 'package:art_gallery/const/const.dart';
import 'package:art_gallery/model/productmodel.dart';
import 'package:art_gallery/views/detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late PageController pageController;
  int currentPage = 0;
  double pageOffset = 0.0;
  @override
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: .7);
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: PageView.builder(
        controller: pageController,
        itemCount: productList.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    final product = productList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(product: product, index: index),
          ),
        );
      },
      child: UnconstrainedBox(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: currentPage == index ? 47.h : 35.h,
          width: currentPage == index ? 270 : 180,
          child: Stack(
            children: [
              Hero(
                tag: product.name,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Text(
                        product.name,
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Positioned(
                        top: 3.h,
                        child: Text(
                          'Vintage Art ',
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 44.w,
                        top: 5.h,
                        child: Container(
                          height: 6.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                          ),
                          child: Icon(
                            CupertinoIcons.cart,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7.h,
                        child: Row(
                          children: [
                            for (int i = 0; i < randomImages.length; i++)
                              Align(
                                widthFactor: 0.8,
                                child: CircleAvatar(
                                  radius: 15.sp,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      randomImages[i],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
