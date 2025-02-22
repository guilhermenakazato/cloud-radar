import 'package:cloud_radar/presentation/router/search_arguments.dart';
import 'package:cloud_radar/presentation/screens/config_desc.dart';
import 'package:cloud_radar/presentation/screens/config_screen.dart';
import 'package:cloud_radar/presentation/screens/enjoy_screen.dart';
import 'package:cloud_radar/presentation/screens/first_screen_desc.dart';
import 'package:cloud_radar/presentation/screens/main_screen.dart';
import 'package:cloud_radar/presentation/screens/search_screen.dart';
import 'package:cloud_radar/presentation/screens/start_screen.dart';
import 'package:cloud_radar/presentation/screens/subscription_plans_screen.dart';
import 'package:cloud_radar/utils/route_builder.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return RouteBuilder.pageComponent(const StartScreen());
      case "/second":
        return RouteBuilder.pageComponent(const FirstScreenDesc());
      case "/third":
        return RouteBuilder.pageComponent(const ConfigDesc());
      case "/fourth":
        return RouteBuilder.pageComponent(const EnjoyScreen());
      case "/home":
        return RouteBuilder.pageComponent(const MainScreen());
      case "/config":
        return RouteBuilder.pageComponent(const ConfigScreen());
      case "/search":
        final args = routeSettings.arguments as SearchArguments;
        return RouteBuilder.pageComponent(
          SearchScreen(
            appContext: args.appContext,
          ),
        );
      case "/plans":
        return RouteBuilder.pageComponent(const SubscriptionPlansScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text(
                  "Wrong route!",
                ),
              ),
            );
          },
        );
    }
  }
}
