import 'package:flutter/material.dart';

import 'core/init/cache/shared_pref_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'view/authentication/onboard/view/onboard_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataManager.preferencesInit();
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      title: 'Material App',
      home:  OnBoardView(),
    );
  }
}



class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar()
    );
  }
}