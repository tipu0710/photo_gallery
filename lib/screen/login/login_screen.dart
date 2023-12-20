import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_gallery/provider/login_provider.dart';
import 'package:photo_gallery/uiHelper/input_field.dart';
import 'package:photo_gallery/utils/constant.dart';
import 'package:photo_gallery/utils/extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: 300,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Hero(
                  tag: "splashLogo",
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 50,
                  ),
                ),
                const SizedBox(height: 13),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: AutoSizeText(
                    'Login to Photo Gallery',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      letterSpacing: 0.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: AutoSizeText(
                    'Unveil Moments, Embrace the Unexpected!',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 76, 76, 76),
                      letterSpacing: 0.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                InputField(
                  controller: emailController,
                  focusNode: emailFocus,
                  labelText: "Email",
                  autofillHints: const [
                    AutofillHints.email,
                    AutofillHints.username
                  ],
                  validator: (email) {
                    bool validate = email.validateEmail();
                    return validate ? null : "Invalid Email";
                  },
                ),
                const SizedBox(height: 15),
                InputField(
                  controller: passwordController,
                  focusNode: passwordFocus,
                  labelText: "password",
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                ),
                const SizedBox(height: 40),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return ElevatedButton(
                      onPressed: () {
                        emailFocus.unfocus();
                        passwordFocus.unfocus();
                        if (_formKey.currentState?.validate() == true) {
                          ref.read(loginProvider.notifier).login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
