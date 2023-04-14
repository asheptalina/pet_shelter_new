import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_colors.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Provider(
        create: (_) => CreateAdState(),
        child: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    final tabState = CupertinoTabPage.of(context);

    return CupertinoTabScaffold(
      controller: tabState.controller,
      tabBuilder: tabState.tabBuilder,
      tabBar: CupertinoTabBar(
        backgroundColor: AppColors.primary,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.feedUnelectedIcon, width: 40),
            activeIcon: SvgPicture.asset(AppAssets.feedSelectedIcon, width: 40),
            label: AppStrings.adsButton,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.createAdUnselectedIcon, width: 40),
            activeIcon: SvgPicture.asset(AppAssets.createAdSelectedIcon, width: 40),
            label: AppStrings.addAdButton,
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(AppAssets.profileUnselectedIcon, width: 40),
            activeIcon:  SvgPicture.asset(AppAssets.profileSelectedIcon, width: 40),
            label: AppStrings.profileButton,
          )
        ],
        height: 53.0,
      ),
    );
  }
}
