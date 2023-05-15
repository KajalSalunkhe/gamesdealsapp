import 'package:flutter/material.dart';
import 'package:gamesdealsapp/providers/deals_provider.dart';
import 'package:gamesdealsapp/providers/stores_provider.dart';
import 'package:gamesdealsapp/providers/theme_provider.dart';
import 'package:gamesdealsapp/screens/deals_screen.dart';
import 'package:gamesdealsapp/screens/stores_screen.dart';
import 'package:gamesdealsapp/services/prefs.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeMode currentTheme = await Prefs.fetchTheme();
  runApp(GameDealsApp(currentTheme: currentTheme));
}

class GameDealsApp extends StatelessWidget {
  final ThemeMode currentTheme;
  const GameDealsApp({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(currentTheme),
        ),
        ChangeNotifierProvider(
          create: (context) => StoresProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DealsProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(centerTitle: true),
              colorScheme: ColorScheme.light(),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(centerTitle: true),
              colorScheme: ColorScheme.dark(),
            ),
            themeMode: value.themeMode,
            routes: {
              "stores": (context) => const StoresScreen(),
              "deals":(context)=>const DealsScreen()
            },
            initialRoute: "stores",
          );
        },
      ),
    );
  }
}
