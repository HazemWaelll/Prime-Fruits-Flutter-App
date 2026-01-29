import 'package:flutter/material.dart';
import 'package:prime_fruits/models/Favorite_model.dart';
import 'package:provider/provider.dart';
import 'package:prime_fruits/models/Cart_model.dart';
import 'package:prime_fruits/pages/Splash_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

final thememode = ValueNotifier<ThemeMode>(ThemeMode.light);
late Box<dynamic> _themeBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cartBox');
  await Hive.openBox('favoritesBox');
  _themeBox = await Hive.openBox('themeBox');

  // load saved theme
  final savedTheme = _themeBox.get('themeMode', defaultValue: 'light');
  thememode.value = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;

  // notifyListeners and save it
  thememode.addListener(() {
    _themeBox.put('themeMode', thememode.value == ThemeMode.dark ? 'dark' : 'light');//    <-----|
  });                          // can't save enum to hive, it needs to be converted to string ---|

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cartmodel()),
        ChangeNotifierProvider(create: (context) => Favoritemodel()),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: thememode,
        builder: (context, themevalue, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
            themeMode: themevalue,

            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.grey[200],
              highlightColor: Colors.greenAccent,
              hoverColor: Colors.black,

              textTheme: TextTheme(
                headlineLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                bodySmall: TextStyle(color: Colors.black),
                bodyLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: TextStyle(color: Colors.black, fontSize: 14),
                titleMedium: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),

            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black87,
              primaryColor: Colors.grey[800],
              highlightColor: Colors.green,
              hoverColor: Colors.white,

              textTheme: TextTheme(
                headlineLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                bodySmall: TextStyle(color: Colors.white),
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: TextStyle(color: Colors.white, fontSize: 14),
                titleMedium: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
