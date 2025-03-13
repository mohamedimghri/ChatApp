import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    LoginPage({super.key});
    void login(){

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
            SizedBox(height: 25,),
            //button login
            MyButton(text: "login", onTap: login),
            SizedBox(height: 25,),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage())),
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
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