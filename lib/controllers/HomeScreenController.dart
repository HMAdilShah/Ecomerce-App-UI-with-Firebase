import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_by_roger_li/models/CatsModel.dart';
import 'package:task_by_roger_li/models/UserProfile.dart';
import 'package:task_by_roger_li/services/FirebaseDBHelper.dart';

class HomeScreenController extends GetxController {
  RxList<UserProfile> userProfileList = <UserProfile>[].obs;
  RxList<CatsModel> featuredCatsList = <CatsModel>[].obs;
  RxList<CatsModel> allCatsList = <CatsModel>[].obs;
  RxList<CatsModel> myCatsList = <CatsModel>[].obs;
  UserProfile? userProfile = null;
  RxBool profileLoadingFailed = false.obs;
  RxBool allCatLoadingFailed = false.obs;
  RxBool featuredCatsLoadingFailed = false.obs;
  RxBool myCatsLoadingFailed = false.obs;
  RxBool myCatsEmpty = false.obs;

  @override
  void onInit() {
    getAllDetails();
  }

  getAllDetails() async {
    allCatsList.clear();
    featuredCatsList.clear();
    myCatsList.clear();

    ////////////////get userprofile////////////////////////
    QuerySnapshot profileInfoSnapshot =
        await FirebaseDBHelper().getUserProfile();
    if (profileInfoSnapshot.docs.length > 0) {
      userProfileList.value = await profileInfoSnapshot.docs
          .map((doc) {
            return UserProfile(
                doc.get("username"), doc.get("picture"), doc.get("Age"));
          })
          .toList()
          .obs;
    }

    try {
      userProfile = userProfileList.elementAt(0);
    } catch (e) {
      profileLoadingFailed.value = true;
    }
    ////////////////get userprofile////////////////////////

    ////////////////getting cat////////////////////////

    QuerySnapshot allCatsSnapshot = await FirebaseDBHelper().getAllCats();
    if (allCatsSnapshot.docs.length > 0) {
      allCatsList.value = await allCatsSnapshot.docs
          .map((doc) {
            return CatsModel(
                doc.get("cat_details"),
                doc.get("cat_name"),
                doc.get("img_url"),
                doc.get("isAdded"),
                doc.get("isFeatured"),
                doc.get("username"),
                doc.id,
                "all_cats");
          })
          .toList()
          .obs;
    } else {
      print('error loading');
      allCatLoadingFailed.value = true;
      myCatsLoadingFailed.value = true;
    }

    ////////////////get featured cats////////////////////////
    QuerySnapshot featuredCatsSnapshot =
        await FirebaseDBHelper().getFeaturedCats();
    if (featuredCatsSnapshot.docs.length > 0) {
      featuredCatsList.value = await featuredCatsSnapshot.docs
          .map((doc) {
            return CatsModel(
              doc.get("cat_details"),
              doc.get("cat_name"),
              doc.get("img_url"),
              doc.get("isAdded"),
              doc.get("isFeatured"),
              doc.get("username"),
              doc.id,
              "featured_cats",
            );
          })
          .toList()
          .obs;

      await updateMyCatList();
    } else {
      print('error loading');
      featuredCatsLoadingFailed.value = true;
    }
  }

  getAllCats() async {
    allCatsList.clear();
    ////////////////getting cat////////////////////////
    QuerySnapshot allCatsSnapshot = await FirebaseDBHelper().getAllCats();
    if (allCatsSnapshot.docs.length > 0) {
      allCatsList.value = await allCatsSnapshot.docs
          .map((doc) {
            return CatsModel(
                doc.get("cat_details"),
                doc.get("cat_name"),
                doc.get("img_url"),
                doc.get("isAdded"),
                doc.get("isFeatured"),
                doc.get("username"),
                doc.id,
                'all_cats');
          })
          .toList()
          .obs;

      await updateMyCatList();
    } else {
      print('error loading');
      allCatLoadingFailed.value = true;
    }
  }

  getFeaturedCats() async {
    featuredCatsList.clear();
    ////////////////get featured cats////////////////////////
    QuerySnapshot myCatsSnapshot = await FirebaseDBHelper().getFeaturedCats();
    if (myCatsSnapshot.docs.length > 0) {
      featuredCatsList.value = await myCatsSnapshot.docs
          .map((doc) {
            return CatsModel(
                doc.get("cat_details"),
                doc.get("cat_name"),
                doc.get("img_url"),
                doc.get("isAdded"),
                doc.get("isFeatured"),
                doc.get("username"),
                doc.id,
                'featured_cats');
          })
          .toList()
          .obs;

      await updateMyCatList();
    } else {
      print('error loading');
      featuredCatsLoadingFailed.value = true;
    }
  }

  addOrRemoveFromAllCats(String docId, bool isAdded, String listType) async {
    String username = isAdded == false ? "" : "catholder-22";
    await FirebaseDBHelper()
        .addOrRemoveFrom_AllCats(docId, isAdded.toString(), listType, username)
        .then((value) {
      listType == "all_cats" ? getAllCats() : getFeaturedCats();
    });
  }

  updateMyCatList() async {
    myCatsList.clear();
    ////////////////get my cat////////////////////////
    for (int i = 0; i < allCatsList.length; i++) {
      if (allCatsList.elementAt(i).username == "catholder-22") {
        myCatsList.add(allCatsList.elementAt(i));
      }
    }
    for (int i = 0; i < featuredCatsList.length; i++) {
      if (featuredCatsList.elementAt(i).username == "catholder-22") {
        myCatsList.add(featuredCatsList.elementAt(i));
      }
    }
    if (myCatsList.isEmpty) {
      myCatsEmpty.value = true;
    } else {
      myCatsEmpty.value = false;
    }
  }
}
