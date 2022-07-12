import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../UI/login_page.dart';
import '../UI/main.dart';


class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //out user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user==null){
      Get.offAll(()=>const LoginPage());
    }else{
      print("${user.email!}님 환영합니다!");
      Get.offAll(()=>BeSports(email:user.email!));
    }
  }

  Future<void> register(String email, password, passwordCheck) async {
    try{
      if(password != passwordCheck) {
        throw Exception("password와 passwordCheck가 다릅니다");
      }
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e) {
      failedDialog(e);
    }
  }

  Future<void> login(String email, password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e) {
      failedDialog(e);
    }
  }

  void failedDialog(e) {
    var context = Get.context;
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Login failed"),
          content: Text(e.message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}