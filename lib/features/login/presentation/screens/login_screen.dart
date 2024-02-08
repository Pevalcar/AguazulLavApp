import 'package:aguazullavapp/lib.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/sign_button.dart';

//TODO implementar clean Arquitecture
class Login extends HookConsumerWidget {
  const Login({super.key});
//TODO agregar guardado en pc de credenciales
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: const [DarkModeButton()],
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
    final screensmode = ref.watch(screensModeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.placeolder
            .image(alignment: Alignment.center, height: 80, width: 80),
        const SizedBox(height: 16),
        Text(
          switch (screensmode) {
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
  const FormLogin({super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyForm = GlobalKey<FormState>();
    final passController = useTextEditingController();
    final mailController = useTextEditingController();
    final screensmode = ref.watch(screensModeProvider);
    ref.listen(
      userStateCurrentProvider,
      (previous, next) {
        if (next.asData?.value != null) {
          showToast(context, "Bienvenido");
          context.go("/principal");
        }
        if (next.asError?.error != null) {
          showErrorToast(context, next.asError!.error.toString());
        }
      },
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: keyForm,
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
                        controller: mailController,
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
                    screensmode == screensMode.forgot
                        ? const SizedBox()
                        : Text(
                            "Contraseña",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                    const SizedBox(height: 16),
                    screensmode == screensMode.forgot
                        ? const SizedBox()
                        : PassField(controllerPass: passController, submited: (_
                        ) => _login(context, mailController, passController, keyForm, ref, screensmode)),
                  ]),
            ),
          ),
          const SizedBox(height: 16),
          SignInButton(
            btnColor: Theme.of(context).colorScheme.primary,
            buttonSize: ButtonSize.large,
            buttonType: ButtonType.mail,
            onPressed: () => _login(context, mailController, passController,
                keyForm, ref, screensmode),
            btnText: switch (screensmode) {
              screensMode.login => "Ingresar",
              screensMode.register => "Registrarse",
              screensMode.forgot => "Recuperar Contraseña",
            },
          ),
          const SizedBox(height: 16),
          defaultTargetPlatform != TargetPlatform.windows || kIsWeb ?  Text(
            "O ",
            style: Theme.of(context).textTheme.bodyLarge,
          ) : const SizedBox(),
          const SizedBox(height: 16),
          
          defaultTargetPlatform != TargetPlatform.windows || kIsWeb ?  SignInButton.mini(
            buttonSize: ButtonSize.large,
            buttonType: ButtonType.googleDark,
            onPressed: () {
              ref.read( userStateCurrentProvider.notifier).signInWithGoogle();
            },
          ) : const SizedBox(),
          const SizedBox(height: 32),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
                child: Text(
                    screensmode != screensMode.login
                        ? "Ya tengo una cuenta"
                        : "¿Olvidaste tu \n contraseña?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
                onPressed: () {
                  ref.read(screensModeProvider.notifier).toggle(
                      screensmode == screensMode.login
                          ? screensMode.forgot
                          : screensMode.login);
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
                          );
                    }),
              ],
            )
          ])
        ],
      ),
    );
  }

  

  

  void _login(
      BuildContext context,
      TextEditingController mail,
      TextEditingController pass,
      GlobalKey<FormState> keyForm,
      WidgetRef ref,
      screensMode screensmode) {
    if (keyForm.currentState!.validate()) {
      switch (screensmode) {
        case screensMode.login:
          {
            ref
                .read(userStateCurrentProvider.notifier)
                .login(mail.text, pass.text);
          }

        case screensMode.register:
          {
            ref
                .read(userStateCurrentProvider.notifier)
                .register(mail.text, pass.text);
          }

        case screensMode.forgot:
          {
            ref.read(userStateCurrentProvider.notifier).forgot(mail.text);
            showToast(context,
                "Se ha enviado un correo para recuperar tu contraseña");
            ref.read(screensModeProvider.notifier).toggle(screensMode.login);
          }
      }
    }
  }
}

class PassField extends HookConsumerWidget {
  final TextEditingController controllerPass;

  final Function submited;

  const PassField( {
    super.key,
    required this.controllerPass,
    required this.submited,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPAss = ref.watch(showPassProvider);
    return TextFormField(
      onFieldSubmitted: (value) => submited(value),
        controller: controllerPass,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido';
          } else if (value.length < 6) {
            return 'Contraseña no válida debe tener almenos 6 caracteres';
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
