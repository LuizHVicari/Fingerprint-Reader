import 'package:camera/camera.dart';

class SubmitFingerPrintController {
  late XFile? image; 
  late String? id;
  late double? months;

  static SubmitFingerPrintController instance = SubmitFingerPrintController();

  void submit() {
    if (image != null && id != null && months != null) {
      // TODO implement submit logic
      image = null;
      id = null;
      months = null;
    }
  }
}