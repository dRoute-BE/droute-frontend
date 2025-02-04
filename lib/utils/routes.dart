
import 'package:flutter/material.dart';
import 'package:droute_frontend/screens/auth/signup.dart';
import 'package:droute_frontend/screens/auth/signin.dart';
import 'package:droute_frontend/screens/auth/otp_page.dart';
import 'package:droute_frontend/screens/auth/forget_password.dart';
// import 'package:droute_frontend/screens/user/welcome.dart';


final Map<String, WidgetBuilder> appRoutes = {
  '/signup': (context) => const SignUpPage(),
  '/signin': (context) => const SignInPage(),
  '/otp': (context) => const OtpPage(),
  '/forget-password': (context) => const ForgetPassword(),
  // '/welcome-page': (context) => const WelcomePage(),
};
