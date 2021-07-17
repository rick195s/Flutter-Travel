import 'package:flutter/material.dart';

class BottomNavigationBarUI extends StatefulWidget {
  BottomNavigationBarUI();

  @override
  _BottomNavigationBarUIState createState() => _BottomNavigationBarUIState();
}

class _BottomNavigationBarUIState extends State<BottomNavigationBarUI> {
  int _currentIndex = 0;

  void changeState(int index) {
    setState(() {
      _currentIndex = index;
    });
    print(index);
    print(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: Container(
          height: 70,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: items.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: () {
                  changeState(i);
                },
                child: AnimatedContainer(
                  duration: Duration(
                    milliseconds: 250,
                  ),
                  decoration: BoxDecoration(),
                  width: 35,
                  child: Icon(items[i],
                      size: 35,
                      color: i == _currentIndex ? Colors.red : Colors.grey),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

List<Widget> _pages = <Widget>[
  Text("1"),
  Text("2"),
  Text("3"),
];

List<IconData> items = <IconData>[
  Icons.home,
  Icons.map,
  Icons.search,
  Icons.person_outlined,
];
