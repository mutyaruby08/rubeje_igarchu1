
// import 'package:flutter/material.dart';
// import 'package:igarchu1_rubeje/screens/adoption/adoption_screen.dart';

// import '../../constants.dart';
// import 'controllers/auth_controller.dart';

// class OrgBottomNavBar extends StatefulWidget {
  
//   const OrgBottomNavBar({Key? key}) : super(key: key);

//   @override
//   State<OrgBottomNavBar> createState() => _OrgBottomNavBarState();
// }

// class _OrgBottomNavBarState extends State<OrgBottomNavBar> {
 
//   int currentIndex = 2;
//   final screens = [
//     AdoptionScreen(),
   
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: currentIndex,
//         children: (screens),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: kbutton1,
//         backgroundColor: Colors.white,
//         iconSize: 30,
//         onTap: (index) => setState(() {
//           currentIndex = index;
//         }),
//         items: const [
//           BottomNavigationBarItem(
//             label: 'Health',
//             icon: Icon(
//               Icons.monitor_heart_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Donate',
//             icon: Icon(
//               Icons.volunteer_activism_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Explore',
//             icon: Icon(Icons.search_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: 'Chat',
//             icon: Icon(
//               Icons.chat_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Profile',
//             icon: Icon(
//               Icons.person_outline_outlined,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Settings',
//             icon: Icon(Icons.settings),
//           ),
//         ],
//       ),
//     );
//   }
// }
