import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: customIconButton(context),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customSizedBox(200),
                    pageTitle("WELCOME, \n SIGN IN"),
                    customSizedBox(20),
                    emailTextField(),
                    customSizedBox(20),
                    passwordTextField(),
                    customSizedBox(30),
                    customElevatedButton("Sign in"),
                  ],
                )
              )
            ),
          ],
        ),
      )
    );
  }

  IconButton customIconButton(BuildContext context) {
    return IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signUpPage");
            },
             icon: const Icon(Icons.arrow_back),
             alignment: Alignment.topLeft,
          );
  }

  TextButton customTextButton(String txt) {
    return TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signUpPage");
            },
            child: Text(
              txt,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
                ),
              )
          );
  }

  ElevatedButton customElevatedButton(String text,) {
    return ElevatedButton(
            onPressed: () {
              
            }, 
            child: Text(text, style: const TextStyle(color:  Colors.blue),),
            );
  }

  Text pageTitle(String title) {
    return Text(
            title,
            style: const TextStyle(
              fontSize: 30,
               fontWeight: FontWeight.bold
               ),
          );
  }

  Widget customSizedBox(double num) => SizedBox(height: num);

  TextFormField emailTextField() {
    return TextFormField(
      decoration: textInputDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: textInputDecoration("Password"),
    );
  }

  InputDecoration textInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.grey
        )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.grey
        )
      )
    );
  }
}
