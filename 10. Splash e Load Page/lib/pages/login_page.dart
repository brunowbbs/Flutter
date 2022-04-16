import 'package:flutter/material.dart';
import 'package:splash/components/login/custom_login_button_component.dart';
import 'package:splash/controllers/login_controller.dart';
import 'package:splash/widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people,
                size: MediaQuery.of(context).size.height * 0.15,
                color: Colors.grey),
            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: 'Login',
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setPassword,
              label: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 15),
            CustomLoginButtonComponent(loginController: _controller)
          ],
        ),
      ),
    );
  }
}
