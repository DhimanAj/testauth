import 'package:auth/infrastructure/navigation/routes.dart';
import 'package:auth/presentation/booking_details/booking_detail_binding.dart';
import 'package:auth/presentation/booking_details/booking_detail_page.dart';
import 'package:get/get.dart';

import '../../presentation/home/bindings/home_binding.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/login/bindings/login_binding.dart';
import '../../presentation/login/login_screen.dart';

import '../../presentation/otp/bindings/otp_binding.dart';

import '../../presentation/otp/otp_screen.dart';
import '../../presentation/signup/bindings/signup_binding.dart';
import '../../presentation/signup/signup_screen.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/splash_screen.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),


    GetPage(
      name: Routes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: Routes.home,
      page: () => BaseHomeScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.bookingDetail,
      page: () => BookingDetailPage(),
      binding: BookingDetailBinding(),
    ),


  ];
}
