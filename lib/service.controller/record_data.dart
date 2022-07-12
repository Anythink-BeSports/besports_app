import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sports_application/collection/record_data.dart';

class CrudController extends GetxController{
  static CrudController instance = Get.find();

  var firebaseUser = FirebaseAuth.instance.currentUser;
  var email;
  var userCollectionReference;
  var uidCollectionReference;

  CrudController(this.email){
    userCollectionReference = FirebaseFirestore.instance.collection("record").doc(email);
    uidCollectionReference = FirebaseFirestore.instance.collection("record").doc(firebaseUser?.uid);
  }

  void addRecord(user) {
    uidCollectionReference.set(user);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readRecord() async{
    return await userCollectionReference.get();
  }

  void updateRecord(RecordData record){
    uidCollectionReference.update({
      "date" : record.date,
      "type" : record.type,
      "set" : record.set,
      "count" : record.count
    });
  }
}