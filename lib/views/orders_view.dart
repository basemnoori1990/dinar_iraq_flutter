import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../views_model/order_model_view.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {

  var offersData = OrdersModelView();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        title: Text(offersData.title,style: TextStyle(
          color: AppColors.BlackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text('لا توجد طلبات الان',style: TextStyle(
          color: AppColors.BlackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
