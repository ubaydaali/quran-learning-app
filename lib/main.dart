import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'providers/progress_provider.dart';
import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
      ],
      child: MaterialApp(
        title: 'Quran Learning App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
          textTheme: GoogleFonts.cairoTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[700],
            elevation: 0,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}