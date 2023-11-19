import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/model/products_model.dart';
import 'package:dinar_iraq/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

import '../widgets/empty_list_indicator.dart';
import '../widgets/ierror_widget.dart';
import '../widgets/loading_widget.dart';
import '../providers/user_provider.dart';
import '../views_model/details_product_model_view.dart';

class DeatailsProducts extends StatelessWidget {
  DeatailsProducts({Key? key}) : super(key: key);

  var detailsData = DetailsProductsModelView();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            ImageSlideshow(
              indicatorColor: AppColors.BackgroundColor,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: false,
              children: [
                Image.asset(
                  detailsData.juices,
                  fit: BoxFit.cover,
                  height: 0.3 * h,
                  width: w,
                ),
                Image.asset(
                  detailsData.juices,
                  fit: BoxFit.cover,
                  height: 0.3 * h,
                  width: w,
                ),
                Image.asset(
                  detailsData.juices,
                  fit: BoxFit.cover,
                  height: 0.3 * h,
                  width: w,
                ),
              ],
            ),
           Column(
             children: [
               SizedBox(
                 height: 0.1*h,
               ),
               Padding(
                 padding: const EdgeInsets.only(right:10,left: 10),
                 child: Row(
                   children: [
                     AvatarIcon(
                       icn: detailsData.favIcon,
                     ),
                     SizedBox(
                       width: 0.04*w,
                     ),
                     AvatarIcon(
                       icn: detailsData.shareIcon,
                     ),
                     SizedBox(
                       width: 0.04*w,
                     ),
                     AvatarIcon(
                       icn: detailsData.searchIcon,
                     ),
                   ],
                 ),
               ),
             ],
           ),
          ],
        ),
       ///
        ///
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   detailsData.title,
                   style: TextStyle(
                     color: AppColors.BlackColor,
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(
                   detailsData.subtitle,
                   style: TextStyle(
                     color: AppColors.GreyColor,
                     fontSize: 13,
                   ),
                   maxLines: 2,
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   height: .04 * h,
                   width: .19 * w,
                   decoration: BoxDecoration(
                     color: AppColors.MainColor,
                     borderRadius: BorderRadius.circular(10.0),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(3.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           detailsData.rateGroup,
                           style: TextStyle(
                             color: AppColors.BackgroundColor,
                             fontSize: 9,
                           ),
                         ),
                         Icon(
                           detailsData.starIcon,
                           color: AppColors.BackgroundColor,
                           size: 12,
                         ),
                       ],
                     ),
                   ),
                 ),

                 Container(
                   width: 0.18 * w,
                   height: 0.03 * h,
                   decoration: BoxDecoration(
                     color: AppColors.FoshyColor,
                     borderRadius: BorderRadius.circular(10.0),
                   ),
                   child: Center(
                     child: Text(
                       detailsData.discount,
                       style: TextStyle(
                         color: AppColors.RedColor,
                         fontSize: 12,
                       ),
                     ),
                   ),
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
                   detailsData.products,
                   style: TextStyle(
                       color: AppColors.BlackColor,
                       fontSize: 16,
                       fontWeight: FontWeight.bold),
                 ),
               ],
             ),
             SizedBox(
               height: 0.02*h,
             ),
             SizedBox(
               height: 0.2* h,
               width: w,
               child: ListView(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 children: <Widget>[
                   ContaiverListViewWidget(
                     img: detailsData.Imgmango,
                     title: detailsData.textmango,
                     prise: detailsData.price,
                   ),
                   ContaiverListViewWidget(
                     img: detailsData.Imgmango,
                     title: detailsData.textmango,
                     prise: detailsData.price,
                   ),
                   ContaiverListViewWidget(
                     img: detailsData.Imgmango,
                     title: detailsData.textmango,
                     prise: detailsData.price,
                   ),
                 ],
               ),
             ),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text(
                       detailsData.title,
                       style: TextStyle(
                           color: AppColors.BlackColor,
                           fontSize: 16,
                           fontWeight: FontWeight.bold),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 0.02*h,
                 ),




                 FutureBuilder(
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
                           return  SizedBox(
                             height: h*0.24,
                             child: ListView(
                               shrinkWrap: true,
                               scrollDirection: Axis.vertical,
                               physics: NeverScrollableScrollPhysics(),
                               children:snap.data!.products.map<Widget>((e) =>
                                 ContainerJuicesWidget(
                                   img:detailsData.Imgsoda ,
                                   title: e.productName,
                                   subtitle: e.description,
                                   prise: e.retailPrice,
                                 ),).toList(),
                             ),
                           );
                         }
                       }
                     }
                     return loadingWidget(radius: 14);
                   },
                 ),





               ],
             ),
           ],
         ),
       ),

      ],
    );
  }
}
