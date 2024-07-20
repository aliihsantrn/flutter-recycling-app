import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/auth/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {


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
      backgroundColor: const Color.fromARGB(255, 23, 89, 74),
      body: Container(
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Positioned(
                top: 24,
                left: 8,
                child: customIconButton(context),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customSizedBox(200),
                      pageTitle("Tekrar Hoşgeldiniz \n      Giriş Yapınız"),
                      customSizedBox(50),
                      emailTextField(),
                      customSizedBox(20),
                      passwordTextField(),
                      customSizedBox(50),
                      customElevatedButton("Giriş Yap"),
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
             color: const Color.fromARGB(255, 211, 209, 78),
             iconSize: 36,
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
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 211, 209, 78), // Arka plan rengi
              shadowColor: Colors.white, // Yazı rengi
            ),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            );
  }

  Text pageTitle(String title) {
    return Text(
            title,
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400
            )
          );
  }

  Widget customSizedBox(double num) => SizedBox(height: num);

  TextFormField emailTextField() {
    return TextFormField(
      decoration: textInputDecoration("E-posta"),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      validator: (value) {
        if(value!.isEmpty){
          return "Lütfen e-posta giriniz";
        }
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: textInputDecoration("Şifre"),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      validator: (value) {
        if(value!.isEmpty){
          return "Lütfen şifre giriniz";
        }
      },
      onSaved: (value) {
        password = value!;
      },
    );
  }

  InputDecoration textInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300
        ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.white
        )
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
        color: Colors.white
        )
      )
    );
  }
}
