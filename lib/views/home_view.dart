import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/product_detail_view.dart';
import 'package:dinar_iraq/views/search_markets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../model/categories_model.dart';
import '../model/companies_model.dart';
import '../providers/categories_provider.dart';
import '../providers/companies_provider.dart';
import '../providers/user_provider.dart';
import '../views_model/home_model_view.dart';
import '../widgets/empty_list_indicator.dart';
import '../widgets/ierror_widget.dart';
import '../widgets/loading_widget.dart';
import 'companies_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ///
  //    void initState() {
  //     Future.delayed(const Duration(seconds: 0)).then((_) {
  //       showModalBottomSheet(
  //         context: context,
  //         isScrollControlled: true,
  //         isDismissible: true,
  //         shape: const RoundedRectangleBorder(
  //             borderRadius:
  //             BorderRadius.vertical(top: Radius.circular(16))),
  //         builder: (context) => DraggableScrollableSheet(
  //           initialChildSize: 0.18,
  //           minChildSize: 0.05,
  //           maxChildSize: 0.18,
  //           expand: false,
  //           builder: (_, controller) => Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     Text('تسجيل الدخول',style: TextStyle(
  //                       color: AppColors.BlackColor,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                     ),)
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 Container(
  //                   width: double.infinity,
  //                   decoration: BoxDecoration(
  //                     color: AppColors.MainColor,
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   child: Center(
  //                     child: TextButton(
  //                       onPressed: () {
  //                       },
  //                       child: Text('تسجيل الدخول',style: TextStyle(
  //                           color: AppColors.BackgroundColor,
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.bold
  //                       ),),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //
  //     });
  //     super.initState();
  //   }

  var homeData = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer(builder: (BuildContext ctx, CompaniesProvider homeProvider, _) {
      return Scaffold(
          backgroundColor: AppColors.BackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          CompaniesView().launch(
                            context,
                          );
                        },
                        child: ImageIcon(
                          AssetImage(homeData.Filter),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.06,
                        width: w * 0.8,
                        child: TextFormField(
                          cursorColor: AppColors.MainColor,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5.0),
                            fillColor: Colors.grey[100],
                            filled: true,
                            suffixIcon: Icon(
                              homeData.iconsearch,
                              color: AppColors.MainColor,
                            ),
                            focusColor: Colors.grey[100],
                            hintText: homeData.searchhome,
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
                  SizedBox(
                    height: 0.04 * h,
                  ),
                  ImageSlideshow(
                    indicatorColor: AppColors.GreyColor,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: false,
                    children: [
                      Image.asset(
                        homeData.SliderImage,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        homeData.SliderImage,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.02 * h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          homeData.company,
                          style: TextStyle(
                            color: AppColors.BlackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 0.02 * h,
                                      ),
                                      SizedBox(
                                        height: h * 0.06,
                                        width: w * 0.9,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            fillColor: Colors.grey[100],
                                            filled: true,
                                            suffixIcon: Icon(
                                              homeData.iconsearch,
                                              color: AppColors.MainColor,
                                            ),
                                            focusColor: Colors.grey[100],
                                            hintText: homeData.hintsearchsheet,
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.02 * h,
                                      ),
                                      ContanerBottomSheetWidget(
                                        title: homeData.olma,
                                        subtitle: homeData.subtitle,
                                        img: homeData.BurgerImage,
                                      ),
                                      SizedBox(
                                        height: 0.02 * h,
                                      ),
                                      ContanerBottomSheetWidget(
                                        title: homeData.ctcat,
                                        subtitle: homeData.subtitle,
                                        img: homeData.Market,
                                      ),
                                      SizedBox(
                                        height: 0.02 * h,
                                      ),
                                      ContanerBottomSheetWidget(
                                        title: homeData.soda,
                                        subtitle: homeData.subtitle,
                                        img: homeData.Bags,
                                      ),
                                      SizedBox(
                                        height: 0.02 * h,
                                      ),
                                      ContanerBottomSheetWidget(
                                        title: homeData.Healthy,
                                        subtitle: homeData.subtitle,
                                        img: homeData.Heart,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),

                  ///here
                  /// companies
                  /// api
                  /// start
                  FutureBuilder(
                      future: Provider.of<CompaniesProvider>(context, listen: false)
                          .getCompany(
                        token: Provider.of<UserProvider>(context, listen: false)
                            .user!
                            .token!,
                      ),
                      builder:
                          (context, AsyncSnapshot<CompaniesResponse?> snap) {
                        if (snap.connectionState == ConnectionState.done) {
                          if (snap.hasError) {
                            return const IErrorWidget();
                          } else if (snap.hasData) {
                            if (snap.data == null) {
                              return const EmptyListIndicator();
                            } else {
                              return GridView.count(
                                primary: false,
                                shrinkWrap: true,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                                crossAxisCount: 4,
                                children: snap.data!.companies!
                                        .map<Widget>((e) =>
                                    contanerWidgetGrid(
                                      img: homeData.Market,
                                  clr:  AppColors.MarketColor,
                                  txt: e.companyName??"",
                                ),)
                                        .toList(),

                              );
                            }
                          }
                        }
                        return loadingWidget(radius: 14);
                      }
                      ),
                  ///
                  /// end
                  ///
                  SizedBox(
                    height: 0.01 * h,
                  ),
                  GestureDetector(
                    onTap: () {
                      SearchMarketsView().launch(
                        context,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          homeData.rowIcon,
                          color: AppColors.GreyColor,
                          size: 13,
                        ),
                        Text(
                          homeData.viewmore,
                          style: TextStyle(
                            color: AppColors.GreyColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 0.4*w,
                        ),
                        Expanded(
                          child: Text(
                            homeData.groups,
                            style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        homeData.explain,
                        style: TextStyle(
                          color: AppColors.GreyColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  ///categoris
                  ///




                  GestureDetector(
                        onTap: () {
                          ProductDetailsView().launch(context);
                        },
                    child: FutureBuilder(
                        future: Provider.of<CategoriesProvider>(context, listen: false)
                            .getCategory(
                          token: Provider.of<UserProvider>(context, listen: false)
                              .user!
                              .token!,
                        ),
                      builder: (context, AsyncSnapshot<CategoriesResponse?> snap) {
                        if (snap.connectionState == ConnectionState.done){
                          if (snap.hasError){
                            return const IErrorWidget();
                          }else if (snap.hasData){
                            if (snap.data == null) {
                              return const EmptyListIndicator();
                            }else {
                              return  SizedBox(
                                height: 0.25*h,
                                width: w,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: snap.data!.categories.map<Widget>((e) =>
                                    ListViewContaner(
                                      img: homeData.Juice,
                                      title: e.categoryName,
                                      subtitle: e.description,
                                    ),).toList(),
                                  ),
                              );
                            }
                          }
                        }
                        return loadingWidget(radius: 14);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
