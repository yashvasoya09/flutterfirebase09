import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfirebase09/screen/model/add_product_model.dart';

class fireBase_Helper {

  FirebaseAuth  auth =   FirebaseAuth.instance;

  static fireBase_Helper firebase = fireBase_Helper();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void addProductInFireBase(addProductModel model) {
    firebaseFirestore.collection("ProductData").add({
      'name': model.pname,
      'price': model.pprice,
      'description': model.pdesc,
      'category': model.pcateg,
      'offer': model.poffer,
      'size': model.psize,
      'image':model.img,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readFireBaseData() {
    return firebaseFirestore.collection("ProductData").snapshots();
  }

  void deleteProductInFireBase(String id) {
    firebaseFirestore.collection("ProductData").doc(id).delete();
  }

  void updateProductInFireBase(addProductModel model) {
    firebaseFirestore.collection("ProductData").doc(model.id).set({
      'name': model.pname,
      'price': model.pprice,
      'description': model.pdesc,
      'category': model.pcateg,
      'offer': model.poffer,
      'size': model.psize,
      'image':model.img,
    });
  }


  bool check_user()
  {
    User? user=auth.currentUser;
    return user!=null;
  }

  Future<String> crateUserWithEmail(email,password)
  async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }
    catch(e){
      return "$e";
    }
  }
  Future<String> emailSignIn(email,password)
  async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    }catch(e)
    {
      return "$e";
    }
  }
}
