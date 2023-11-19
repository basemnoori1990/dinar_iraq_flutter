import 'package:dinar_iraq/providers/categories_provider.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../widgets/empty_list_indicator.dart';
import '../widgets/ierror_widget.dart';
import '../widgets/loading_widget.dart';
import '../model/categories_model.dart';
import '../providers/user_provider.dart';
import '../views_model/search_markets_model_view.dart';
import 'add_to_cart_view.dart';

class SearchMarketsView extends StatefulWidget {
  const SearchMarketsView({Key? key}) : super(key: key);

  @override
  State<SearchMarketsView> createState() => _SearchMarketsViewState();
}

var searchData = SearchMarketModelView();

class _SearchMarketsViewState extends State<SearchMarketsView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
                    child: ImageIcon(
                      AssetImage(searchData.Filter),
                    ),
                    onTap: () {
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
                                    right: 8.0, left: 8.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 0.02 * h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        HeaderButtonWedgit(
                                          txtheader: searchData.apply,
                                          clrtxt: AppColors.RedColor,
                                        ),
                                        Text(
                                          searchData.feltertxt,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.BlackColor,
                                          ),
                                        ),
                                        HeaderButtonWedgit(
                                          txtheader: searchData.cancel,
                                          clrtxt: AppColors.GreyColor,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          searchData.discription,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.BlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.05*h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        FelterContainer(
                                          img: searchData.BurgerImage,
                                          name: searchData.resturants,
                                        ),
                                        FelterContainer(
                                          img: searchData.Market,
                                          name: searchData.resturants,
                                        ),
                                        FelterContainer(
                                          img: searchData.Heart,
                                          name: searchData.Healthy,
                                        ),
                                        FelterContainer(
                                          img: searchData.Market,
                                          name: searchData.resturants,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.05*h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          searchData.discription2,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.BlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.05*h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        FelterContainerGroup(
                                          name: searchData.feltertxtgroup,
                                        ),
                                        FelterContainerGroup(
                                          name: searchData.feltertxtgroup2,
                                        ),
                                        FelterContainerGroup(
                                          name: searchData.feltertxtgroup,
                                        ),
                                        FelterContainerGroup(
                                          name: searchData.feltertxtgroup2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                  SizedBox(
                    height: h * 0.06,
                    width: w * 0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        fillColor: Colors.grey[100],
                        filled: true,
                        suffixIcon: Icon(
                          searchData.iconsearch,
                          color: AppColors.MainColor,
                        ),
                        focusColor: Colors.grey[100],
                        hintText: searchData.searchHint,
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        searchData.iconBack,
                        color: AppColors.MainColor,
                      )),
                ],
              ),
              ///StartApiCategory
              ///
              GestureDetector(
                onTap: (){
                  const AddToCartView().launch(
                    context,
                  );
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
                          return GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 4,
                            crossAxisCount: 2,
                            children: snap.data!.categories.map<Widget>((e) =>
                              SearchGridViewContaner(
                                img: searchData.Juice,
                                title: e.categoryName,
                                subtitle: e.description,
                              ),).toList(),

                          );
                        }
                      }
                    }
                    return loadingWidget(radius: 14);
                  },
                ),
              ),
              ///End
            ],
          ),
        ),
      ),
    );
  }
}
