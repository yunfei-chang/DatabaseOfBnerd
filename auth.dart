import 'package:sample/model/user.dart';
import 'package:sample/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice {

final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on firebaseUser
User _userFromFirebaseUser(FirebaseUser user){
return user != null ? User(uid: user.uid) : null; 
}
//auth change user stream
Stream<User> get user{
  return _auth.onAuthStateChanged
  .map(_userFromFirebaseUser);
}

//sign in email&password
Future signInWithEmailandPassword(String email,String password) async {
  try{
   AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password); 
   FirebaseUser user = result.user;
   return _userFromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;
  }
}

//register with email&password
Future registerWithEmailandPassword(String email,String password) async {
  try{
   AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: password); 
   FirebaseUser user = result.user;
   //creaate a new doc. for the user with uid
   await DataBaseService(uid: user.uid).updateUserData('unknown', 'unknown', 'student');

   return _userFromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;
  }
}
//sign out
Future signOut() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
}