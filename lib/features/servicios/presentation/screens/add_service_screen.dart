import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/desktop_ui/desktop_add_service.dart';

class AddServiceScreen extends HookConsumerWidget {
  const AddServiceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const MobileAddService();
      }
      return const DesktopAddService();
    });
  }
}

//get camera
getFromCamera(VehiculoState ref) async {
  XFile? pickedFile = (await ImagePicker().pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  ));
  if (pickedFile != null) {
    // ref.addPhoto(pickedFile.path);
  }
}

/// Get from gallery
getFromGallery(VehiculoState ref) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // ref.addPhoto(image.path);
  }
}
