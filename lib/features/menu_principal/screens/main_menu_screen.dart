import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Panel principal'),
            centerTitle: true,
            actions: const [
              DarkModeButton(),
              SizedBox(width: 16),
              AvatarIcon(),
              SizedBox(width: 16),
            ],
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return const MainMenuDesktop();
            }
            return const MainMenuMobile();
          }),
        ),
      ),
    );
  }
}

class AvatarIcon extends HookConsumerWidget {
  const AvatarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(userStateCurrentProvider.notifier).signOut();
        //TODO agregar cicle avatar
      },
      child: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}

class MainMenuMobile extends StatelessWidget {
  const MainMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: MenuGridConten(),
        ),
        InfoCount(),
      ],
    );
  }
}

class MainMenuDesktop extends StatelessWidget {
  const MainMenuDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InfoCount(),
        Expanded(
          child: MenuGridConten(),
        ),
      ],
    );
  }
}
