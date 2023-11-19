import 'package:dinar_iraq/constants/colors.dart';
import 'package:flutter/material.dart';

class CompaniesModelView{
  String BurgerImage = 'assets/images/burger.png';
  String Bags = "assets/images/bags.png";
  String Heart = "assets/images/heart.png";
  String Market = "assets/images/market.png";
  String title = 'الشركـــات';
  String hintTextField = 'قم بالبحث عن شركة';
  String Healthy = 'صحـــة';
  String Resturant = 'مطاعــــم';
  String subtitleResturant = 'تصفح افضل المطاعم القريبة'  ;
  String Markets = 'متاجـــــــر';
  String Shopping = 'تســــوق';
  IconData iconBack = Icons.arrow_back_outlined;
  IconData iconSearch = Icons.search;
}

class ContanerCompanyWidget extends StatelessWidget {
  final String title , subtitle , img ;
  const ContanerCompanyWidget({Key? key, required this.title, required this.subtitle, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Container(
      height: 0.08*h,
      width: .9*w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.GreyColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(
                color: AppColors.BlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
              Text(subtitle,style: TextStyle(
                color: AppColors.GreyColor,
                fontSize: 14,
              ),),
            ],
          ),
          Image.asset(img,height: 0.08*h,),
        ],
      ),
    );
  }
}
