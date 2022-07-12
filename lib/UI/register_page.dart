import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_application/service.controller/auth_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: w,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BeSports",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(
              width: w - w / 10,
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
                  SizedBox(width: w, height: 10),
                  TextField(
                    controller: passwordCheckController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "PasswordCheck",
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
              child: Column(
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(w - w / 10, 15.h),
                      textStyle: TextStyle(fontSize: 18.sp),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                      onPressed: () async {
                        AuthController.instance.register(emailController.text.trim(), passwordController.text.trim(), passwordCheckController.text.trim());
                      },
                      child: const Text("회원가입")),
                ],
              ),
            )
          ],
        )
    );
  }
}