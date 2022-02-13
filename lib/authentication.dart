import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<bool> signUp(String email, String password) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    // User user = result.user!;
    return Future.value(true);
  } catch (e) {
    rethrow;
  }
}

Future<bool> signIn(String email, String password) async {
  try {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    // User user = result.user!;
    return Future.value(true);
  } catch (e) {
    rethrow;
  }
}

Future<bool> signOutUser() async {
  await auth.signOut();
  return Future.value(true);
}

// final googleSignin = GoogleSignIn();

// Future<bool> googleSignIn() async {
//   GoogleSignInAccount? googleAccount = await googleSignin.signIn();

//   if (googleAccount != null) {
//     GoogleSignInAuthentication googlesigninauthentication =
//         await googleAccount.authentication;

//     AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googlesigninauthentication.idToken,
//         accessToken: googlesigninauthentication.accessToken);

//     // AuthResult result = await auth.signInWithCredential(credential);

//     // FirebaseUser user = await auth.currentUser();
//     // pirnt(user.id);

//     Future.value(true);
//   }
// }


// In the newest version of firebase_auth, the class FirebaseUser 
//was changed to User, and the class AuthResult was changed to UserCredential.
// Therefore change your code to the following:

//     Future<User> currentUser() async {
//       final GoogleSignInAccount account = await googleSignIn.signIn();
//       final GoogleSignInAuthentication authentication =
//           await account.authentication;

//       final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//           idToken: authentication.idToken,
//           accessToken: authentication.accessToken);

//       final UserCredential authResult =
//           await _auth.signInWithCredential(credential);
//       final User user = authResult.user;

//       return user;
//     }