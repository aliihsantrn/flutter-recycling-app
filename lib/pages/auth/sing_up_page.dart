import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/auth/home_page.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late String email, password, confirmPassword;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    pageTitle("WELCOME, \n SIGN UP"),
                    customSizedBox(20),
                    emailTextField(),
                    customSizedBox(20),
                    passwordTextField(),
                    customSizedBox(20),
                    confirmPasswordTextField(),
                    customSizedBox(20),
                    customElevatedButton("Sign Up"),
                    customSizedBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const Padding(padding: EdgeInsets.only(right: 8)),
                        customTextButton("Sign In")
                      ],
                    )
                  ],
                ),
              ),
            ),)
        ),
      ),
    );
  }

  TextButton customTextButton(String txt) {
    return TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/signInPage");
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                try {
                  var userResult = await firebaseAuth.createUserWithEmailAndPassword(
                    email: email, password: password
                  );
                  
                  formKey.currentState!.reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        message: "Sign Up is Successfuly",
                        email: email,
                        password: password,
                      ),
                    ),
                  );
                  print(userResult.user!.uid);
                  
                } catch (e) {
                  print(e.toString());
                }
              }
            }, 
            child: Text(text, style: const TextStyle(color: Colors.blue),),
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
      validator: (value) {
        if(value!.isEmpty){
          return "Please enter email address";
        }
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: textInputDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return "Please enter password";
        }
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      decoration: textInputDecoration("Password"),
    );
  }

  TextFormField confirmPasswordTextField() {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return "Please enter confirm password";
        }
      },
      onSaved: (value) {
        confirmPassword = value!;
      },
      obscureText: true,
      decoration: textInputDecoration("Confirm Password"),
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