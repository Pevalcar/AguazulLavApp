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
    String _error = error;

    if (_error.contains("email-already-in-use")) {
      _error = "El correo ya se encuentra registrado";
    } else if (_error.contains("invalid-credential")) {
      _error = "El usuario o la contraseña son incorrectos";
    } else if (_error.contains("invalid-email")) {
      _error = "Email no válido";
    } else if (_error.contains("user-not-found")) {
      _error = "Usuario no encontrado";
    } else if (_error.contains("too-many-requests")) {
      _error = "Demaciados intetnos fallidos, intente mas tarde o recuperar su contraseña";
    } else if (_error.contains("popup_closed")) {
      _error = "Inicio cancelado";
    }
    debugPrint(_error);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(_error),
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