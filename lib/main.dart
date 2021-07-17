import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hotel/ui/bottomNavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hotel',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Hotel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void changeState(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(context),
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return Material(
      shadowColor: Colors.blue,
      elevation: 35,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      color: Colors.white,
      child: Container(
        height: 85,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: items.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                changeState(i);
              },
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: 250,
                ),
                width: 60,
                curve: Curves.decelerate,
                decoration: i == _currentIndex
                    ? BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.shade100,
                              spreadRadius: 3,
                              blurRadius: 10),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue,
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: i == _currentIndex
                      ? [
                          Icon(items[i], size: 40, color: Colors.white),
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                        ]
                      : [
                          Icon(items[i], size: 30, color: Colors.grey),
                        ],
                ),
              ),
            ),
          ),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
