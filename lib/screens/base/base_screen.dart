import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:super_basilio_app/common/custom_drawer/custom_drawer.dart';
import 'package:super_basilio_app/models/page_manager.dart';
import 'package:super_basilio_app/models/user_manager.dart';
import 'package:super_basilio_app/screens/admin_orders/admin_orders_screen.dart';
import 'package:super_basilio_app/screens/admin_users/admin_users_screen.dart';
import 'package:super_basilio_app/screens/home/home_screen.dart';
import 'package:super_basilio_app/screens/orders/orders_screen.dart';
import 'package:super_basilio_app/screens/products/products_screen.dart';
import 'package:super_basilio_app/screens/stores/stores_screen.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              ProductsScreen(),
              OrdersScreen(),
              StoresScreen(),
              //TestesScreen(),
              if(userManager.adminEnabled)
                ...[
                  AdminUsersScreen(),
                  AdminOrdersScreen(),
                ]

            ],
          );
        },
      ),
    );
  }
}