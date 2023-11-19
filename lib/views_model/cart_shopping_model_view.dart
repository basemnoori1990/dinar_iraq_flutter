import 'package:flutter/material.dart';

import '../model/counter_model.dart';

class CartShoppingModelView{
  String titleappBar = 'ســـلة المشــتريات';
  String mangooJuice = 'عصير مانجا';
  String discribeText = 'عصائر الروابي';
  String price = '\$35.29';
  String hintDisc = 'ادخل كود الخصم';
  String apply = 'تطبيق';
  String totalTitle = 'اجمالي الطلبي';
  String sumPrice = 'مجموع الشراء';
  String discPrice = 'سعرالخصم';
  String dliveryPrice = 'سعرالتوصيل';
  String servicePrice = 'رسوم الخدمة';
  String complete = 'اتمام عملية الشراء';
  String mangoCup = 'assets/images/mangocup.png';
  IconData addIcon = Icons.add;
  IconData minusIcon = Icons.minimize;
  IconData shoppingIcon = Icons.shopping_cart;
  IconData discountIcon = Icons.discount;
  IconData deleteIcon = Icons.delete_rounded;

  var counterModl = CounterModel();

  getCounter(){
    return counterModl.counter;
  }
  inc(){
    counterModl.counter++;
  }
  dec(){
    counterModl.counter--;
  }
}