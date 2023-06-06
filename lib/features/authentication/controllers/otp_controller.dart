
import 'package:fitly/features/authentication/controllers/authentication_repositary.dart';
import 'package:fitly/main.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();
}

void verifyOTP(String otp) async{
  var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
  isVerified ? Get.offAll(const Fitly()) : Get.back();
}