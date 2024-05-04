import 'package:flutter/material.dart';
import 'package:hotel_reservation_project/features/auth/Onboarding/onbordingview.dart';
import 'package:hotel_reservation_project/features/auth/forget_password/view/page/forgetPassword_page.dart';
import 'package:hotel_reservation_project/features/auth/login/view/page/login.dart';
import 'package:hotel_reservation_project/features/auth/signup/view/page/signup_page.dart';
import 'package:hotel_reservation_project/features/auth/confirm_password/view/page/confirm_password_page.dart';
import 'package:hotel_reservation_project/features/auth/vererfication_code/view/page/verification_code_page.dart';
import 'package:hotel_reservation_project/features/dashboard/view/page/dashboard_page.dart';

void main() {
  runApp(MyApp());
}
  

class MyApp extends StatelessWidget{
 
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeGenerator.onGenerateRoute,
      initialRoute: 'Onborading',
      // onGenerateInitialRoutes: (_) =>routeGenerator.initRoutes,
      );
  }
}

class routeGenerator {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const dashBoardPage(),
    ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    //final args = settings.arguments;
    //final List data = settings.arguments as List;

    switch (settings.name) {
      case 'login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const loginScreen(),
        );
      case 'signup':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const SignUpScreen(),
        );

      case 'forgetPassword':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const forgetPaswwordScreen(),
        );
      case 'verificationCode':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const VerificationCodeScreen(),
        );
        case 'confirmPassword':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const confirmPasswordScreen(),
        );
      case 'dashBoard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const dashBoardPage(),
        );
      case 'Onborading':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnboradingView(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const  OnboradingView(),
        );
    }
  }
}
