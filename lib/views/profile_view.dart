import 'package:dinar_iraq/utilis/app_functions.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../views_model/profile_model_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var profileData = ProfileModelView();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: AppColors.BackgroundColor,
          title: Text(
            profileData.title,
            style: TextStyle(
              color: AppColors.BlackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 0.03*h,
                ),
                Container(
                  width: w,
                  height: 0.14*h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15,right: 15,left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Column(
                         children: [
                           Container(
                             height: 0.06*h,
                             width: 0.13*w,
                             decoration: BoxDecoration(
                               color: Colors.grey[100],
                               borderRadius: BorderRadius.circular(5.0),
                             ),
                             child: const Center(
                               child: Icon(Icons.language,color: Colors.grey,),
                             ),
                           ),
                           SizedBox(
                             height: 0.02*h,
                           ),
                           Text('اللغة'),
                         ],
                       ),
                        Column(
                          children: [
                            Container(
                              height: 0.06*h,
                              width: 0.13*w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Center(
                                child: Icon(Icons.money,color: Colors.grey,),
                              ),
                            ),
                            SizedBox(
                              height: 0.02*h,
                            ),
                            Text('طرق الدفع'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 0.06*h,
                              width: 0.13*w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Center(
                                child: Icon(Icons.support_agent,color: Colors.grey,),
                              ),
                            ),
                            SizedBox(
                              height: 0.02*h,
                            ),
                            Text('الدعم'),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 0.06*h,
                              width: 0.13*w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Center(
                                child: Icon(Icons.person_pin_rounded,color: Colors.grey,),
                              ),
                            ),
                            SizedBox(
                              height: 0.02*h,
                            ),
                            Text('الملف الشخصي'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.03*h,
                ),
                Container(
                  width: w,
                  // height: 0.3*h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.question_mark_outlined)),
                        title: Text('مركز المساعدة'),
                        trailing:Icon(Icons.arrow_forward_ios) ,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.privacy_tip)),
                        title: Text('سياسة الخصوصية'),
                        trailing:Icon(Icons.arrow_forward_ios) ,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.shower)),
                        title: Text('من دينار؟'),
                        trailing:Icon(Icons.arrow_forward_ios) ,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.night_shelter)),
                        title: Text('الشروط و الأحكام'),
                        trailing:Icon(Icons.arrow_forward_ios) ,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.03*h,
                ),
                Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Icon(Icons.directions_bike)),
                        title: Text('خدمة الوصيل'),
                        trailing:Icon(Icons.arrow_forward_ios) ,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
