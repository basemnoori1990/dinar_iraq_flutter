import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../constants/colors.dart';
///first screen
///
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKeyPhone = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0,left: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.1*h,
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset(
                   'assets/images/logo.png',
                   height: 0.2*h,
                   width: 0.5*w,
                   fit: BoxFit.fill,
                 ),
               ],
             ),
              SizedBox(
                height: 0.1*h,
              ),
              Text('يجب ان يكون رقمك الهاتف مسجل بالواتساب',style: TextStyle(
                  color: AppColors.BlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 0.1*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('رقم الهاتف',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(
                    width: 0.05*w,
                  ),
                ],
              ),
              Container(
                height: h * 0.07,
                width: w *0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: Form(
                  key: _formKeyPhone,
                  child: TextFormField(
                    controller: _controllerPhone,
                    keyboardType: TextInputType.phone,
                    cursorColor: AppColors.MainColor,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: false,
                      focusColor: Colors.grey[100],
                      hintTextDirection: TextDirection.rtl,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.05*h,
              ),
              Container(
                height: h * 0.07,
                width: w *0.85,
                decoration: BoxDecoration(
                  color: AppColors.MainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Text('أرسال',style: TextStyle(
                        color: AppColors.BackgroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///secondScreen
///
class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.1*h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 0.2*h,
                  width: 0.5*w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            SizedBox(
              height: 0.1*h,
            ),
            Text('ستصلك رسالة الى الواتساب فيها رمز التأكيد',style: TextStyle(
                color: AppColors.BlackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 0.1*h,
            ),
            Text('ادخل رمز التاكد',style: TextStyle(
                color: AppColors.BlackColor,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 0.05*h,
            ),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 0.15*w,
              style: TextStyle(
                  fontSize: 17,
                color: AppColors.MainColor
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
          ],
        ),
      ),
    );
  }
}
///ThirdScreen
///
class DetailsDataSignView extends StatefulWidget {
  const DetailsDataSignView({Key? key}) : super(key: key);

  @override
  State<DetailsDataSignView> createState() => _DetailsDataSignViewState();
}

class _DetailsDataSignViewState extends State<DetailsDataSignView> {
  final _formKeyPhone = GlobalKey<FormState>();
  final _controllerFullName = TextEditingController();
  final _controllerMarketName = TextEditingController();
  final _controllerState = TextEditingController();
  final _controllerLocation = TextEditingController();
  final _controllerMarketPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0,left: 10),
          child: Column(
            children: [
              SizedBox(
                height: 0.05*h,
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 0.15*h,
              ),
              SizedBox(
                height: 0.03*h,
              ),
              const Text('يجب التاكد من المعلومات قبل الارسال',style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 0.03*h,
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text('الاسم الثلاثي لصاحب العمل',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
              ),
              ),
                 ],
               ),
              Container(
                height: h * 0.06,
                width: w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: TextFormField(
                  controller: _controllerFullName,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: false,
                    focusColor: Colors.grey[100],
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('أسم الماركت ',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              Container(
                height: h * 0.06,
                width: w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: TextFormField(
                  controller: _controllerMarketName,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: false,
                    focusColor: Colors.grey[100],
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('المحافظة',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              Container(
                height: h * 0.06,
                width: w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: TextFormField(
                  controller: _controllerState,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: false,
                    focusColor: Colors.grey[100],
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('العنوان الكامل مع اقرب نقطة دالة',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              Container(
                height: h * 0.06,
                width: w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: TextFormField(
                  controller: _controllerLocation,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: false,
                    focusColor: Colors.grey[100],
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('رقم هاتف الماركت(العمل)',style: TextStyle(
                      color: AppColors.BlackColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              Container(
                height: h * 0.06,
                width: w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.MainColor),
                ),
                child: TextFormField(
                  controller: _controllerMarketPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: false,
                    focusColor: Colors.grey[100],
                    hintTextDirection: TextDirection.rtl,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.02*h,
              ),
              Container(
                height: h * 0.07,
                width: w *0.5,
                decoration: BoxDecoration(
                  color: AppColors.MainColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,color:AppColors.BackgroundColor,),
                      Text('تحديد موقعي',style: TextStyle(
                          color: AppColors.BackgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.02*h,
              ),
              Container(
                height: h * 0.07,
                width: w ,
                decoration: BoxDecoration(
                  color: AppColors.MainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Text('حفظ',style: TextStyle(
                        color: AppColors.BackgroundColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


