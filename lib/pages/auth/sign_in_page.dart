import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/auth/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: formKey,
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
            onPressed: () async {
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();

                try {
                  var userResult = await firebaseAuth.signInWithEmailAndPassword(
                    email: email, password: password
                  );

                  formKey.currentState!.reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        message: "Sign In is Successfuly",
                        email: email,
                        password: password,
                      ),
                    ),
                  );
                  
                } catch (e) {
                  print(e.toString());
                }
              }
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
          return "Please enter email address";
        }
      },
      onSaved: (value) {
        password = value!;
      },
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
