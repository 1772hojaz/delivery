import 'package:get/get.dart';
import 'controller.dart';

class ChatDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsController>(() => ChatDetailsController());
  }
}
