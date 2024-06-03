import 'package:get/get.dart';
import 'message_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MessageController>(MessageController());
  }
}
