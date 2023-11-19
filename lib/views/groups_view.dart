import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../views_model/groups_model_view.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({Key? key}) : super(key: key);

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  var groupsData = GroupsMocelView();

  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.BackgroundColor,
        title: Text(groupsData.title,style: TextStyle(
          color: AppColors.BlackColor,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                SizedBox(
                  width: 0.4*w,
                  height: 0.2*w,
                  child:  Column(
                    children: [
                      Image.asset(
                          groupsData.MangoImage,
                        width: w,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 0.04*w,
                          ),
                          Container(
                            width: 0.15*w,
                            height: 0.03*h,
                            decoration: BoxDecoration(
                              color: AppColors.FoshyColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                groupsData.discText,
                                style: TextStyle(
                                  color: AppColors.RedColor,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.02*w,
                          ),
                          Container(
                            width: 0.15*w,
                            height: 0.03*h,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,size: 15,color: AppColors.MainColor,),
                                Text(
                                  groupsData.rateText,
                                  style: TextStyle(
                                    color: AppColors.MainColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 0.02*w,
                          ),
                          Column(
                            children: [
                               Padding(
                                 padding: const EdgeInsets.only(left: 20.0),
                                 child: Text(
                                  groupsData.titleProduct,
                                  style: TextStyle(
                                    color: AppColors.BlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                  ),
                              ),
                               ),
                               Text(
                                 groupsData.discription,
                                style: TextStyle(
                                  color: AppColors.GreyColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text('hiuhhi'),
                Text('00000000000'),
                Text('==========='),
                Text('0000000000'),
                Text('========'),
              ],
            ),
          ),
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              itemHeight:0.12*h,
               compactSideMenuWidth: 0.3*w,
               showTooltip: true,
              displayMode: SideMenuDisplayMode.compact,
              hoverColor: Colors.blue[100],
              selectedBorderColor: AppColors.MainColor,
              // selectedHoverColor: Color.alphaBlend(
              //     Color.fromRGBO(
              //         Theme.of(context).colorScheme.surfaceTint.red,
              //         Theme.of(context).colorScheme.surfaceTint.green,
              //         Theme.of(context).colorScheme.surfaceTint.blue,
              //         0.08),
              //     AppColors.MainColor),
              selectedColor: AppColors.SecMainColor,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'العصائر',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.juiceIcon,),
                  size: 50,
                ) ,
              ),
              SideMenuItem(
                priority: 1,
                title: 'ورق مندي',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.swipeIcon),
                  size: 50,
                ) ,
              ),
              SideMenuItem(
                priority: 2,
                title: 'شيكولاته',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.chocoltIcon),
                  size: 50,
                ) ,
              ),
              SideMenuItem(
                priority: 3,
                title: 'بسكويت',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.biscuitIcon),
                  size: 50,
                ),
              ),
              SideMenuItem(
                priority: 4,
                title: 'معلبات',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.moleatIcon),
                  size: 50,
                ),
              ),
              SideMenuItem(
                priority: 5,
                title: 'مكسرات',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.nutsIcon),
                  size: 50,
                ),
              ),
              SideMenuItem(
                priority: 6,
                title: 'نساتل',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                iconWidget:ImageIcon(
                  AssetImage(groupsData.cakeIcon),
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

