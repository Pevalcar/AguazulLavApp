import 'package:aguazullavapp/gen/assets.gen.dart';
import 'package:aguazullavapp/providers/global/firebase_control.dart';
import 'package:aguazullavapp/ui/login/providers/providers_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/sign_button.dart';

import '../widgets/dark_mode_button.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [DarkModeButton()],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const LoginDesktop();
        } else {
          return const LoginMobile();
        }
      }),
    );
  }

 
}

class LoginDesktop extends HookConsumerWidget {
  const LoginDesktop({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(children: [
      Expanded(
        child: TitleHandles(),
      ),
      Expanded(
        child: FormLogin(),
      ),
    ]);
  }
}

class LoginMobile extends HookConsumerWidget {
  const LoginMobile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TitleHandles(),
          SizedBox(height: 16),
          FormLogin(),
        ],
      ),
    );
  }
}

class TitleHandles extends HookConsumerWidget {
  const TitleHandles({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screensmode = ref.watch(screensModeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.pruebaCopy2
            .image(alignment: Alignment.center, height: 80, width: 80),
        const SizedBox(height: 16),
        Text(
          switch(_screensmode) {
            screensMode.login => "Bienvenido",
            screensMode.register => "Registrarse",
            screensMode.forgot => "Recuperar Contraseña",
          },
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "Tu app contable para tu negocio",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class FormLogin extends HookConsumerWidget {
  const FormLogin({
    Key? key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _keyForm = GlobalKey<FormState>();
    final _passController = useTextEditingController();
    final _mailController = useTextEditingController();

    ref.listen(
      firebaseControlProvider,
      (previous, next) {

        if (next.asData?.value != null) {
          _showToast(context, "Bienvenido");
          context.go("/principal");
        }
        if (next.asError?.error != null ) {
          debugPrint(next.asError!.error.toString());
          _showToast(context,  "Usuario o contraseña incorrectos");
        }
      },
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _keyForm,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Correo",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                        controller: _mailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo requerido';
                          } else if (!value.contains('@') ||
                              !value.contains('.')) {
                            return 'Email no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "m@ejemail.com",
                          border: OutlineInputBorder(),
                        )),
                    const SizedBox(height: 16),
                    Text(
                      "Contraseña",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    passField(controllerPass: _passController)
                  ]),
            ),
          ),
          const SizedBox(height: 16),
          SignInButton(
            btnColor: Theme.of(context).colorScheme.primary,
            buttonSize: ButtonSize.large,
            buttonType: ButtonType.mail,
            onPressed: () {
              if (_keyForm.currentState!.validate()) {
                ref
                    .read(firebaseControlProvider.notifier)
                    .login(_mailController.text, _passController.text);
              }
            },
            btnText: "Ingresar",
          ),
          const SizedBox(height: 16),
          Text(
            "O ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          SignInButton.mini(
            buttonSize: ButtonSize.large,
            buttonType: ButtonType.googleDark,
            onPressed: () {
              ref.read(firebaseControlProvider.notifier).signInWithGoogle();
            },
          ),
          const SizedBox(height: 32),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
                child: Text("¿Olvidaste tu \n contraseña?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  // TODO Implementar
                }),
            Column(
              children: [
                const Text(
                  "¿No tienes una cuenta?",
                ),
                TextButton(
                    child: Text("Registrate",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    onPressed: () {
                      ref.read(screensModeProvider.notifier).toggle(
                            screensMode.register,
                      ) ;
                    }),
              ],
            )
          ])
        ],
      ),
    );
  }
   void _showToast(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

class passField extends HookConsumerWidget {
  final controllerPass;
  const passField({
    super.key,
    required this.controllerPass,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPAss = ref.watch(showPassProvider);
    return TextFormField(
        controller: controllerPass,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido';
          }
          return null;
        },
        obscureText: showPAss,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
              onPressed: () {
                ref.read(showPassProvider.notifier).toggle();
              },
              icon: Icon(
                showPAss ? Icons.visibility : Icons.visibility_off,
              )),
        ));
  }
}
