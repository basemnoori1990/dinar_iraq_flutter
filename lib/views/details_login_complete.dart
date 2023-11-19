import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';

import '../views_model/detalis_login_model_view.dart';

class DetailsLoginView extends StatefulWidget {
  const DetailsLoginView({Key? key}) : super(key: key);

  @override
  State<DetailsLoginView> createState() => _DetailsLoginViewState();
}

class _DetailsLoginViewState extends State<DetailsLoginView> {
  var detailsData = DetailsLoginModelView();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        elevation: 0,
        title: Text(detailsData.title,style: TextStyle(
          color: AppColors.BlackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0,left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.05*h,
              ),
              SizedBox(
                height: h * 0.07,
                width: w ,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    focusColor: Colors.grey[100],
                    hintText: detailsData.hintName,
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(detailsData.personIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.05*h,
              ),
              SizedBox(
                height: h * 0.07,
                width: w ,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    focusColor: Colors.grey[100],
                    hintText: detailsData.hintPassword,
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(detailsData.lockIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.05*h,
              ),
              SizedBox(
                height: h * 0.07,
                width: w ,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    focusColor: Colors.grey[100],
                    hintText: detailsData.hintMarket,
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(detailsData.shopIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.05*h,
              ),
              SizedBox(
                height: h * 0.07,
                width: w ,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    focusColor: Colors.grey[100],
                    hintText: detailsData.hintlocation,
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(detailsData.locationIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.05*h,
              ),
              Container(
                height: h * 0.07,
                width: w ,
                decoration: BoxDecoration(
                  color: AppColors.MainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      MyHoomePage().launch(
                        context,
                      );
                    },
                    child: Text(detailsData.apply,style: TextStyle(
                        color: AppColors.BackgroundColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
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
