import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/details_login_complete.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../constants/colors.dart';
import '../views_model/otp_model_view.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  var otpData = OtpModelView();

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
                height: 0.2*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(otpData.title,style: TextStyle(
                      color: AppColors.MainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text:  TextSpan(
                      children:  <TextSpan>[
                         TextSpan(text: otpData.explain, style: TextStyle(
                            fontWeight: FontWeight.bold,
                        color: AppColors.MainColor
                        )),
                        TextSpan(text: otpData.phonenum,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.05*h,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: const TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(
                height: 0.03*h,
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
                      DetailsLoginView().launch(
                        context,
                      );
                    },
                    child: Text(otpData.apply,style: TextStyle(
                        color: AppColors.BackgroundColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
              SizedBox(
                height: 0.03*h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text:  TextSpan(
                      children:  <TextSpan>[
                        TextSpan(text: otpData.replyText, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.MainColor
                        )),
                        TextSpan(text: otpData.timer,style: TextStyle(
                          color: AppColors.BlackColor,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
