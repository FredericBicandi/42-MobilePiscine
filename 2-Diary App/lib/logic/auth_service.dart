import 'package:firebase_auth/firebase_auth.dart';

Future<User?> googleLogin() async {
  try {
    GoogleAuthProvider google = GoogleAuthProvider();
    google.setCustomParameters({'prompt': 'select_account'});

    final userCred = await FirebaseAuth.instance.signInWithPopup(google);

    return userCred.user;
  } catch (e) {
    print("GOOGLE ERROR: $e");
    return null;
  }
}

Future<User?> githubLogin() async {
  try {
    GithubAuthProvider githubProvider = GithubAuthProvider();

    githubProvider.setCustomParameters({'allow_signup': 'false'});

    final userCred = await FirebaseAuth.instance.signInWithPopup(
      githubProvider,
    );

    return userCred.user;
  } catch (_) {
    return null;
  }
}
