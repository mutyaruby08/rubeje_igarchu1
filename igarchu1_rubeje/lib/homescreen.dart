// import 'package:flutter/material.dart';

// import 'orgBottom_navbar.dart';

// class Homescreen extends StatefulWidget {
//   Homescreen({Key? key}) : super(key: key);

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//  int currentIndex = 2;
//   final screens = [
 
//   ];
  
//   get kPrimaryColor => null;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Health'),
//         backgroundColor: kPrimaryColor,
//         elevation: 0.0,
//       ),
//       body: IndexedStack(
//         index: currentIndex,
//         children: screens,
//       ),
   
//       bottomNavigationBar: const OrgBottomNavBar(),
//     );
//   }
// }