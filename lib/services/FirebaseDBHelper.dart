import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDBHelper {
  var dbReference = FirebaseDatabase.instance.reference();

  getUserProfile() async {
    return await FirebaseFirestore.instance.collection("user_profile").get();
  }

  getFeaturedCats() async {
    return await FirebaseFirestore.instance.collection("featured_cats").get();
  }

  getAllCats() async {
    return await FirebaseFirestore.instance.collection("all_cats").get();
  }

  addOrRemoveFrom_AllCats(
      String docId, String isAdded, String collection, String username) async {
    await FirebaseFirestore.instance.collection(collection).doc(docId).update({
      'isAdded': isAdded,
      'username': username,
    });
  }
}
