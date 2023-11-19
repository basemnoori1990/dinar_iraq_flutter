import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/local_package/easy_sidemenu-master/example/lib/main.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../views_model/location_model_view.dart';

class LocationView extends StatefulWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late Position cl ;
  var locationData = LocationModelView();
  Future getPostion() async{
    LocationPermission per ;
    bool services ;

    services = await Geolocator.isLocationServiceEnabled();

    per = await Geolocator.checkPermission();
    if(per == LocationPermission.denied){
      per = await Geolocator.requestPermission();
      if(per == LocationPermission.whileInUse){

      }
    }
    print('=============');
    print(per);
    print('===================');
  }
  Future<Position> getLatAndLong() async{
   return  await Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  void initState(){
    getPostion();
    super.initState();
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        title: Text(locationData.titleappBar,style: TextStyle(
          color: AppColors.MainColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0,left: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 0.02*h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(locationData.title,style: TextStyle(
                  color: AppColors.MainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            SizedBox(
              height: 0.02*h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               ImageIcon(
                 AssetImage(locationData.superMarketImg),
                 color: AppColors.RedColor,
               ),
                Text(locationData.marketText,style: TextStyle(
                  color: AppColors.BlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            SizedBox(
              height: 0.02*h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(
                  AssetImage(locationData.DeliveryImg),
                  color: AppColors.RedColor,
                ),
                Text(locationData.delText,style: TextStyle(
                  color: AppColors.BlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            SizedBox(
              height: 0.1*h,
            ),
            Container(
              height: 0.06*h,
              width: w,
              decoration: BoxDecoration(
                color: AppColors.MainColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: TextButton(
                  onPressed: () async{
                    cl = await getLatAndLong();
                    print('Lat ${cl.latitude}');
                    print( 'Long ${cl.longitude}');
                    MyHoomePage().launch(
                      context,
                    );
                  },
                  child: Text('تفعيل خدمة الموقع',style: TextStyle(
                    color: AppColors.BackgroundColor,
                    fontSize: 16
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
