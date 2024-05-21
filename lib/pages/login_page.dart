import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradeuz/common/router/route_name.dart';

import '../models/product_model.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Username",
                  ),
                  validator: (username) =>
                      username! != "admin" ? "Username is incorrect" : null),
              SizedBox(height: 30),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Password",
                  ),
                  validator: (password) =>
                      password! != "admin123" ? "Password is incorrect" : null),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go(AppRouteName.addProductPage);
                  }
                },
                color: Colors.grey,
                minWidth: double.infinity,
                height: 60,
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Tizimga kirish",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
