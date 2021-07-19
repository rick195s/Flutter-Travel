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
  // Create a list of widgets with all the bottom navigation items
  List<Widget> _createTiles() {
    final List<Widget> tiles = <Widget>[];

    for (int i = 0; i < widget.icons.length; i++) {
      // adding to the list
      tiles.add(_CustomBottomNavigationItem(
        widget.icons[i],
        onTap: () {
          widget.onTap?.call(i);
        },
        selected: i == widget.currentIndex,
      ));
    }

    return tiles;
  }

  // Start of the bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Theme.of(context).bottomAppBarColor,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: [
                // AnimatedPositioned(
                //   left: widget.currentIndex * 100,
                //   width:
                //       MediaQuery.of(context).size.width / widget.icons.length,
                //   height: 40,
                //   duration: Duration(milliseconds: 2),
                //   curve: Curves.decelerate,
                //   child: AnimatedContainer(
                //     duration: Duration(seconds: 1),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(10),
                //       ),
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
                Row(
                  children: _createTiles(),
                ),
              ]),
        ),
      ),
    );
  }
}

// This represents a single tile in the bottom navigation bar. It is intended
// to go into a flex container.
class _CustomBottomNavigationItem extends StatefulWidget {
  final CustomBottomNavigationBarIcons item;
  final VoidCallback? onTap;
  final bool selected;

  const _CustomBottomNavigationItem(
    this.item, {
    this.onTap,
    this.selected = false,
  });

  @override
  _CustomBottomNavigationItemState createState() =>
      _CustomBottomNavigationItemState();
}

class _CustomBottomNavigationItemState
    extends State<_CustomBottomNavigationItem> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkResponse(
        splashColor: Colors.transparent,
        enableFeedback: false,
        highlightColor: Colors.transparent,
        onTap: widget.onTap,
        child: _customItem(),
      ),
    );
  }

  Widget _customItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height,
        duration: Duration(milliseconds: 400),
        decoration: widget.selected
            ? BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )
            : BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
        curve: Curves.ease,
        child: _itemRow(),
      ),
    );
  }

  Widget _itemRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.item.icon,
            color: widget.selected ? Colors.white : Colors.grey,
          ),
          AnimatedSize(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 200),
            vsync: this,
            child: Text(widget.selected ? widget.item.label : ""),
          ),
        ]);
  }
}

class CustomBottomNavigationBarIcons {
  final String label;
  final IconData icon;

  const CustomBottomNavigationBarIcons(
      {required this.label, required this.icon});
}

const List<CustomBottomNavigationBarIcons> bottomItems =
    <CustomBottomNavigationBarIcons>[
  CustomBottomNavigationBarIcons(label: "Home", icon: Icons.home),
  CustomBottomNavigationBarIcons(label: "Map", icon: Icons.map),
  CustomBottomNavigationBarIcons(label: "Search", icon: Icons.search),
  CustomBottomNavigationBarIcons(label: "Profile", icon: Icons.person_outline),
];
