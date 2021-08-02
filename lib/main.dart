import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/settings.dart';
import 'pages/home.dart';
import 'ui/custom_bottom_navigation_bar.dart';
import 'ui/theme_manager.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // DevicePreview(
    //   builder: (context) => MyApp(),
    // ),
    MyApp(),
  );
}

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff131312),
  focusColor: Color(0xff087cf2).withAlpha(127),
  textTheme: TextTheme(
    button: TextStyle(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff242428),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedLabelStyle: TextStyle(color: Colors.white),
  ),
  shadowColor: Colors.blue.shade800,
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  focusColor: Color(0xff087cf2),
  textTheme: TextTheme(
    button: TextStyle(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedLabelStyle: TextStyle(color: Colors.white),
  ),
  shadowColor: Colors.blue.shade800,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        builder: (context, _) {
          final themeNotifier = Provider.of<ThemeNotifier>(context);

          return MaterialApp(
            builder: DevicePreview.appBuilder,
            title: 'Flutter Travel',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: MyHomePage(title: 'Flutter Travel'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // current index of the bottom navigation bar
  int _currentIndex = 0;

  // change the state of the current index to 'index'
  // so the view can be changed
  void onBottomNavigationBarIconTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CustomBottomNavigationBar(
          items: bottomItems,
          onTap: onBottomNavigationBarIconTap,
          currentIndex: _currentIndex,
        ),
        body: Center(
          child: _pages[_currentIndex],
        ));
  }
}

List<Widget> _pages = <Widget>[
  SettingsPage("2"),
  SettingsPage("3"),
  SettingsPage("4"),
  SettingsPage("4"),
  HomePage("Home"),
];
