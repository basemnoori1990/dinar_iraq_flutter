import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/add_to_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../widgets/empty_list_indicator.dart';
import '../widgets/ierror_widget.dart';
import '../widgets/loading_widget.dart';
import '../model/products_model.dart';
import '../providers/products_provider.dart';
import '../providers/user_provider.dart';
import 'details_product_model_view.dart';

class TabBarModelView{
  String hintText = 'ابحث عن القطعة';
  String drinks = 'مشروبات غازية';
  String water = 'مياه معدنية';
  String powerdrinks = 'مشروبات طاقة';
  String packetJuice = 'عصائر باكيت';
  String naturalJuices = 'العصائر الطبيعية';
  String textraniGlasses = 'عصير راني زجاج';
  String discribJuice = 'موز,حليب ,خوخ,موز,تفاح';
  String price = '3.22\$';
  String Imgsoda = 'assets/images/soda.png';
  IconData searchIcon = Icons.search;
  IconData backIcon = Icons.arrow_back_outlined;
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
          AddToCartView().launch(context);
        },
        child: Container(
          height: 0.1 * h,
          width: 0.9 * w,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: AppColors.GreyColor),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1.5, 1.5),
              ),
            ],
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

class SodaDrinks extends StatelessWidget {
   SodaDrinks({Key? key}) : super(key: key);
   var detailsData = DetailsProductsModelView();
  var tabBarData = TabBarModelView();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return  FutureBuilder(
      future: Provider.of<ProductsProvider>(context, listen: false)
          .getProducts(
        token: Provider.of<UserProvider>(context, listen: false)
            .user!
            .token!,
      ),
      builder: (context, AsyncSnapshot<ProductsResponse?> snap) {
        if (snap.connectionState == ConnectionState.done){
          if (snap.hasError){
            return const IErrorWidget();
          }else if (snap.hasData){
            if (snap.data == null) {
              return const EmptyListIndicator();
            }else {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: h,

                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children:snap.data!.products.map<Widget>((e) =>
                        ContainerJuicesWidget(
                          img:detailsData.Imgsoda ,
                          title: e.productName,
                          subtitle: e.description,
                          prise: e.retailPrice,
                        ),).toList(),
                  ),
                ),
              );
            }
          }
        }
        return loadingWidget(radius: 14);
      },
    );
  }
}
class WaterDrink extends StatelessWidget {
  const WaterDrink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column();
  }
}
class PowerDrinks extends StatelessWidget {
  const PowerDrinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column();
  }
}
class PacketJuices extends StatelessWidget {
  const PacketJuices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column();
  }
}
class NaturalDrinks extends StatelessWidget {
  const NaturalDrinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column();
  }
}