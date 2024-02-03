import 'package:aguazullavapp/lib.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class DarkModeButton extends HookConsumerWidget {
  const DarkModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(dartModeProvider);
    return IconButton(
    
      onPressed: () {
        ref.read(dartModeProvider.notifier).toggle();
      },
      icon: mode == ThemeMode.dark ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
    );
  }
}
