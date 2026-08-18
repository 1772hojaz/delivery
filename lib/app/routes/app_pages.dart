import 'package:get/get.dart';
import 'app_routes.dart';
import '../modules/onboarding/view.dart';
import '../modules/onboarding/binding.dart';
import '../modules/sign_up/view.dart';
import '../modules/sign_up/binding.dart';
import '../modules/sign_in/view.dart';
import '../modules/sign_in/binding.dart';
import '../modules/verification_code/view.dart';
import '../modules/verification_code/binding.dart';
import '../modules/via_method/view.dart';
import '../modules/via_method/binding.dart';
import '../modules/create_password/view.dart';
import '../modules/create_password/binding.dart';
import '../modules/signup_process/view.dart';
import '../modules/signup_process/binding.dart';
import '../modules/payment_method_setup/view.dart';
import '../modules/payment_method_setup/binding.dart';
import '../modules/upload_photo/view.dart';
import '../modules/upload_photo/binding.dart';
import '../modules/upload_preview/view.dart';
import '../modules/upload_preview/binding.dart';
import '../modules/onboarding_location/view.dart';
import '../modules/onboarding_location/binding.dart';
import '../modules/signup_success/view.dart';
import '../modules/signup_success/binding.dart';
import '../modules/success_notification/view.dart';
import '../modules/success_notification/binding.dart';
import '../modules/home/view.dart';
import '../modules/home/binding.dart';
import '../modules/explore_restaurant/view.dart';
import '../modules/explore_restaurant/binding.dart';
import '../modules/filter/view.dart';
import '../modules/filter/binding.dart';
import '../modules/explore_menu/view.dart';
import '../modules/explore_menu/binding.dart';
import '../modules/explore_restaurant_filtered/view.dart';
import '../modules/explore_restaurant_filtered/binding.dart';
import '../modules/explore_menu_filtered/view.dart';
import '../modules/explore_menu_filtered/binding.dart';
import '../modules/detail_product/view.dart';
import '../modules/detail_product/binding.dart';
import '../modules/detail_menu/view.dart';
import '../modules/detail_menu/binding.dart';
import '../modules/profile/view.dart';
import '../modules/profile/binding.dart';
import '../modules/track_order/view.dart';
import '../modules/track_order/binding.dart';
import '../modules/set_location/view.dart';
import '../modules/set_location/binding.dart';
import '../modules/order_details/view.dart';
import '../modules/order_details/binding.dart';
import '../modules/order_cart/view.dart';
import '../modules/order_cart/binding.dart';
import '../modules/payments/view.dart';
import '../modules/payments/binding.dart';
import '../modules/edit_payment/view.dart';
import '../modules/edit_payment/binding.dart';
import '../modules/edit_location/view.dart';
import '../modules/edit_location/binding.dart';
import '../modules/your_orders/view.dart';
import '../modules/your_orders/binding.dart';
import '../modules/voucher_promo/view.dart';
import '../modules/voucher_promo/binding.dart';
import '../modules/message/view.dart';
import '../modules/message/binding.dart';
import '../modules/chat_details/view.dart';
import '../modules/chat_details/binding.dart';
import '../modules/call_ringing/view.dart';
import '../modules/call_ringing/binding.dart';
import '../modules/call/view.dart';
import '../modules/call/binding.dart';
import '../modules/finish_order/view.dart';
import '../modules/finish_order/binding.dart';
import '../modules/rate_food/view.dart';
import '../modules/rate_food/binding.dart';
import '../modules/rate_restaurant/view.dart';
import '../modules/rate_restaurant/binding.dart';
import '../modules/notifications/view.dart';
import '../modules/notifications/binding.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final routes = <GetPage>[
  GetPage(name: Routes.onboarding, page: () => const OnboardingView(), binding: OnboardingBinding()),
  GetPage(name: Routes.signUp, page: () => const SignUpView(), binding: SignUpBinding()),
  GetPage(name: Routes.signIn, page: () => const SignInView(), binding: SignInBinding()),
  GetPage(name: Routes.verificationCode, page: () => const VerificationCodeView(), binding: VerificationCodeBinding()),
  GetPage(name: Routes.viaMethod, page: () => const ViaMethodView(), binding: ViaMethodBinding()),
  GetPage(name: Routes.createPassword, page: () => const CreatePasswordView(), binding: CreatePasswordBinding()),
  GetPage(name: Routes.signupProcess, page: () => const SignupProcessView(), binding: SignupProcessBinding()),
  GetPage(name: Routes.paymentMethodSetup, page: () => const PaymentMethodSetupView(), binding: PaymentMethodSetupBinding()),
  GetPage(name: Routes.uploadPhoto, page: () => const UploadPhotoView(), binding: UploadPhotoBinding()),
  GetPage(name: Routes.uploadPreview, page: () => const UploadPreviewView(), binding: UploadPreviewBinding()),
  GetPage(name: Routes.onboardingLocation, page: () => const OnboardingLocationView(), binding: OnboardingLocationBinding()),
  GetPage(name: Routes.signupSuccess, page: () => const SignupSuccessView(), binding: SignupSuccessBinding()),
  GetPage(name: Routes.successNotification, page: () => const SuccessNotificationView(), binding: SuccessNotificationBinding()),
  GetPage(name: Routes.home, page: () => const HomeView(), binding: HomeBinding()),
  GetPage(name: Routes.exploreRestaurant, page: () => const ExploreRestaurantView(), binding: ExploreRestaurantBinding()),
  GetPage(name: Routes.filter, page: () => const FilterView(), binding: FilterBinding()),
  GetPage(name: Routes.exploreMenu, page: () => const ExploreMenuView(), binding: ExploreMenuBinding()),
  GetPage(name: Routes.exploreRestaurantFiltered, page: () => const ExploreRestaurantFilteredView(), binding: ExploreRestaurantFilteredBinding()),
  GetPage(name: Routes.exploreMenuFiltered, page: () => const ExploreMenuFilteredView(), binding: ExploreMenuFilteredBinding()),
  GetPage(name: Routes.detailProduct, page: () => const DetailProductView(), binding: DetailProductBinding()),
  GetPage(name: Routes.detailMenu, page: () => const DetailMenuView(), binding: DetailMenuBinding()),
  GetPage(name: Routes.profile, page: () => const ProfileView(), binding: ProfileBinding()),
  GetPage(name: Routes.trackOrder, page: () => const TrackOrderView(), binding: TrackOrderBinding()),
  GetPage(name: Routes.setLocation, page: () => const SetLocationView(), binding: SetLocationBinding()),
  GetPage(name: Routes.orderDetails, page: () => const OrderDetailsView(), binding: OrderDetailsBinding()),
  GetPage(name: Routes.orderCart, page: () => const OrderCartView(), binding: OrderCartBinding()),
  GetPage(name: Routes.payments, page: () => const PaymentsView(), binding: PaymentsBinding()),
  GetPage(name: Routes.editPayment, page: () => const EditPaymentView(), binding: EditPaymentBinding()),
  GetPage(name: Routes.editLocation, page: () => const EditLocationView(), binding: EditLocationBinding()),
  GetPage(name: Routes.yourOrders, page: () => const YourOrdersView(), binding: YourOrdersBinding()),
  GetPage(name: Routes.voucherPromo, page: () => const VoucherPromoView(), binding: VoucherPromoBinding()),
  GetPage(name: Routes.message, page: () => const MessageView(), binding: MessageBinding()),
  GetPage(name: Routes.chatDetails, page: () => const ChatDetailsView(), binding: ChatDetailsBinding()),
  GetPage(name: Routes.callRinging, page: () => const CallRingingView(), binding: CallRingingBinding()),
  GetPage(name: Routes.call, page: () => const CallView(), binding: CallBinding()),
  GetPage(name: Routes.finishOrder, page: () => const FinishOrderView(), binding: FinishOrderBinding()),
  GetPage(name: Routes.rateFood, page: () => const RateFoodView(), binding: RateFoodBinding()),
  GetPage(name: Routes.rateRestaurant, page: () => const RateRestaurantView(), binding: RateRestaurantBinding()),
  GetPage(name: Routes.notifications, page: () => const NotificationsView(), binding: NotificationsBinding()),
  ];
}
