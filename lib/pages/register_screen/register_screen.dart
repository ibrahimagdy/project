import 'package:flutter/material.dart';
import 'package:project/core/widgets/custom_text_form_field.dart';
import 'package:project/pages/login_screen/login_view.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isViasble = true;
  bool confirmPasswordVisale = true;
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
                Image.asset(
                  "assets/images/register_pic.png",
                  width: mediaQuery.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: firstNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your First Name";
                          }
                          return null;
                        },
                        labelText: "First Name",
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      CustomTextFormField(
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your Last Name";
                          }
                          return null;
                        },
                        labelText: "Last Name",
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
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
                      SizedBox(height: mediaQuery.height * 0.03),
                      CustomTextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your Phone Number";
                          }
                          var regularExpression = RegExp(
                              r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/');
                          if (!regularExpression.hasMatch(value)) {
                            return "Invalid Phone Number";
                          }
                          return null;
                        },
                        labelText: "Phone Number",
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: isViasble,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "You must enter your password";
                          }
                          var regularExpression = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (!regularExpression.hasMatch(value)) {
                            return "Invalid Password";
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            isViasble = !isViasble;
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              isViasble == true ? "View" : "Hide",
                              style: const TextStyle(
                                  color: Color(0xff14213D),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.03),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffE9824E),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 14),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Create New Account",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Color(0xffE9824E),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
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
