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

//get camer
