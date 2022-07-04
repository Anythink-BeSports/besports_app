import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_application/register_page.dart';
import 'package:sports_application/service.controller/Auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: w,
              height: h / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "BeSports",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ),
            SizedBox(
              width: w - w / 10,
              height: h / 3,
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color:Colors.black,
                              width: 1.5
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: w, height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color:Colors.black,
                              width: 1.5
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color:Colors.grey,
                              width: 1.0
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: w,
              height: h / 3,
              child: Column(
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(w - w / 10, 24),
                      textStyle: const TextStyle(fontSize: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                      onPressed: () => AuthController.instance.login(emailController.text.trim(), passwordController.text.trim()),
                      child: const Text("로그인")),
                  SizedBox(width: w, height: 10),
                  TextButton(style: TextButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(w - w / 10, 24),
                      textStyle: const TextStyle(fontSize: 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                      onPressed: () => Get.to(()=>const RegisterPage()),
                      child: const Text("회원가입"))
                ],
              ),
            )
          ],
        )
    );
  }
}