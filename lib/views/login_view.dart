import 'package:dinar_iraq/constants/colors.dart';
import 'package:dinar_iraq/utilis/navigation_function.dart';
import 'package:dinar_iraq/views/bottom_navigation_bar_view.dart';
import 'package:dinar_iraq/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/loading_widget.dart';
import '../providers/login_provider.dart';
import '../providers/user_provider.dart';
import '../views_model/login_model_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginModelView loginData = LoginModelView();
  final _formKeyMail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (BuildContext ctx, LoginProvider loginProvider, _) {
        return Scaffold(
          backgroundColor: AppColors.BackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 0.2 * h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'login',
                        style: TextStyle(
                            color: AppColors.MainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.03 * h,
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w,
                    child: Form(
                      key: _formKeyMail,
                      child: TextFormField(
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
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
                    height: 0.03 * h,
                  ),
                  SizedBox(
                    height: h * 0.07,
                    width: w,
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
                    height: 0.03 * h,
                  ),

                  ///login
                  Container(
                    height: h * 0.07,
                    width: w,
                    decoration: BoxDecoration(
                      color: AppColors.MainColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: loginProvider.isLoading
                          ? loadingWidget()
                          : TextButton(
                              onPressed: () {
                                loginProvider.userLogin(
                                  onSuccess: () {
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .setUser();

                                    const MyHoomePage().launch(
                                      context,
                                    );
                                  },
                                  onFailure: (String error) {},
                                  mail: _controllerEmail.text,
                                  pass: _controllerPass.text,
                                );
                              },
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    color: AppColors.BackgroundColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 0.01 * h,
                  ),
                  GestureDetector(
                    onTap: () {
                      const RegisterView().launch(
                        context,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          loginData.dohaveAcc,
                          style: TextStyle(
                              color: AppColors.BlackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
