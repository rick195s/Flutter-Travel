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
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: _createTiles(),
          ),
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
      flex: widget.selected ? 2 : 1,
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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          boxShadow: widget.selected
              ? [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ]
              : null,
          color: widget.selected ? Theme.of(context).focusColor : null,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: _itemRow(),
      ),
    );
  }

  Widget _itemRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Icon(
              widget.item.icon,
              color: widget.selected ? Colors.white : Colors.grey,
            ),
          ),
          // Text(
          //   widget.selected ? widget.item.label : "",
          //   style: TextStyle(color: Colors.white),
          // ),

          Flexible(
            flex: 4,
            child: AnimatedSize(
              duration: Duration(milliseconds: 125),
              vsync: this,
              child: Text(
                widget.selected ? widget.item.label : "",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
  CustomBottomNavigationBarIcons(label: "Search", icon: Icons.search),
  CustomBottomNavigationBarIcons(label: "Search", icon: Icons.search),
];
