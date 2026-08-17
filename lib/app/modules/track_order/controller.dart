import 'package:get/get.dart';
import '../../routes/app_routes.dart';

/// One step in the delivery status timeline.
class TrackStep {
  const TrackStep(this.label, this.time);
  final String label;
  final String time;
}

class TrackOrderController extends GetxController {
  /// Index of the current step in [steps] (0-based, inclusive of completed).
  final currentStep = 2.obs;

  final driverName = 'Michael Carter';
  final eta = '12 - 18 min';

  final steps = const <TrackStep>[
    TrackStep('Order Placed', '10:02 AM'),
    TrackStep('Preparing your food', '10:06 AM'),
    TrackStep('On the way', '10:18 AM'),
    TrackStep('Delivered', 'Est. 10:35 AM'),
  ];

  void callDriver() => Get.toNamed(Routes.call);

  void messageDriver() => Get.toNamed(Routes.message);

  void finishOrder() => Get.toNamed(Routes.finishOrder);
}
