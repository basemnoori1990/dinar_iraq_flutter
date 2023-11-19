import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HomeViewModel {
  String searchhome = 'ابحث عن المتجر او القطعة';
  String hintsearchsheet = 'قم بالبحث عن شركة';
  String company = 'الشركـــــــــــات';
  String groups = 'مجموعة العصائر والمشروب';
  String subtitle = 'متوفر جميع منتجات الو' ;
  String viewmore = 'عرض المزيد';
  String olma = 'شركة اولمة';
  String ctcat = 'شركة كتكاك';
  String soda = 'شركةمياه غازي';
  String Healthy = 'صحـــة';
  String Bread = 'مخــابز';
  String resturants = 'مطاعــم';
  String More = 'عرض المـزيد';
  String explain = 'جرب افضل الاختيارات التي قمنا ختي';
  IconData iconbar = Icons.filter_list_alt;
  String BurgerImage = 'assets/images/burger.png';
  String Soda = "assets/images/bags.png";
  String Bags = "assets/images/bags.png";
  String Bagbread = "assets/images/bagbread.png";
  String Heart = "assets/images/heart.png";
  String Market = "assets/images/market.png";
  String MoreImage = "assets/images/more.png";
  String SliderImage = "assets/images/imageslider.png";
  String Filter = "assets/images/filter.jpg";
  String Juice = "assets/images/juice.png";
  IconData iconsearch = Icons.search;
  IconData rowIcon = Icons.arrow_back_ios;
}

class contanerWidgetGrid extends StatelessWidget {
  final String img, txt;
  final Color clr;
  const contanerWidgetGrid(
      {Key? key, required this.img, required this.txt, required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
      child: Container(
        height: 0.12 * h,
        width: 0.24 * w,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: h * 0.06,
            ),
            Text(
              txt,
              style: TextStyle(
                color: AppColors.BlackColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewContaner extends StatelessWidget {
  final String img, title, subtitle;
  const ListViewContaner(
      {Key? key,
      required this.img,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: AppColors.BackgroundColor,
        child: Column(
          children: [
            Image.asset(
              img,
              height: 0.14 * h,
              width: w*.45,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.BlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.GreyColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.MainColor,
                  size: 14,
                ),
                SizedBox(
                  width: 0.08*w,
                ),
                Container(
                  width: 0.18*w,
                  height: 0.03*h,
                  decoration: BoxDecoration(
                    color: AppColors.FoshyColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      '20% خصم',
                      style: TextStyle(
                        color: AppColors.RedColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContanerBottomSheetWidget extends StatelessWidget {
  final String title , subtitle , img ;
  const ContanerBottomSheetWidget({Key? key, required this.title, required this.subtitle, required this.img}) : super(key: key);

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