import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/auth/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late String email, password, confirmPassword;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 89, 74),
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
                    pageTitle("Daha Yeşil Bir Gelecek İçin \n     Lütfen Kayıt Olunuz"),
                    customSizedBox(50),
                    emailTextField(),
                    customSizedBox(20),
                    passwordTextField(),
                    customSizedBox(20),
                    confirmPasswordTextField(),
                    if (_confirmationMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _confirmationMessage,
                        style: TextStyle(
                          fontSize: 12,
                          color: _confirmationMessage == "Şifreler uyuşuyor"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                    customSizedBox(50),
                    customElevatedButton("Kayıt Ol"),
                    customSizedBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Zaten bir hesabınız var mı?",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 8)),
                        customTextButton("Giriş Yap")
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
                color: Color.fromARGB(255, 211, 209, 78),
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
          setState(() {
            if (_passwordController.text == _confirmPasswordController.text) {
              _confirmationMessage = "Passwords match!";
            } else {
              _confirmationMessage = "Passwords do not match.";
            }
          });

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
              fontWeight: FontWeight.w300
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
      controller: _passwordController,
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

  TextFormField confirmPasswordTextField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: textInputDecoration("Şifre tekrar"),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      validator: (value) {
        if(value!.isEmpty){
          return "Lütfen şifreyi tekrar giriniz";
        }
        if (value != _passwordController.text) {
          return "Şifreler eşleşmiyor";
        }
        return null;
      },
      onSaved: (value) {
        confirmPassword = value!;
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