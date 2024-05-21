import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradeuz/common/router/route_name.dart';
import 'package:tradeuz/pages/add_product_page.dart';
import 'package:tradeuz/pages/login_page.dart';
import 'package:tradeuz/pages/navigation_bar_bottom.dart';

import '../../pages/home_page.dart';

class AppRouter {
  static final GoRouter goRouter = GoRouter(
      initialLocation: AppRouteName.homePage,
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
            builder: (_, __, child) {
              return BottomBarPage(child: child);
            },
            routes: [
              GoRoute(
                name: "HomePage",
                path: AppRouteName.homePage,
                builder: (BuildContext context, GoRouterState state) {
                  return HomePage();
                },
              ),
              GoRoute(
                name: "LoginPage",
                path: AppRouteName.loginPage,
                builder: (BuildContext context, GoRouterState state) {
                  return LoginPage();
                },
              ),
              GoRoute(
                name: "AddProduct",
                path: AppRouteName.addProductPage,
                builder: (BuildContext context, GoRouterState state) {
                  return AddProductPage();
                },
              ),
            ])
      ]);
}
