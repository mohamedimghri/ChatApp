import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.chat_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(
              height: 50,
            ),
            //mesage
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            //input
            MyTextfield(
              hintText: "Email",
              obscurText: false,
              controllerText: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: "Password",
              obscurText: true,
              controllerText: _passwordController,
            ),
            SizedBox(
              height: 25,
            ),
            //button login>
            MyButton(text: "login", onTap: () => login(context)),
            SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
