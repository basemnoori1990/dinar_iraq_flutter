import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ProfileModelView{
  String title = 'الحساب';
  String namePerson = 'باسم باسم';
  String nameMarket = 'معرض دينار';
  String namelocation = 'العراق - بغداد';
  String deleteText = 'حذف الحساب';
  String loginText = 'تسجيل الدخول / انشاء حساب';
  IconData personIcn = Icons.person;
  IconData loginIcn = Icons.login;
  IconData marketIcn = Icons.shopping_cart;
  IconData locationIcn = Icons.location_on;
  IconData deleteIcn = Icons.delete_forever;
}

class RowWidgetProfile extends StatelessWidget {
  final String txt ;
  final IconData icn;
  const RowWidgetProfile({Key? key, required this.txt, required this.icn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Container(
      height:0.08*h,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: AppColors.FoshyColor),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.white.withOpacity(0.5),
        //     spreadRadius: 3,
        //     blurRadius: 0,
        //     offset: const Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(txt,style: TextStyle(
              color: AppColors.BlackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              width: 0.05*w,
            ),
            Icon(icn,size: 25,color: AppColors.MainColor,),
          ],
        ),
      ),
    );
  }
}
