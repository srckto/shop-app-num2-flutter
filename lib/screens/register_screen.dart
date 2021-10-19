import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_num2/controller/register_controller.dart';
import 'package:shop_app_num2/screens/login_screen.dart';
import 'package:shop_app_num2/widgets/defult_icon.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController _registerController = Get.put(RegisterController());

  TextEditingController _emailController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool visibility = true;

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
                      "REGISTER",
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
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Name"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your name";
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
                              onPressed: () => _registerController.changeVisibility(),
                              icon: _registerController.visibility.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        obscureText: _registerController.visibility.value,
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
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: Icon(Icons.phone),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("Phone Number"),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Please enter your phoneNumber";
                        } else
                          return null;
                      },
                    ),
                    SizedBox(height: 30),
                    // SizedBox()
                    Obx(() {
                      if (_registerController.state.value == false) {
                        return DefultIcon(
                          label: "Register",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _registerController.register(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                                phone: _phoneController.text,
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
                          "You have an account ?",
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                                fontSize: 17,
                              ),
                        ),
                        DefultIcon(
                          label: "LOGIN",
                          labelColor: Theme.of(context).primaryColor,
                          horizontalPadding: 10,
                          onPressed: () {
                            Get.off(() => LoginScreen());
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
}
