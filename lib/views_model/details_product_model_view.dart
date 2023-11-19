import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../views/add_to_cart_view.dart';
import '../views/cart_shopping_view.dart';
import '../views/product_detail_view.dart';

class DetailsProductsModelView {
  String title = 'عصائر راني';
  String subtitle = 'هو عبارة عن محل للعصائر يقوم ببيع جميع انواع العصائر ';
  String rateGroup = 'قيم المجموعة';
  String products = 'المنتجات التي عليها خصومات';
  String textmango = 'عصير مانجا';
  String discount = 'خصم%20';
  String textraniGlasses = 'عصير راني زجاج';
  String discribJuice = 'موز,حليب ,خوخ,موز,تفاح';
  String price = '3.22\$';
  String juices = 'assets/images/juice.png';
  String Imgmango = 'assets/images/freshMango.png';
  String Imgsoda = 'assets/images/soda.png';
  IconData searchIcon = Icons.search;
  IconData starIcon = Icons.star;
  IconData shareIcon = Icons.ios_share;
  IconData favIcon = Icons.favorite_border;
}

class AvatarIcon extends StatelessWidget {
  final IconData icn;
  const AvatarIcon({Key? key, required this.icn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: AppColors.MainColor,
        radius: 17,
        child: Center(
            child: Icon(
          icn,
          color: AppColors.BackgroundColor,
        )));
  }
}

class ContaiverListViewWidget extends StatelessWidget {
  final String img, title, prise;
  const ContaiverListViewWidget(
      {Key? key, required this.img, required this.title, required this.prise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 0.25 * h,
      width: 0.4 * w,
      child: Column(
        children: [
          Image.asset(
            img,
            width: 0.38 * w,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.BlackColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  prise,
                  style: TextStyle(
                    color: AppColors.MainColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerJuicesWidget extends StatelessWidget {
  final String img, title, subtitle, prise;
  const ContainerJuicesWidget(
      {Key? key,
      required this.img,
      required this.title,
      required this.prise,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: (){
          const AddToCartView().launch(context);
        },
        child: Container(
          height: 0.11* h,
          width: 0.9 * w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.GreyColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  img,
                  height: 0.15*h,
                  width: 0.2 * w,
                ),
               Column(
                 children: [
                   Text(
                     title,
                     style: TextStyle(
                       color: AppColors.BlackColor,
                       fontSize: 14,
                     ),
                   ),
                   SizedBox(
                     height: 0.01*h,
                   ),
                   Text(
                     subtitle,
                     style: TextStyle(
                       color: AppColors.GreyColor,
                       fontSize: 12,
                     ),
                   ),
                   SizedBox(
                     height: 0.01*h,
                   ),
                   Text(
                     prise,
                     style: TextStyle(
                       color: AppColors.MainColor,
                       fontSize: 12,
                     ),
                   ),
                 ],
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
