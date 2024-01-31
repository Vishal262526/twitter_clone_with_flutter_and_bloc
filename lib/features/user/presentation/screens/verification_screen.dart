// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:twitter_clone_with_bloc/common/rounded_small_button.dart';
// import 'package:twitter_clone_with_bloc/presentation/home/home_screen.dart';

// class VerificationScreen extends StatefulWidget {
//   static route() => MaterialPageRoute(
//         builder: (context) => const VerificationScreen(),
//       );
//   const VerificationScreen({super.key});

//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   final Duration _verificationCheckTimeInSeconds = const Duration(seconds: 2);
//   Timer? timer;

//   void navigateToHomeAndReplacedAllScreens() {
//     Navigator.pushAndRemoveUntil(
//         context, HomeScreen.route(), (context) => false);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     timer = Timer.periodic(_verificationCheckTimeInSeconds, (timer) {
//       print("Email Status is Checking ......");
//       isEmailVerified();
//       print("Function was automatically invoked $timer");
//     });
//     super.initState();
//   }

//   void isEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//     final bool isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (isVerified) {
//       navigateToHomeAndReplacedAllScreens();
//       return;
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Email Verification Link Sent to yuo email please check and verify",
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             RoundedSmallButton(
//               label: "Resend",
//               onTap: navigateToHomeAndReplacedAllScreens,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
