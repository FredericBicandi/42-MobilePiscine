import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
import 'home.dart';  // <-- contains bottom nav with Profile + Agenda

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDp3jD4FRUAHNRAclXRpQpxHjnqm2mbr2s",
      authDomain: "diaryapp-ceda1.firebaseapp.com",
      projectId: "diaryapp-ceda1",
      storageBucket: "diaryapp-ceda1.firebasestorage.app",
      messagingSenderId: "1035831544876",
      appId: "1:1035831544876:web:ad49622db6b736d16a5589",
      measurementId: "G-6P1BSLWBJX",
    ),
  );

  runApp(const DiaryApp());
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        textTheme: GoogleFonts.playwriteCzTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF8EA12F),
          brightness: Brightness.light,
        ),
      ),

      // Auto-redirect depending on login state
      home: FirebaseAuth.instance.currentUser == null
          ? LoginPage()
          : const DiaryHome(),   // bottom nav page
    );
  }
}
