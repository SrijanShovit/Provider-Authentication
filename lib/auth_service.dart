//handle connection with firebase
import 'package:authentication_practice/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
class AuthService{
  //creating a firebase auth instance variable
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  //we need to create a new method to map data that we get from firebase out to match our user model
  User? _userFromFirebase(auth.User? user){           //tales firebase user object
        if (user == null){
          return null;
        }
        //else return user object
        return User(user.uid , user.email);
  }

  Stream<User?>? get user{
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
    //mapping to use user from firebase
  }

  Future<User?> signInWithEmailAndPassword(
      //returning Future of User object
      String email,
      String password
      ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    //taking user from credential variable and map it back to User Model
    return _userFromFirebase(credential.user);
  }

      Future<User?> createUserWithEmailAndPassword(
      //returning Future of User object
      String email,
      String password
      ) async {
        final credential = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
        //taking user from credential variable and map it back to User Model
        return _userFromFirebase(credential.user);
      }

      Future<void> signOut() async {
      return await _firebaseAuth.signOut();
      }

}