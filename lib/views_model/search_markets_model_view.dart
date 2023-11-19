import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchMarketModelView{
  String searchHint = 'ابحث عن المتجر او القطعة';
  String cancel = 'الغاء';
  String feltertxt = 'تصفية';
  String apply = 'تطبيق';
  String Healthy = 'صحـــة';
  String resturants = 'مطاعــم';
  String discription = 'ترتيب حسب الشركـــــة';
  String discription2 = 'ترتيب حسب المجموعــة';
  String feltertxtgroup = 'اختيارتنا لـ';
  String feltertxtgroup2 = 'افضل العـــرو';


  String Filter = "assets/images/filter.jpg";
  String Juice = "assets/images/juice.png";
  String Market = "assets/images/market.png";
  String Heart = "assets/images/heart.png";
  String BurgerImage = 'assets/images/burger.png';
  String Bags = "assets/images/bags.png";
  IconData iconsearch = Icons.search;
  IconData iconBack = Icons.keyboard_backspace_outlined;

}

class SearchGridViewContaner extends StatelessWidget {
  final String img, title, subtitle;
  const SearchGridViewContaner(
      {Key? key,
        required this.img,
        required this.title,
        required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: AppColors.BackgroundColor,
        child: Column(
          children: [
            Image.asset(
              img,
              height: 0.12 * h,
              width: w*.45,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.BlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.GreyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.MainColor,
                  size: 15,
                ),
                SizedBox(
                  width: 0.06*w,
                ),
                Text(
                  '20% خصم',
                  style: TextStyle(
                    color: AppColors.RedColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderButtonWedgit extends StatelessWidget {
  final String txtheader;
  final Color clrtxt ;
  const HeaderButtonWedgit({Key? key, required this.txtheader, required this.clrtxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return  Container(
      height: 0.05*h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: TextButton(
            onPressed: (){},
            child: Text(txtheader,style: TextStyle(
              color: clrtxt ,
              fontSize: 15,
            ),),
        ),
      ),
    );
  }
}

class FelterContainer extends StatefulWidget {
  final String name ;
  final String img ;
   FelterContainer({Key? key, required this.name, required this.img,}) : super(key: key);

  @override
  State<FelterContainer> createState() => _FelterContainerState();
}

class _FelterContainerState extends State<FelterContainer> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: (){
        setState(() {
          isClicked = !isClicked ;
        });
      },
      child: Container(
        height: 0.04*h,
        width: 0.17*w,
        decoration: BoxDecoration(
          color:  isClicked? Colors.grey[300] : AppColors.MainColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.GreyColor,
              ),),
              Image.asset(widget.img,height: 0.02*h,),
            ],
          ),
        ),
      ),
    );
  }
}
class FelterContainerGroup extends StatefulWidget {
  final String name ;
   FelterContainerGroup({Key? key, required this.name,}) : super(key: key);

  @override
  State<FelterContainerGroup> createState() => _FelterContainerGroupState();
}

class _FelterContainerGroupState extends State<FelterContainerGroup> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: (){
        setState(() {
          isClicked = !isClicked ;
        });
      },
      child: Container(
        height: 0.04*h,
        width: 0.17*w,
        decoration: BoxDecoration(
          color:  isClicked? Colors.grey[300] : AppColors.MainColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(widget.name,style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppColors.GreyColor,
          ),),
        ),
      ),
    );
  }
}