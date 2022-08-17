
import 'package:eido_events_project/pages/delegate_account/delegate_login_page.dart';
import 'package:eido_events_project/pages/home_page.dart';
import 'package:eido_events_project/pages/notifications_page.dart';
import 'package:eido_events_project/pages/onbording_page.dart';
import 'package:eido_events_project/pages/register_page.dart';
import 'package:eido_events_project/pages/success_page.dart';
import 'package:flutter/material.dart';
import '../pages/delegate_account/delegate_home_page.dart';
import '../pages/delegate_account/delegate_login_step2_page.dart';
import '../pages/delegate_account/events_page.dart';
import '../pages/forget_password_page.dart';
import '../pages/login_page.dart';
import '../pages/otp_checking_page.dart';
import '../pages/reset_forget_password_page.dart';
import '../pages/splash_screen.dart';

class RouteGenerator {

  static PageRoute generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case SplashScreen.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SplashScreen());
      case OnboardingPage.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const OnboardingPage());
      case LoginPage.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const LoginPage());
      case RegisterPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const RegisterPageView());
      case OtpCheckingPage.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const OtpCheckingPage());
      case SuccessPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SuccessPageView());
      case ForgetPasswordPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ForgetPasswordPageView());
      case ResetForgetPasswordPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ResetForgetPasswordPageView());
      case HomePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const HomePageView());
      case NotificationsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const NotificationsPageView());
      case DelegateLoginPage.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const DelegateLoginPage());
      case DelegateLoginStep2PageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const DelegateLoginStep2PageView());
      case DelegateHomePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const DelegateHomePageView());
      case EventsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const EventsPageView());
      default:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SplashScreen());

    }

  }


}