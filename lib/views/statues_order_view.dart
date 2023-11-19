import 'package:dinar_iraq/constants/colors.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../views_model/statues_order_model_view.dart';

class StatuesOrderView extends StatefulWidget {
  const StatuesOrderView({Key? key}) : super(key: key);

  @override
  State<StatuesOrderView> createState() => _StatuesOrderViewState();
}

class _StatuesOrderViewState extends State<StatuesOrderView> {
  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  Set<int> reachedSteps = <int>{0, 2, 4, 5};
  var orderData = StatuesOrderModelView();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        elevation: 0,
        title: Text(orderData.title,style: TextStyle(
          color: AppColors.MainColor,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all( 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('12:23 pm'),
                Text('الوقت المتوقع لوصول الطلب'),
              ],
            ),
            SizedBox(
              height: 0.05*h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EasyStepper(
                  direction: Axis.vertical,
                  activeStep: activeStep,
                  lineLength: 50,
                  lineSpace: 0,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.white,
                  finishedLineColor: Colors.orange,
                  activeStepTextColor: Colors.black87,
                  finishedStepTextColor: Colors.black87,
                  internalPadding: 0,
                  showLoadingAnimation: true,
                  stepRadius: 12,
                  showStepBorder: true,
                  lineDotRadius: 1.5,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                          activeStep >= 0 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: orderData.stepOnetitle,
                      topTitle: false,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                          activeStep >= 1 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: orderData.stepTwotitle,
                      topTitle: false,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                          activeStep >= 2 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: orderData.stepThreetitle,
                      topTitle: false,
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor:
                          activeStep >= 3 ? Colors.orange : Colors.white,
                        ),
                      ),
                      title: orderData.stepFourtitle,
                      topTitle: false,
                    ),
                  ],
                  onStepReached: (index) =>
                      setState(() => activeStep = index),
                ),
                SizedBox(
                  width: 0.1*w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
