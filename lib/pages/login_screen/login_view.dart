import 'package:flutter/material.dart';
import 'package:project/core/widgets/custom_text_form_field.dart';
import 'package:project/pages/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisable = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/login_pic.png"),
                SizedBox(height: mediaQuery.height * 0.05),
                Padding(
                  padding: EdgeInsets.all(mediaQuery.width * 0.1),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your email";
                          }
                          var regularExpression = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!regularExpression.hasMatch(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                        labelText: "Email",
                      ),
                      SizedBox(height: mediaQuery.height * 0.035),
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: isVisable,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your password";
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            isVisable = !isVisable;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              isVisable == true ? "View" : "Hide",
                              style: const TextStyle(
                                  color: Color(0xff14213D),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text("Forget My Password",
                                style: TextStyle(color: Color(0xffE9824E))),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffE9824E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 136, vertical: 10),
                        ),
                        onPressed: () {},
                        child: const Text("Login",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Color(0xffE9824E)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 85, vertical: 10),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: const Text(
                          "Create New account",
                          style: TextStyle(color: Color(0xff233166)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
