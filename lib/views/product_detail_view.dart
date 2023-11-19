import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../views_model/details_product_model_view.dart';
import '../views_model/tab_bar_model_view.dart';
import 'deatails_of_product_view.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView>
    with SingleTickerProviderStateMixin {
  DetailsProductsModelView detailsData = DetailsProductsModelView();
  final ScrollController _controller = ScrollController();
  late TabController _tabController;
  TabBarModelView tabBarData = TabBarModelView();

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            ExtendedSliverAppbar(
              toolbarHeight: 100,
              toolBarColor: Colors.white,
              leading: const SizedBox.shrink(),
              title: SizedBox(
                // height: h * 0.2,
                width: w - 8,
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5.0),
                          fillColor: Colors.grey[100],
                          filled: true,
                          prefixIcon: Icon(
                            tabBarData.searchIcon,
                            color: AppColors.GreyColor,
                            size: 25,
                          ),
                          focusColor: Colors.grey[100],
                          hintText: tabBarData.hintText,
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    TabBar(
                        labelColor: Colors.black,
                        controller: _tabController,
                      indicatorColor: AppColors.MainColor,
                      tabs: <Widget>[
                        Text(tabBarData.drinks,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),),

                        Text(tabBarData.water,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                        Text(tabBarData.powerdrinks,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        )),
                        Text(tabBarData.packetJuice,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                        Text(tabBarData.naturalJuices,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              background: SizedBox(height: h, child: DeatailsProducts()),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            SodaDrinks(),
            WaterDrink(),
            PowerDrinks(),
            PacketJuices(),
            NaturalDrinks(),
          ],
        ),
      ),
    );
  }
}
