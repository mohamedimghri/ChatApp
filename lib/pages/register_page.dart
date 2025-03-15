import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  void register() {}

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
              "Let's create an account for you",
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
              height: 20,
            ),
            MyTextfield(
              hintText: "Confirm Password",
              obscurText: true,
              controllerText: _confirmPasswordController,
            ),
            SizedBox(
              height: 25,
            ),
            //button login
            MyButton(text: "Register", onTap: register),
            SizedBox(
              height: 25,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
