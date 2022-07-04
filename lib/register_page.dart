import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: w,
                height: 80.h,
                padding: const EdgeInsets.all(10),
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
              height: 180.h,
              child: Column(
                children: [
                  TextField(
//                      controller: emailController,
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
//                      controller: emailController,
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
//                      controller: emailController,
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
              height: 70.h,
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
                      onPressed: (){},
                      child: const Text("회원가입")),
                ],
              ),
            )
          ],
        )
    );
  }
}