import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hotel/pages/settings.dart';
import 'package:flutter_hotel/pages/home.dart';
import 'package:flutter_hotel/ui/custom_bottom_navigation_bar.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_hotel/ui/theme_manager.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

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
            title: 'Flutter Hotel',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.themeMode,
            theme: themeNotifier.lightTheme,
            darkTheme: themeNotifier.darkTheme,
            home: MyHomePage(title: 'Flutter Hotel'),
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
        bottomNavigationBar: CustomBottomNavigationBar(
          icons: bottomItems,
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
  HomePage("Home"),
];
