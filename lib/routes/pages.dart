import 'package:get/get.dart';
import 'package:pasmobile11pplg1_06/bindings/auth_binding.dart';
import 'package:pasmobile11pplg1_06/bindings/bottom_nav_binding.dart';
import 'package:pasmobile11pplg1_06/bindings/favoritepage_binding.dart';
import 'package:pasmobile11pplg1_06/bindings/listproduk_binding.dart';
import 'package:pasmobile11pplg1_06/bindings/profile_binding.dart';
import 'package:pasmobile11pplg1_06/bindings/splashscreen_binding.dart';
import 'package:pasmobile11pplg1_06/pages/bottomnav_page.dart';
import 'package:pasmobile11pplg1_06/pages/favorite_page.dart';
import 'package:pasmobile11pplg1_06/pages/listproduk_page.dart';
import 'package:pasmobile11pplg1_06/pages/login_page.dart';
import 'package:pasmobile11pplg1_06/pages/profile_page.dart';
import 'package:pasmobile11pplg1_06/pages/register_page.dart';
import 'package:pasmobile11pplg1_06/pages/splashscreen_page.dart';
import 'package:pasmobile11pplg1_06/routes/routes.dart';

class AppPages {
  // FIX #1: Ubah initial route ke splash
  static const String initial = AppRoutes.bottomNav;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashscreenPage(),
      binding: SplashscreenBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => BottomnavPage(),
      bindings: [
        BottomNavBinding(),
        ListprodukBinding(),
        FavoritepageBinding(),
        ProfileBinding(),
        AuthBinding(), // FIX #4: Tambahkan AuthBinding untuk ProfileController
      ],
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.listProduk,
      page: () => const ListprodukPage(),
      binding: ListprodukBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.favorite,
      page: () => const FavoritePage(),
      binding: FavoritepageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      bindings: [
        ProfileBinding(),
        AuthBinding(),
      ],
      transition: Transition.rightToLeft,
    ),
  ];
}