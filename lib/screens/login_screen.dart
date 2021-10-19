import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/login_controller.dart';
import 'package:shop_app_num2/screens/register_screen.dart';
import 'package:shop_app_num2/widgets/defult_icon.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "LOGIN",
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Email Address"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your email";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 30),
                    Obx(
                      () => TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outline),
                          label: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("password"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              onPressed: () => _loginController.changeVisibility(),
                              icon: _loginController.visibility.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        obscureText: _loginController.visibility.value,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Pawword is too short";
                          } else
                            return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Obx(() {
                      if (_loginController.state.value == false) {
                        return DefultIcon(
                          label: "Login",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _loginController.login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                            }
                          },
                        );
                      } else
                        return CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        );
                    }),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You don't have an account ?",
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                                fontSize: 17,
                              ),
                        ),
                        DefultIcon(
                          label: "register".toUpperCase(),
                          labelColor: Theme.of(context).primaryColor,
                          horizontalPadding: 10,
                          onPressed: () {
                            Get.off(() => RegisterScreen());
                          },
                          elevation: 0.0,
                          primaryColor: Colors.transparent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
}
