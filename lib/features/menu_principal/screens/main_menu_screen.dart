import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});
  Future<void> requestPermission(BuildContext context) async {
    const permission = Permission.bluetoothAdvertise;

    if (await permission.isDenied) {
      await permission.request();
    } else if (await permission.isPermanentlyDenied) {
      await showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (_) => AlertDialog(
                  title: const Text('Permisos Denegados'),
                  content: const Column(
                    children: [
                      Text(
                          'Para poder usar esta app es necesario aceptar los permisos'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        openAppSettings();
                      },
                      child: const Text('Abrir ajustes'),
                    ),
                  ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    requestPermission(context);

    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Panel principal'),
            centerTitle: true,
            actions: const [
              // IconButton(
              //     onPressed: () {
              //       const UpgraderRoute().push(context);
              //     },
              //     //TODO agregar bagde de actualizaciones
              //     icon: Icon(Icons.update)) ,
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
