import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final List<CustomBottomNavigationBarIcons> icons;

  CustomBottomNavigationBar(
      {required this.currentIndex, required this.onTap, required this.icons});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<Widget> _createTiles() {
    final List<Widget> tiles = <Widget>[];

    for (int i = 0; i < widget.icons.length; i++) {
      tiles.add(_CustomBottomNavigationTile(
        widget.icons[i],
        onTap: () {
          widget.onTap?.call(i);
        },
        selected: i == widget.currentIndex,
      ));
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      color: Colors.white,
      child: Container(
        height: 100,
        child: Row(
          children: _createTiles(),
        ),
      ),
    );
  }
}

// This represents a single tile in the bottom navigation bar. It is intended
// to go into a flex container.
class _CustomBottomNavigationTile extends StatelessWidget {
  const _CustomBottomNavigationTile(
    this.item, {
    this.onTap,
    this.selected = false,
  });

  final CustomBottomNavigationBarIcons item;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkResponse(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _CustomItems(
                item,
                selected: selected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomItems extends StatelessWidget {
  final bool selected;
  final CustomBottomNavigationBarIcons icon;

  _CustomItems(this.icon, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      width: 60,
      height: 75,
      curve: Curves.decelerate,
      decoration: selected
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
        children: selected ? icon.getActiveIcon() : icon.getInactiveIcon(),
      ),
    );
  }
}

class CustomBottomNavigationBarIcons {
  final String label;
  final IconData icon;

  const CustomBottomNavigationBarIcons(
      {required this.label, required this.icon});

  List<Widget> getActiveIcon() {
    return [
      Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
      Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    ];
  }

  List<Widget> getInactiveIcon() {
    return [
      Icon(
        icon,
        color: Colors.grey,
        size: 30,
      ),
    ];
  }
}

const List<CustomBottomNavigationBarIcons> bottomItems =
    <CustomBottomNavigationBarIcons>[
  CustomBottomNavigationBarIcons(label: "Home", icon: Icons.home),
  CustomBottomNavigationBarIcons(label: "Map", icon: Icons.map),
  CustomBottomNavigationBarIcons(label: "Search", icon: Icons.search),
  CustomBottomNavigationBarIcons(label: "Profile", icon: Icons.person_outline),
];
