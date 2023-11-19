import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../views_model/companies_model_view.dart';

class CompaniesView extends StatefulWidget {
  const CompaniesView({Key? key}) : super(key: key);

  @override
  State<CompaniesView> createState() => _CompaniesViewState();
}

var companyData = CompaniesModelView();

class _CompaniesViewState extends State<CompaniesView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.BackgroundColor,
        elevation: 0,
        title: Text(
          companyData.title,
          style: TextStyle(
            color: AppColors.BlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                companyData.iconBack,
                color: AppColors.MainColor,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.06,
                  width: w *.9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      suffixIcon: Icon(
                        companyData.iconSearch,
                        color: AppColors.MainColor,
                      ),
                      focusColor: Colors.grey[100],
                      hintText: companyData.hintTextField,
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
              height: 0.02*h,
            ),
            ContanerCompanyWidget(
              title:companyData.Resturant,
              subtitle: companyData.subtitleResturant,
              img: companyData.BurgerImage,
            ),
            SizedBox(
              height: 0.02*h,
            ),
            ContanerCompanyWidget(
              title:companyData.Healthy,
              subtitle: companyData.subtitleResturant,
              img: companyData.Heart,
            ),
            SizedBox(
              height: 0.02*h,
            ),
            ContanerCompanyWidget(
              title:companyData.Markets,
              subtitle: companyData.subtitleResturant,
              img: companyData.Market,
            ),
            SizedBox(
              height: 0.02*h,
            ),
            ContanerCompanyWidget(
              title:companyData.Shopping,
              subtitle: companyData.subtitleResturant,
              img: companyData.Bags,
            ),
          ],
        ),
      ),
    );
  }
}
