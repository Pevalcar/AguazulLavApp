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
            actions: [
              const DarkModeButton(),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {

                  //TODO agregar cicle avatar
                },
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
    return const Column(
      mainAxisAlignment:  MainAxisAlignment.end,
      children: [
        InfoCount(),
        Expanded(
          child: MenuGridConten(),
        ),
      ],
    );
  }
}

