import 'package:flutter/material.dart';
import 'package:pet_shelter_new/views/auth/auth_widget.dart';
import 'package:pet_shelter_new/views/create_ad/create_ad_container_widget.dart';
import 'package:pet_shelter_new/views/feed/ad_info/ad_info_container_widget.dart';
import 'package:pet_shelter_new/views/feed/feed_container_widget.dart';
import 'package:pet_shelter_new/views/feed/map_widget.dart';
import 'package:pet_shelter_new/views/main_screen_widget.dart';
import 'package:pet_shelter_new/views/profile/profile_edit_widget.dart';
import 'package:pet_shelter_new/views/profile/profile_view_widget.dart';
import 'package:routemaster/routemaster.dart';

class Routes {
  static final unauthorizedRouteMap = RouteMap(
      routes: {
        '/': (_) => const MaterialPage(child: AuthWidget()),
        '/guest': (_) => const CupertinoTabPage(
            child: MainScreenWidget(),
            paths: [
              '/guest/feed',
              '/guest/create_ad',
              '/guest/profile'
            ]
        ),
        '/guest/feed': (_) => const MaterialPage(child: FeedContainerWidget()),
        '/guest/feed/ad': (_) => const MaterialPage(child: AdInfoContainerWidget()),
        '/guest/feed/ad/map': (_) => const MaterialPage(child: AdInfoMapWidget()),
        '/guest/create_ad': (_) => const Redirect('/'),
        '/guest/profile': (_) => const Redirect('/'),
        '/guest/profile/edit': (_) => const Redirect('/'),
        '/profile': (_) => const Redirect('/guest/profile')
      }
  );

  static final authorizedRouteMap = RouteMap(
      routes: {
        '/': (_) => const CupertinoTabPage(
            child: MainScreenWidget(),
            paths: [
              '/feed',
              '/create_ad',
              '/profile'
            ]
        ),
        '/feed': (_) => const MaterialPage(child: FeedContainerWidget()),
        '/feed/ad': (_) => const MaterialPage(child: AdInfoContainerWidget()),
        '/feed/ad/map': (_) => const MaterialPage(child: AdInfoMapWidget()),
        '/create_ad': (_) => const MaterialPage(child: CreateAdContainerWidget()),
        '/profile': (_) => const MaterialPage(child: ProfileViewWidget()),
        '/profile/edit': (_) => const MaterialPage(child: ProfileEditWidget())
      }
    );
}