import 'package:Whispers/src/data/model/list_chanel_parrent_model.dart';
import 'package:Whispers/src/features/active_account/active_account_screen.dart';
import 'package:Whispers/src/features/fotget_password/fotget_password.dart';
import 'package:Whispers/src/features/home/components/body.dart';
import 'package:Whispers/src/features/getNewPassword/get_New_Password_screen.dart';
import 'package:Whispers/src/features/list_member_chanel/list_member_chanel_screen.dart';
import 'package:Whispers/src/features/list_member_chanel/nickname/nickname_screen.dart';
import 'package:Whispers/src/features/messages/channel_detail/channel_detail_screen.dart';
import 'package:Whispers/src/features/profile/add_frend/add_frend.dart';
import 'package:Whispers/src/features/sign_in/sign_in_screen.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter/material.dart';

import '../data/model/api_response/param_message_model.dart';
import '../features/create_chanel/create_chanel_screen.dart';
import '../features/home/components/new_message_screen.dart';
import '../features/home/home_screen.dart';
import '../features/messages/message_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/sign_up/sign_up_screen.dart';

import '../features/welcome/welcome_screen.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.wellcomeScreen:
        return _buildRoute(
          settings,
          const WelcomeScreen(),
        );

      case Routes.signInScreen:
        return _buildRoute(
          settings,
          const SignInScreen(),
        );
      case Routes.fotgetPassword:
        return _buildRoute(
          settings,
          const FotgetPasswordScreen(),
        );
      case Routes.getNewPassword:
        return _buildRoute(
          settings,
          const GetNewPasswordScreen(),
        );
      case Routes.signUpScreen:
        return _buildRoute(
          settings,
          const SignUpScreen(),
        );
      case Routes.activeAccountScreen:
        return _buildRoute(
          settings,
          const ActiveAccountScreen(),
        );
      case Routes.homeScreen:
        return _buildRoute(
          settings,
          const HomeScreen(),
        );
      case Routes.profileScreen:
        return _buildRoute(
          settings,
          const ProfileScreen(),
        );
      case Routes.addFrend:
        return _buildRoute(
          settings,
          const AddFrend(),
        );
      case Routes.messagesScreen:
        final param = settings.arguments as ParamMesage;
        return _buildRoute(
          settings,
          MessagesScreen(param: param),
        );
      case Routes.channelDetailScreen:
        final chanel = settings.arguments as Channel;
        return _buildRoute(
          settings,
          ChannelDetailScreen(
            chanel: chanel,
          ),
        );
      case Routes.createChanelScreen:
        return _buildRoute(
          settings,
          const CreateChanelScreen(),
        );
      case Routes.newMessageScreen:
        final type = settings.arguments as int;
        return _buildRoute(
          settings,
          NewMessageSceen(type: type),
        );
      case Routes.body:
        return _buildRoute(
          settings,
          const Body(),
        );
      case Routes.listMemberChanelScreen:
        final chanel = settings.arguments as Channel;
        return _buildRoute(
          settings,
          ListMemberChanelScreen(
            chanel: chanel,
          ),
        );
      case Routes.nicknameScreen:
        final chanel = settings.arguments as Channel;
        return _buildRoute(
          settings,
          NicknameScreen(
            chanel: chanel,
          ),
        );
      default:
        return null;
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
  ) {
    return MaterialPageRoute(
      builder: (context) => builder,
      settings: routeSettings,
    );
  }

  static Future push<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future pushAndRemoveUntil<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future replaceWith<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) {
    state.popUntil(ModalRoute.withName(route));
  }

  static void pop([Object? arg]) {
    if (canPop) {
      state.pop(arg);
    }
  }

  static void popPush(
    String route, {
    Object? arguments,
  }) {
    if (canPop) {
      state.popAndPushNamed(route, arguments: arguments);
    }
  }

  static bool get canPop => state.canPop();

  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState get state => navigatorKey.currentState!;
}
