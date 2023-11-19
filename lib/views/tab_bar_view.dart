import 'package:dinar_iraq/constants/colors.dart';
import 'package:flutter/material.dart';

import '../views_model/tab_bar_model_view.dart';


class TabBaarView extends StatelessWidget {
  TabBaarView({super.key});

  var tabBarData = TabBarModelView();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
            leading: SizedBox(
              height: h * 0.06,
              width: w*0.8,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  prefixIcon: Icon(
                    tabBarData.searchIcon,
                    color: AppColors.GreyColor,
                    size: 25,
                  ),
                  focusColor: Colors.grey[100],
                  hintText: tabBarData.hintText,
                  hintTextDirection: TextDirection.rtl,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
              leadingWidth: 0.8* w,
              elevation: 0,
              backgroundColor: AppColors.BackgroundColor,
              actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    tabBarData.backIcon,
                    color: AppColors.MainColor,
                  )),
            ],
            bottom:  TabBar(
              indicatorColor: AppColors.MainColor,
                isScrollable: true,
                tabs: <Widget>[
                   Text(tabBarData.drinks,style: TextStyle(
                       color: AppColors.BlackColor,
                       fontWeight: FontWeight.bold,
                     ),),
                   Text(tabBarData.water,style: TextStyle(
                     color: AppColors.BlackColor,
                     fontWeight: FontWeight.bold,
                   )),
                   Text(tabBarData.powerdrinks,style: TextStyle(
                     color: AppColors.BlackColor,
                     fontWeight: FontWeight.bold,
                   )),
                   Text(tabBarData.packetJuice,style: TextStyle(
                     color: AppColors.BlackColor,
                     fontWeight: FontWeight.bold,
                   )),
                  Text(tabBarData.naturalJuices,style: TextStyle(
                    color: AppColors.BlackColor,
                    fontWeight: FontWeight.bold,
                  )),
                 ],
              ),
            ),
            body:  TabBarView(
              children: [
                SodaDrinks(),
                WaterDrink(),
                PowerDrinks(),
                PacketJuices(),
                NaturalDrinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}