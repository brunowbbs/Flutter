import 'package:flutter/material.dart';
import 'package:splash/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButtonComponent({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loginController.inLoader,
        builder: (_, inLoader, __) => inLoader
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  loginController.auth().then((value) => {
                        if (value)
                          {Navigator.of(context).pushReplacementNamed("/home")}
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Login ou senha invalido(s)"),
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.red,
                              action: SnackBarAction(
                                  textColor: Colors.white,
                                  label: "Erro",
                                  onPressed: () {}),
                            ))
                          }
                      });
                },
                child: const Text("Login")));
  }
}
