import 'package:get/get.dart';
import '../bindings/bookmark_binding.dart';
import '../bindings/bottomnav_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/product_binding.dart';
import '../bindings/profile_binding.dart';
import '../bindings/register_binding.dart';
import '../bindings/splashscreen_binding.dart';
import '../pages/bookmark_page.dart';
import '../pages/bottomnav_page.dart';
import '../pages/login_page.dart';
import '../pages/product_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';
import '../pages/splash_screen_page.dart';
import '../routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.register,
        page: () => RegisterPage(),
        binding: RegisterBinding()
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()
    ),
    GetPage(
        name: AppRoutes.product,
        page: () => ProductPage(),
        binding: ProductBinding()
    ),
    GetPage(
        name: AppRoutes.bookmark,
        page: () => BookmarkPage(),
        binding: BookmarkBinding()
    ),
    GetPage(
        name: AppRoutes.profile,
        page: () => ProfilePage(),
        binding: ProfileBinding()
    ),
    GetPage(
        name: AppRoutes.bottomnav,
        page: () => BottomnavPage(),
        binding: BottomnavBinding()
    ),
    GetPage(
        name: AppRoutes.splashscreen,
        page: () => SplashScreenPage(),
        binding: SplashScreenBinding()
    ),

  ];
}