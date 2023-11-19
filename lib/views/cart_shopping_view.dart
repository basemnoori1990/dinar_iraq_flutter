import 'dart:convert';
import 'package:dinar_iraq/constants/apis.dart';
import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../views_model/cart_shopping_model_view.dart';
import 'completly_buing_view.dart';

class CartShoppingView extends StatefulWidget {
  const CartShoppingView({Key? key}) : super(key: key);

  @override
  State<CartShoppingView> createState() => _CartShoppingViewState();
}

class _CartShoppingViewState extends State<CartShoppingView>
    with BaseRepository {
  @override
  void initState() {
    getData();
    super.initState();
  }

  CartResponse? cartResponse;
  bool isLoading = false;
  var shoppingData = CartShoppingModelView();
  void getData() async {
    setState(() {
      isLoading = true;
    });
    String result = await dio.getRequest(ApisDinar.cartENDPOINT, headers: {
      "Authorization":
          "Bearer ${Provider.of<UserProvider>(context, listen: false).user!.token!}",
    });
    cartResponse = CartResponse.fromJson(json.decode(result));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        title: Text(
          shoppingData.titleappBar,
          style: TextStyle(
            color: AppColors.BlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              shoppingData.shoppingIcon,
              color: AppColors.BlackColor,
            )),
      ),
      body:isLoading? const Center(
        child: CupertinoActivityIndicator(),
      ):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
             Column(
               children:cartResponse!.cart.map((e) => Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         children: [
                           IconButton(
                               onPressed: () {},
                               icon: Icon(
                                 shoppingData.deleteIcon,
                                 color: AppColors.RedColor,
                               )),
                           Row(
                             children: [
                               SizedBox(
                                 width: 0.01 * w,
                               ),
                               // GestureDetector(
                               //   onTap: () {
                               //     setState(() {
                               //       shoppingData.dec();
                               //     });
                               //   },
                               //   child: CircleAvatar(
                               //       radius: 12,
                               //       backgroundColor: Colors.grey[300],
                               //       child: Center(
                               //         child: Padding(
                               //           padding: const EdgeInsets.only(bottom: 8.0),
                               //           child: Icon(
                               //             shoppingData.minusIcon,
                               //             size: 15,
                               //             color: AppColors.BlackColor,
                               //           ),
                               //         ),
                               //       )),
                               // ),
                               // SizedBox(
                               //   width: 0.02 * w,
                               // ),
                               Text("الكميه ${e.quantity.split(".").first}"),
                               // SizedBox(
                               //   width: 0.02 * w,
                               // ),
                               // GestureDetector(
                               //   onTap: () {
                               //     setState(() {
                               //       shoppingData.inc();
                               //     });
                               //   },
                               //   child: CircleAvatar(
                               //       radius: 12,
                               //       backgroundColor: Colors.grey[300],
                               //       child: Center(
                               //           child: Icon(
                               //         shoppingData.addIcon,
                               //         size: 15,
                               //         color: AppColors.MainColor,
                               //       ))),
                               // ),
                             ],
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Column(
                             children: [
                               Text(
                                 e.product.productName??"",
                                 style: TextStyle(
                                   color: AppColors.BlackColor,
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(
                                 e.product.description??"",
                                 style: TextStyle(
                                   color: AppColors.GreyColor,
                                   fontSize: 14,
                                 ),
                               ),
                               Text(
                                 e.price.split(".").first,
                                 style: TextStyle(
                                   color: AppColors.RedColor,
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ],
                           ),
                           Image.asset(
                             shoppingData.mangoCup,
                             height: 0.1 * h,
                           ),
                         ],
                       ),
                     ],
                   ),
                   const Divider(
                     thickness: 3,
                   ),
                 ],
               )).toList(),
             ),

              ////////////////
              SizedBox(
                height: 0.04 * h,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: DottedBorder(
                  color: AppColors.MainColor, //color of dotted/dash line
                  strokeWidth: 2, //thickness of dash/dots
                  dashPattern: const [10, 6],
                  //dash patterns, 10 is dash width, 6 is space width
                  child: SizedBox(
                    //inner container
                    height: 0.08 * h, //height of inner container
                    width: w,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 0.05 * h,
                            width: 0.25 * w,
                            decoration: BoxDecoration(
                              color: AppColors.MainColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  shoppingData.apply,
                                  style: TextStyle(
                                    color: AppColors.BackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                            width: w * 0.6,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                fillColor: Colors.grey[100],
                                filled: true,
                                suffixIcon: Icon(
                                  shoppingData.discountIcon,
                                  color: AppColors.MainColor,
                                ),
                                focusColor: Colors.grey[100],
                                hintText: shoppingData.hintDisc,
                                hintTextDirection: TextDirection.rtl,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //width to 100% match to parent container.
                  ),
                ),
              ),
              SizedBox(
                height: 0.04 * h,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: DottedBorder(
                  color: AppColors.MainColor, //color of dotted/dash line
                  strokeWidth: 2, //thickness of dash/dots
                  dashPattern: const [10, 6],
                  //dash patterns, 10 is dash width, 6 is space width
                  child: SizedBox(
                    //inner container
                    height: 0.08 * h, //height of inner container
                    width: w,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 0.05 * h,
                            width: 0.25 * w,
                            decoration: BoxDecoration(
                              color: AppColors.MainColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  shoppingData.apply,
                                  style: TextStyle(
                                    color: AppColors.BackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.05,
                            width: w * 0.6,
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                fillColor: Colors.grey[100],
                                filled: true,
                                suffixIcon: Icon(
                                  shoppingData.discountIcon,
                                  color: AppColors.MainColor,
                                ),
                                focusColor: Colors.grey[100],
                                hintText: shoppingData.hintDisc,
                                hintTextDirection: TextDirection.rtl,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ), //width to 100% match to parent container.
                  ),
                ),
              ),
              SizedBox(
                height: 0.05 * h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    shoppingData.totalTitle,
                    style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingData.price,
                    style: TextStyle(
                      color: AppColors.RedColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    shoppingData.sumPrice,
                    style: TextStyle(
                      color: AppColors.MainColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingData.price,
                    style: TextStyle(
                      color: AppColors.RedColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    shoppingData.discPrice,
                    style: TextStyle(
                      color: AppColors.MainColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingData.price,
                    style: TextStyle(
                      color: AppColors.RedColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    shoppingData.dliveryPrice,
                    style: TextStyle(
                      color: AppColors.MainColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingData.price,
                    style: TextStyle(
                      color: AppColors.RedColor,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    shoppingData.servicePrice,
                    style: TextStyle(
                      color: AppColors.MainColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              Container(
                height: 0.06 * h,
                width: w,
                decoration: BoxDecoration(
                  color: AppColors.MainColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextButton(
                  onPressed: () {
                    const CompletlyBuingView().launch(
                      context,
                    );
                  },
                  child: Text(
                    shoppingData.complete,
                    style: TextStyle(
                        color: AppColors.BackgroundColor, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
