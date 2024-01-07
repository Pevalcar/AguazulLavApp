import 'package:flutter/material.dart';

enum SERVICETYPE {
  ENJUAGE,
  GENERAL,
  LATAS,
  POLICHADA,
  OTRO,
}


void showErrorToast(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    String error0 = error;

    if (error0.contains("email-already-in-use")) {
      error0 = "El correo ya se encuentra registrado";
    } else if (error0.contains("invalid-credential")) {
      error0 = "El usuario o la contraseña son incorrectos";
    } else if (error0.contains("invalid-email")) {
      error0 = "Email no válido";
    } else if (error0.contains("user-not-found")) {
      error0 = "Usuario no encontrado";
    } else if (error0.contains("too-many-requests")) {
      error0 = "Demaciados intetnos fallidos, intente mas tarde o recuperar su contraseña";
    } else if (error0.contains("popup_closed")) {
      error0 = "Inicio cancelado";
    }
    debugPrint(error0);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error0),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void showToast(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }