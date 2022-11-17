
import 'package:eido_events_project/pages/delegate_account/delegate_login_page.dart';
import 'package:eido_events_project/pages/home_page.dart';
import 'package:eido_events_project/pages/notifications_page.dart';
import 'package:eido_events_project/pages/onbording_page.dart';
import 'package:eido_events_project/pages/register_page.dart';
import 'package:eido_events_project/pages/success_page.dart';
import 'package:flutter/material.dart';
import '../pages/associate_account/detail_profils_associate_account.dart';
import '../pages/associate_account/list_associate_account_page.dart';
import '../pages/associate_account/menu_edit_associate_account.dart';
import '../pages/associate_account/privilege_associate_account.dart';
import '../pages/associate_account/profile_activity.dart';
import '../pages/controller_account/controller_home_page.dart';
import '../pages/delegate_account/delegate_home_page.dart';
import '../pages/delegate_account/delegate_login_step2_page.dart';
import '../pages/delegate_account/events_page.dart';
import '../pages/events/add_new_event_page.dart';
import '../pages/events/add_new_event_step2_page.dart';
import '../pages/events/host_create/panier_items_list_page.dart';
import '../pages/events/host_create/program_events_home_details_page.dart';
import '../pages/events/host_create/program_events_home_page.dart';
import '../pages/events/invoice_page.dart';
import '../pages/events/manage_tickets_page.dart';
import '../pages/events/qr_code_detail_page.dart';
import '../pages/events/renew_event_page.dart';
import '../pages/events/success_event_page.dart';
import '../pages/events/success_renew_event_page.dart';
import '../pages/forget_password_page.dart';
import '../pages/guests/add_guests_page.dart';
import '../pages/guests/edit_guests_page.dart';
import '../pages/guests/guests_list_page.dart';
import '../pages/guests_space/guests_space_detail_page.dart';
import '../pages/guests_space/home_guests_space_page.dart';
import '../pages/guests_space/program_guest_page.dart';
import '../pages/location_settings/add_location_settings.dart';
import '../pages/location_settings/add_settings.dart';
import '../pages/location_settings/edit_location_settings.dart';
import '../pages/location_settings/home_location_settings.dart';
import '../pages/location_settings/list_settings.dart';
import '../pages/location_settings/search_location_settings.dart';
import '../pages/location_settings/success_location_page.dart';
import '../pages/login_page.dart';
import '../pages/manage_event_programs/add_program_page.dart';
import '../pages/manage_event_programs/package_page.dart';
import '../pages/manage_event_programs/program_home_page.dart';
import '../pages/manage_event_programs/selected_items_page.dart';
import '../pages/manage_event_programs/success_page.dart';
import '../pages/manage_rubrique/add_product_page.dart';
import '../pages/manage_rubrique/add_rubrique_program_page.dart';
import '../pages/manage_rubrique/list_of_program_page.dart';
import '../pages/manage_rubrique/manage_product_page.dart';
import '../pages/manage_rubrique/rubrique_list_page.dart';
import '../pages/manage_rubrique/search_product_page.dart';
import '../pages/manage_rubrique/search_rubrique_programpage.dart';
import '../pages/otp_checking_page.dart';
import '../pages/reset_forget_password_page.dart';
import '../pages/splash_screen.dart';
import '../widgets/offline_page.dart';

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
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => OtpCheckingPage(
            isForgotPassword: param["isForgotPassword"]
        ));
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
      case ControllerHomePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ControllerHomePageView());
      case HomeLocationSettingsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const HomeLocationSettingsPageView());
      case AddLocationSettingsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) =>
         AddLocationSettingsPageView());
      case SearchLocationSettingsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SearchLocationSettingsPageView());
      case EditLocationSettingsPageView.pageName:
      Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) =>
            EditLocationSettingsPageView(
              locationSettings: param["locationSettings"],
            title: param["title"]
            ));
      case SuccessLocationPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) =>
            SuccessLocationPageView(
                saved: param["saved"]
            ));
      case AddSettingsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => AddSettingsPageView());
      case OfflinePagePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const OfflinePagePageView());
      case ListSettingsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ListSettingsPageView());
      case ListAssociateAccountPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ListAssociateAccountPageView());
      case MenuEditAssociateAccountPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const MenuEditAssociateAccountPageView());
      case ProfileActivityAssociateAccountPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ProfileActivityAssociateAccountPageView());
      case PrivilegeAssociateAccountPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const PrivilegeAssociateAccountPageView());
      case DetailProfileAssociateAccountPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const DetailProfileAssociateAccountPageView());
      case ProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ProgramPageView());
      case PackagePageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) =>
            PackagePageView(
                programModel: param["programModel"],
                title: param["title"]
            ));
      case SelectedItemPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => SelectedItemPageView(
            listProgramModel: param["listProgramModel"]
        ));
      case AddProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddProgramPageView());
      case SuccessProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SuccessProgramPageView());
      case ManageTicketsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ManageTicketsPageView());
      case QrCodeDetailPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => QrCodeDetailPageView(
            listTicketsModel: param["list_ticket"]
        ));
      case AddNewEventPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddNewEventPageView());
      case AddNewEventStep2PageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddNewEventStep2PageView());
      case ProgramEventsHomePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ProgramEventsHomePageView());
      case ProgramEventsHomeDetailsPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => ProgramEventsHomeDetailsPageView(
            listProgramModel: param["listProgramModel"]
        ));
      case PanierItemsListPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => PanierItemsListPageView(
            listProgramModel: param["listProgramModel"]
        ));
      case GuestsListPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const GuestsListPageView());
      case AddGuestsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddGuestsPageView());
      case EditGuestsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const EditGuestsPageView());
      case SuccessEventsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SuccessEventsPageView());
      case RubriqueListPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const RubriqueListPageView());
      case SearchRubriqueProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SearchRubriqueProgramPageView());
      case AddRubriqueProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddRubriqueProgramPageView());
      case ListOfProgramPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ListOfProgramPageView());
      case SearchProductPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SearchProductPageView());
      case AddProductPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const AddProductPageView());
      case ManageProductPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const ManageProductPageView());
      case RenewEventPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const RenewEventPageView());
      case InvoicePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const InvoicePageView());
      case SuccessRenewEventsPageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SuccessRenewEventsPageView());
      case HomeGuestsSpacePageView.pageName:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const HomeGuestsSpacePageView());
      case GuestsSpaceDetailPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => GuestsSpaceDetailPageView(
            listProgramModel: param["listProgramModel"]
        ));
      case ProgramGuestPageView.pageName:
        Map param = routeSettings.arguments as Map;
        return MaterialPageRoute(settings: routeSettings, builder: (context) => ProgramGuestPageView(
            listProgramModel: param["listProgramModel"]
        ));

      default:
        return MaterialPageRoute(settings: routeSettings, builder: (context) => const SplashScreen());
    }

  }


}