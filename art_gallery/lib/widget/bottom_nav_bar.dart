import 'package:art_gallery/views/home.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [
    HomeView(),
    const Center(child: Text('Chart Page')),
    const Center(child: Text('Category Page')),
    const Center(child: Text('Home Page')),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          // color: Colors.black54,
        ),
        // padding: const EdgeInsets.all(10),
        //margin: const EdgeInsets.all(10),
        child: NavigationView(
          onChangePage: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          curve: Curves.fastEaseInToSlowEaseOut,
          durationAnimation: const Duration(milliseconds: 400),
          backgroundColor: Colors.black,
          borderTopColor: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),

          color: Colors.orange.withOpacity(.4),
          items: [
            // Home
            ItemNavigationView(
              childAfter: Icon(
                IconlyBold.home,
                color: Colors.orange.withOpacity(.5),
                size: 35,
              ),
              childBefore: Icon(
                IconlyBold.home,
                color: theme.dialogBackgroundColor,
                size: 30,
              ),
            ),

            // Explore
            ItemNavigationView(
              childAfter: Icon(
                IconlyBold.category,
                color: Colors.orange.withOpacity(.5),
                size: 35,
              ),
              childBefore: Icon(
                IconlyBold.category,
                color: theme.dialogBackgroundColor,
                size: 30,
              ),
            ),

            // Chart
            ItemNavigationView(
              childAfter: Icon(
                IconlyBold.chart,
                color: Colors.orange.withOpacity(.5),
                size: 35,
              ),
              childBefore: Icon(
                IconlyBold.chart,
                color: theme.dialogBackgroundColor,
                size: 30,
              ),
            ),

            // Profile
            ItemNavigationView(
              childAfter: Icon(
                IconlyBold.profile,
                color: Colors.orange.withOpacity(.5),
                size: 35,
              ),
              childBefore: Icon(
                IconlyBold.profile,
                color: theme.dialogBackgroundColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
