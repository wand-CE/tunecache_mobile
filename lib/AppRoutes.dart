import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/views/home_page_view.dart';
import 'package:tunecache_with_flutter/views/list_playlists_page_view.dart';
import 'package:tunecache_with_flutter/views/login_page_view.dart';
import 'package:tunecache_with_flutter/views/signup_page_view.dart';
import 'package:tunecache_with_flutter/views/user_configs_page_view.dart';

class AppRoutes {
  static const signUpPage = '/signUpPage';
  static const loginPage = '/loginPage';
  static const forgotPassPage = '/forgotPassPage';

  static const userConfigsPage = '/userConfigsPage';

  static const homePage = '/homePage';
  static const listPlaylistsPage = '/listPlaylistsPage';

  static Map<String, WidgetBuilder> define() {
    return {
      homePage: (BuildContext context) => HomePageView(),
      loginPage: (BuildContext context) => LoginPageView(),
      signUpPage: (BuildContext context) => SignUpPageView(),
      userConfigsPage: (BuildContext context) => UserConfigsPageView(),
      listPlaylistsPage: (BuildContext context) => ListPlaylistsPageView(),
    };
  }
}
