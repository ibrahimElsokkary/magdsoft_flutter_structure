import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

import '../screens/shared/login_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/user':
        return MaterialPageRoute(builder: (_) => UserPage());  
      default:
        return null;
    }
  }
}
