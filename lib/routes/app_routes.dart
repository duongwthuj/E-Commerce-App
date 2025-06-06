import 'package:get/get.dart';
import 'package:thuctapcoso/features/authentication/screens/forgot_password_screen.dart';
import 'package:thuctapcoso/features/authentication/screens/login/login.dart';
import 'package:thuctapcoso/features/authentication/screens/onboarding/onboarding.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/signup.dart';
import 'package:thuctapcoso/features/authentication/screens/signup/verify_email.dart';
import 'package:thuctapcoso/features/personalization/screens/address/address.dart';
import 'package:thuctapcoso/features/personalization/screens/profile/profile.dart';
import 'package:thuctapcoso/features/personalization/screens/settings/settings.dart';
import 'package:thuctapcoso/features/shop/screens/cart/cart.dart';
import 'package:thuctapcoso/features/shop/screens/checkout/checkout.dart';
import 'package:thuctapcoso/features/shop/screens/home/home.dart';
import 'package:thuctapcoso/features/shop/screens/order/order.dart';
import 'package:thuctapcoso/features/shop/screens/store/product_reviewers/product_reviewers.dart';
import 'package:thuctapcoso/features/shop/screens/store/store.dart';
import 'package:thuctapcoso/features/shop/screens/wishlist/wishlist.dart';
import 'package:thuctapcoso/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const Store()),
    GetPage(name: TRoutes.favourites, page: () => const FavouritesScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews,
        page: () => const ProductReviewerScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
