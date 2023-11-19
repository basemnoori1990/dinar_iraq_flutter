import 'package:dinar_iraq/model/counter_model.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AddCartModelView{
  String smoothie = 'assets/images/smoothie.png';
  String mangoCup = 'assets/images/mangocup.png';
  String title = 'عصير راني زجاي';
  String subtitle = 'عصير يحتوى على فواكه كثيرة ويتم خلطها مع بعضها البعض';
  String price = '3.22\$';
  String nkhat = 'النكهات';
  String orangeTxt = 'برتقال , جزر';
  String notes = 'ملاحظات اخرى';
  String productOffer = 'فرض مع المنتج';
  String hintTxt = 'اكتب ملاحظاتك';
  String numTotal = 'الاعدادبالجملة';
  String numIndividual = 'الاعدادبالمفرد';
  String amountTotal = '  الكمية بالجمل';
  String amountIndividual = '  الكمية بالمفر';
  String priceTotal = 'السعربالجملة';
  String priceIndividual = 'سعربالمفرد';
  String addToCart = 'اضافه السعر بالجمله';
  String nameProduct = 'اسم المنتج';
  String numProduct = 'عدد المنتج';
  String priceProduct = 'سعر المنتج';
  IconData shareIcon = Icons.ios_share;
  IconData favIcon = Icons.favorite;
  IconData backIcon = Icons.arrow_forward;
  IconData shoppingIcon = Icons.shopping_cart;
  IconData addIcon = Icons.add;
  IconData minusIcon = Icons.minimize;
  //counter
  //counter
  CounterModel counterModel = CounterModel();

 getCounter(){
   return counterModel.counter;
 }
 inc(){
   counterModel.counter++;
 }
  dec(){
    counterModel.counter--;
  }
  getWholeCounter(){
    return counterModel.wholeCounter;
  }
  incWhole(){
    counterModel.wholeCounter++;
  }
  decWhole(){
    counterModel.wholeCounter--;
  }
}

class AvatarIcon extends StatelessWidget {
  final IconData icn;
  final Color clr ;
  const AvatarIcon({Key? key, required this.icn, required this.clr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: AppColors.MainColor,
        radius: 17,
        child: Center(
            child: Icon(
              icn,
              color: clr,
            )));
  }
}