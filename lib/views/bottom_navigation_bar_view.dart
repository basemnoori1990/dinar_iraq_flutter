import 'dart:async';

import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/home_view.dart';
import 'package:dinar_iraq/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'cart_shopping_view.dart';
import 'groups_view.dart';
import 'orders_view.dart';

// class MyHoomePage extends StatefulWidget {
//   MyHoomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHoomePageState createState() => _MyHoomePageState();
// }
//
// class _MyHoomePageState extends State<MyHoomePage> with TickerProviderStateMixin {
//
//   var _bottomNavIndex = 0;
//
//   late AnimationController _fabAnimationController;
//   late AnimationController _borderRadiusAnimationController;
//   late Animation<double> fabAnimation;
//   late Animation<double> borderRadiusAnimation;
//   late CurvedAnimation fabCurve;
//   late CurvedAnimation borderRadiusCurve;
//   late AnimationController _hideBottomBarAnimationController;
//
//   final iconList = <IconData>[
//     Icons.person,
//     Icons.document_scanner_outlined,
//     Icons.app_registration,
//     Icons.home_filled,
//   ];
//   final labels = <String>[
//     'الحساب',
//     'الطلبات',
//     'الاقسام',
//     'الرئيسية',
//   ];
//
//   final List<Widget> Screens = const [
//     ProfileView(),
//     OrdersView(),
//     GroupsView(),
//     HomeView(),
//   ];
//   @override
//   void initState() {
//     super.initState();
//
//     _fabAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _borderRadiusAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     fabCurve = CurvedAnimation(
//       parent: _fabAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//     borderRadiusCurve = CurvedAnimation(
//       parent: _borderRadiusAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//
//     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
//     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
//       borderRadiusCurve,
//     );
//
//     _hideBottomBarAnimationController = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );
//
//     Future.delayed(
//       Duration(seconds: 1),
//           () => _fabAnimationController.forward(),
//     );
//     Future.delayed(
//       Duration(seconds: 1),
//           () => _borderRadiusAnimationController.forward(),
//     );
//   }
//
//   bool onScrollNotification(ScrollNotification notification) {
//     if (notification is UserScrollNotification &&
//         notification.metrics.axis == Axis.vertical) {
//       switch (notification.direction) {
//         case ScrollDirection.forward:
//           _hideBottomBarAnimationController.reverse();
//           _fabAnimationController.forward(from: 0);
//           break;
//         case ScrollDirection.reverse:
//           _hideBottomBarAnimationController.forward();
//           _fabAnimationController.reverse(from: 1);
//           break;
//         case ScrollDirection.idle:
//           break;
//       }
//     }
//     return false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//        body: Screens[_bottomNavIndex],
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.MainColor,
//         child: Icon(
//           Icons.shopping_cart,
//           color: AppColors.BackgroundColor,
//         ),
//         onPressed: () {
//            CartShoppingView().launch(
//              context,
//            );
//           _fabAnimationController.reset();
//           _borderRadiusAnimationController.reset();
//           _borderRadiusAnimationController.forward();
//           _fabAnimationController.forward();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//         notchSmoothness: NotchSmoothness.defaultEdge,
//         itemCount: iconList.length,
//         tabBuilder: (int index, bool isActive) {
//           final color = isActive ? Colors.blue : AppColors.GreyColor;
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 iconList[index],
//                 size: 24,
//                 color: color,
//               ),
//               const SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Text(
//                   labels[index],
//                   maxLines: 1,
//                   style: TextStyle(color: color),
//                 ),
//               )
//             ],
//           );
//         },
//         backgroundColor: AppColors.BackgroundColor,
//         activeIndex: _bottomNavIndex,
//         splashColor: AppColors.MainColor,
//         notchAndCornersAnimation: borderRadiusAnimation,
//         splashSpeedInMilliseconds: 300,
//         gapLocation: GapLocation.center,
//         leftCornerRadius: 0,
//         rightCornerRadius: 0,
//         onTap: (index) => setState(() => _bottomNavIndex = index),
//         hideAnimationController: _hideBottomBarAnimationController,
//         shadow: BoxShadow(
//           offset: Offset(0, 1),
//           blurRadius: 12,
//           spreadRadius: 0.5,
//           color: AppColors.MarketColor,
//         ),
//       ),
//     );
//   }
// }
//
// class NavigationScreen extends StatefulWidget {
//   final IconData iconData;
//
//   NavigationScreen(this.iconData) : super();
//
//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }
//
// class _NavigationScreenState extends State<NavigationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> animation;
//
//   @override
//   void didUpdateWidget(NavigationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.iconData != widget.iconData) {
//       _startAnimation();
//     }
//   }
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//     super.initState();
//   }
//
//   _startAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.background,
//       child: ListView(
//         children: [
//           SizedBox(height: 64),
//           Center(
//             child: CircularRevealAnimation(
//               animation: animation,
//               centerOffset: Offset(80, 80),
//               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
//               child: Icon(
//                 widget.iconData,
//                 color: AppColors.GreyColor,
//                 size: 160,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class MyHoomePage extends StatefulWidget {
  const MyHoomePage({Key? key}) : super(key: key);

  @override
  State<MyHoomePage> createState() => _MyHoomePageState();
}

class _MyHoomePageState extends State<MyHoomePage> {
  int myindex = 4;
  final List<Widget> Screens = [
    ProfileView(),
    OrdersView(),
    CartShoppingView(),
    GroupsView(),
    HomeView(),
  ];
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[myindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 12),
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        backgroundColor: AppColors.BackgroundColor,
        currentIndex: myindex,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/images/personicon.png'),
              color: AppColors.GreyColor,
            ),
            label: 'الحساب',
            backgroundColor: AppColors.BackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/images/saveingicon.png'),
              color: AppColors.GreyColor,
            ),
            label: 'الطلبات',
            backgroundColor: AppColors.BackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.MainColor,
                child: Icon(
                  Icons.shopping_cart,
                  color: AppColors.BackgroundColor,
                )),
            label: '',
            backgroundColor: AppColors.BackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/images/groupsicon.png'),
              color: AppColors.GreyColor,
            ),
            label: 'الاقسام',
            backgroundColor: AppColors.BackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/images/homeicon.png'),
              color: AppColors.GreyColor,
            ),
            label: 'الرئيسية',
            backgroundColor: AppColors.BackgroundColor,
          ),
        ],
      ),
    );
  }
}
