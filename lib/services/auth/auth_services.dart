import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //register

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    dynamic password,
    dynamic name,
    )async{

      if (name.trim().isEmpty) {
        throw Exception('Name cannot be empty');
      }

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password,);

          await userCredential.user!.updateDisplayName(name);

        //save user data to firestore
        _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': userCredential.user!.uid,
          
        });
        return userCredential;

      
          
    }on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  //logout
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
