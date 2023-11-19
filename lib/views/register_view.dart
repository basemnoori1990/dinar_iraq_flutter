import 'package:country_code_picker/country_code_picker.dart';
import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/providers/login_provider.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/bottom_navigation_bar_view.dart';
import 'package:dinar_iraq/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/apis.dart';
import '../widgets/loading_widget.dart';
import '../providers/user_provider.dart';
import '../views_model/login_model_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final _formKeyMail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  final _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer(
      builder:(BuildContext ctx,LoginProvider loginProvider,_){
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
                      Text('register',style: TextStyle(
                          color: AppColors.MainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 0.03*h,
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w ,
                    child: Form(
                      key: _formKeyName,
                      child: TextFormField(
                        controller: _controllerName,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          focusColor: Colors.grey[100],
                          hintText: 'name',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03*h,
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w ,
                    child: Form(
                      key: _formKeyMail,
                      child: TextFormField(
                        controller: _controllerEmail,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          focusColor: Colors.grey[100],
                          hintText: 'email',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03*h,
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w ,
                    child: Form(
                      key: _formKeyPass,
                      child: TextFormField(
                        controller: _controllerPass,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          focusColor: Colors.grey[100],
                          hintText: 'password',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
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
                      child:  loginProvider.isLoading
                        ? loadingWidget()
                          :TextButton(
                        onPressed: () {
                          loginProvider.userRegister(
                            onSuccess: () {
                              Provider.of<UserProvider>(context,
                                  listen: false)
                                  .setUser();
                              print('======success=====');
                              print(ApisDinar.loginENDPOINT);
                              print('======success=====');
                              MyHoomePage().launch(
                                context,
                              );
                            },
                            onFailure: (String error) {
                              print('=====Failed=====');
                            },
                            mail:_controllerEmail.text,
                            pass: _controllerPass.text,
                            name: _controllerName.text,
                          );
                        },
                        child: Text('submit',style: TextStyle(
                            color: AppColors.BackgroundColor,
                            fontSize: 17,
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
    );
  }
}