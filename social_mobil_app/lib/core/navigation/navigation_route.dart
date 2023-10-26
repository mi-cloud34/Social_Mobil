import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/components/cards/not_found_navigator.dart';
import 'package:social_mobil_app/core/constants/navigation/navigation_constants.dart';
import 'package:social_mobil_app/feature/_product/_widgets/pages/user_profil_page.dart';
import 'package:social_mobil_app/feature/_product/_widgets/tabbar/filter_discover.dart';
import 'package:social_mobil_app/feature/view/home/view/home_page.dart';
import 'package:social_mobil_app/feature/view/login/view/login_page.dart';
import 'package:social_mobil_app/feature/view/welcome/view/welcome_page.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      /*  case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT); */

       case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(
            const LoginScreen(), NavigationConstants.LOGIN_VIEW);
             case NavigationConstants.HOME_VIEW:
        return normalNavigate(
            const HomesPage(), NavigationConstants.REGISTER_VIEW);
      case NavigationConstants.WELCOME:
        return normalNavigate(const WelcomeScreen(), NavigationConstants.WELCOME);
      case NavigationConstants.FILTER_DISCOVER:
        return normalNavigate(
            const FilterDiscover(), NavigationConstants.FILTER_DISCOVER);      
        case NavigationConstants.USER_DETAY_VIEW:
        return normalNavigate(
            const UserProfil(), NavigationConstants.USER_DETAY_VIEW);       
       case NavigationConstants.LOG_OUT:
        return normalNavigate(
            const LoginScreen(), NavigationConstants.LOG_OUT); 

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigator(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      //analytciste görülecek olan sayfa ismi için pageName veriyoruz
      settings: RouteSettings(name: pageName),
    );
  }
}
