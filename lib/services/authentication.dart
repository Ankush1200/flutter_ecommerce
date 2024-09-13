import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/constants/firebase_constant.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Authentication extends GetxController{

  // This Function will Helps to loged in for an existing user
  Future<UserCredential?> login({email,password,context}) async{
    UserCredential?userCredential;
    try{
      userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: '$e');
    }
    return userCredential;
  }


  // This Funstio will create a new useCredential for a successfull login
  Future<UserCredential?>signUp({email,password,context}) async{
    UserCredential?userCredential;
    try{
      userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      if(e.code=='weak-password'){
        VxToast.show(context, msg: 'Weak-Password');
      }else if(e.code=='email-already-in-use'){
        VxToast.show(context, msg: 'Account is already exist');
      }
      VxToast.show(context, msg: '$e');
    }
    return userCredential;
  }


  // Store User Information to cloud fire store
  dataStorage({name,email,password})async{
    DocumentReference reference=await firestore.collection('user').doc(currentUser!.uid);
    reference.set({
      'Name':name,
      'Email':email,
      'Password':password,
      'ImageUrl':'',
    });
  }

  // LogOut Method to logout from the app.
  logOut({context})async{
    try{
      auth.signOut();
    }catch(e){
      VxToast.show(context, msg: '$e');
    }
  }

}