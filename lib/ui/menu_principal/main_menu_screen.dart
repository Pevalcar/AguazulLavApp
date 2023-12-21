import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

import 'widgets/info_count.dart';
import 'widgets/menu_grid_conten.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Panel principal'),
            centerTitle: true,
            actions: [
              const DarkModeButton(),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              const SizedBox(width: 16),
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
    return Column(
      mainAxisAlignment:  MainAxisAlignment.end,
      children: [
        const InfoCount(),
        const Expanded(
          child: MenuGridConten(),
        ),
      ],
    );
  }
}
