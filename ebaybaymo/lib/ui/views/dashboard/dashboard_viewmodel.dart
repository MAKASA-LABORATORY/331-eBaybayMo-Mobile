import 'dart:io';

import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:image_picker/image_picker.dart';

class DashboardViewModel extends AppBaseViewModel {
  File? _pickedImage;

  File? get pickedImage => _pickedImage;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _pickedImage = File(image.path);
      notifyListeners();
    }
  }
}
