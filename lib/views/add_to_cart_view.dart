import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/providers/products_provider.dart';
import 'package:dinar_iraq/providers/user_provider.dart';
import 'package:dinar_iraq/repos/base_repository.dart';
import 'package:dinar_iraq/widgets/snack_bar_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/apis.dart';
import '../views_model/add_cart_model_view.dart';

class AddToCartView extends StatefulWidget {
  const AddToCartView({Key? key}) : super(key: key);

  @override
  State<AddToCartView> createState() => _AddToCartViewState();
}

class _AddToCartViewState extends State<AddToCartView> with BaseRepository {
  AddCartModelView cartData = AddCartModelView();
  bool isChecked = false;
  bool isclickedfav = true;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (BuildContext ctx, ProductsProvider homeProvider, _) {
        return Scaffold(
          backgroundColor: AppColors.BackgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      cartData.smoothie,
                      width: w,
                      height: 0.4 * h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.05 * h,
                          ),
                          Row(
                            children: [
                              AvatarIcon(
                                icn: cartData.shareIcon,
                                clr: AppColors.BackgroundColor,
                              ),
                              SizedBox(
                                width: 0.03 * w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isclickedfav = !isclickedfav;
                                  });
                                },
                                child: AvatarIcon(
                                  icn: cartData.favIcon,
                                  clr: isclickedfav
                                      ? AppColors.BackgroundColor
                                      : AppColors.RedColor,
                                ),
                              ),
                              SizedBox(
                                width: 0.6 * w,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    cartData.backIcon,
                                    color: AppColors.BackgroundColor,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 0.3 * h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                cartData.title,
                                style: TextStyle(
                                  color: AppColors.BlackColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                cartData.subtitle,
                                style: TextStyle(
                                  color: AppColors.GreyColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                cartData.price,
                                style: TextStyle(
                                  color: AppColors.MainColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            cartData.nkhat,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // counter widget
                      // counter widget
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cartData.price,
                                    style: TextStyle(
                                      color: AppColors.MainColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartData.dec();
                                      });
                                    },
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[300],
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Icon(
                                              cartData.minusIcon,
                                              size: 15,
                                              color: AppColors.BlackColor,
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  Text('${cartData.getCounter()}'),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartData.inc();
                                      });
                                    },
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[300],
                                        child: Center(
                                            child: Icon(
                                          cartData.addIcon,
                                          size: 15,
                                          color: AppColors.MainColor,
                                        ))),
                                  ),
                                  Text(cartData.amountTotal,
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(
                                height: 0.01 * h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "5.22\$",
                                    style: TextStyle(
                                      color: AppColors.MainColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartData.decWhole();
                                      });
                                    },
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[300],
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Icon(
                                              cartData.minusIcon,
                                              size: 15,
                                              color: AppColors.BlackColor,
                                            ),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  Text('${cartData.getWholeCounter()}'),
                                  SizedBox(
                                    width: 0.01 * w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cartData.incWhole();
                                      });
                                    },
                                    child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[300],
                                        child: Center(
                                            child: Icon(
                                          cartData.addIcon,
                                          size: 15,
                                          color: AppColors.MainColor,
                                        ))),
                                  ),
                                  Text(cartData.amountIndividual,
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            cartData.mangoCup,
                            height: 0.07 * h,
                          ),
                          SizedBox(
                            width: 0.01 * w,
                          ),
                          Text(
                            cartData.orangeTxt,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Expanded(
                            child: Checkbox(
                                checkColor: AppColors.GreyColor,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  isChecked = value!;
                                }),
                          ),
                        ],
                      ),
                      // counter widget
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
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
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      )),
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          height: h,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0, left: 12.0),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      cartData.productOffer,
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.03 * h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      cartData.priceProduct,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      cartData.numProduct,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Text(
                                                      cartData.nameProduct,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '6546 \$',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColors.MainColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      '5',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: AppColors
                                                            .BlackColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      'شكولاتة سكنير',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color:
                                                            AppColors.GreyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.35 * h,
                                                ),
                                                Container(
                                                  height: 0.06 * h,
                                                  width: w,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.MainColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'تطبيق الفلتر',
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .BackgroundColor,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  cartData.productOffer,
                                  style: TextStyle(
                                    color: AppColors.BackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            cartData.notes,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * h,
                      ),
                      SizedBox(
                        height: h * 0.1,
                        width: w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            filled: true,
                            focusColor: Colors.grey[100],
                            hintText: cartData.hintTxt,
                            hintTextDirection: TextDirection.rtl,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      const Divider(
                        thickness: 2,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartData.getCounter().toString(),
                            style: TextStyle(
                              color: AppColors.MainColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cartData.numTotal,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cartData.getWholeCounter().toString(),
                            style: TextStyle(
                              color: AppColors.MainColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cartData.numIndividual,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${cartData.getCounter() * 3.22}\$",
                            style: TextStyle(
                              color: AppColors.MainColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cartData.priceTotal,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${cartData.getWholeCounter() * 5.22}\$",
                            style: TextStyle(
                              color: AppColors.MainColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cartData.priceIndividual,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.02 * h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await dio
                                  .makePostRequest(ApisDinar.cartENDPOINT, {
                                "product_id": "2",
                                "quantity": "${cartData.getCounter()}",
                                "price": "${cartData.getCounter() * 3.22}",
                                "unit_id": "0"
                              },headers: {
                                'Accept': 'application/json',
                                'Authorization':"Bearer ${Provider.of<UserProvider>(context,listen: false).user!.token!}"
                              });
                              Future.delayed(Duration.zero, () {
                                showSnackBarError(
                                    context: context,
                                    message: "تمت الاضافه لعربه الشراء",
                                    isError: false);
                              });
                            },
                            child: Container(
                              height: 0.06 * h,
                              width: 0.45 * w,
                              decoration: BoxDecoration(
                                color: AppColors.MainColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cartData.addToCart,
                                    style: TextStyle(
                                      color: AppColors.BackgroundColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    cartData.shoppingIcon,
                                    size: 14,
                                    color: AppColors.BackgroundColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              await dio
                                  .makePostRequest(ApisDinar.cartENDPOINT, {
                                "product_id": "2",
                                "quantity": "${cartData.getWholeCounter()}",
                                "price": "${cartData.getWholeCounter() * 5.22}",
                                "unit_id": "1"
                              },headers: {
                                'Accept': 'application/json',
                                'Authorization':"Bearer ${Provider.of<UserProvider>(context,listen: false).user!.token!}"
                              });
                              Future.delayed(Duration.zero, () {
                                showSnackBarError(
                                    context: context,
                                    message: "تمت الاضافه لعربه الشراء",
                                    isError: false);
                              });
                            },
                            child: Container(
                              height: 0.06 * h,
                              width: 0.45 * w,
                              decoration: BoxDecoration(
                                color: AppColors.MainColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    cartData.shoppingIcon,
                                    size: 14,
                                    color: AppColors.BackgroundColor,
                                  ),
                                  Text(
                                    "اضافه السعر بالمفرد",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
