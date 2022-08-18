import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login/auth_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('pets');
  await Hive.openBox('accounts');
  await Hive.openBox('auto_login_user');

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.soraTextTheme(
            Theme.of(context).textTheme,
          )
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),

    );
  }
}


