import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  /// Called when one of the [items] is tapped.
  ///
  /// The stateful widget that creates the bottom navigation bar needs to keep
  /// track of the index of the selected [BottomNavigationBarItem] and call
  /// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
  final ValueChanged<int>? onTap;

  /// The index into [items] for the current active [BottomNavigationBarItem].
  final int currentIndex;

  /// Defines the appearance of the button items that are arrayed within the
  /// bottom navigation bar.
  final List<BottomNavigationBarItem> items;

  /// Defines the background color of the [CustomBottomNavigationBar]
  final Color? backgroundColor;

  /// Defines what [IconThemeData] will the Icon have when selected
  final IconThemeData? selectedIconTheme;

  /// Defines what [IconThemeData] will the Icon have when unselected
  final IconThemeData? unselectedIconTheme;

  /// Defines the [TextStyle]
  final TextStyle? textStyle;

  CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.textStyle,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  /// Create a list of widgets with all the [BottomNavigationBarItem]

  List<Widget> _createTiles() {
    final List<Widget> tiles = <Widget>[];

    for (int i = 0; i < widget.items.length; i++) {
      /// Adding the widget of each item to the list

      tiles.add(_CustomBottomNavigationTile(
        widget.items[i],
        onTap: () {
          widget.onTap?.call(i);
        },
        selected: i == widget.currentIndex,

        /// Gives to the contrutor just the [IconThemeData] that will be used
        iconThemeData: i == widget.currentIndex
            ? widget.selectedIconTheme ??
                Theme.of(context).bottomNavigationBarTheme.selectedIconTheme
            : widget.unselectedIconTheme ??
                Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
        textStyle: widget.textStyle,
      ));
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 1)),
          ],
          border: Border.all(color: Theme.of(context).shadowColor, width: 0.5),
          borderRadius:

              /// Radius of the [CustomBottomNavigationBar] top corners
              BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
          color: widget.backgroundColor ??
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        height: 60,
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

class _CustomBottomNavigationTile extends StatefulWidget {
  /// Object with all the [BottomNavigationBarItem] properties
  final BottomNavigationBarItem item;

  /// Called when one of the [items] is tapped.
  final VoidCallback? onTap;

  /// Define if the [BottomNavigationBarItem] its selected in the
  /// [CustomBottomNavigationBar]
  final bool selected;

  /// Define the [IconThemeData] that the icon will have
  final IconThemeData? iconThemeData;

  /// Defines the [TextStyle]
  final TextStyle? textStyle;

  const _CustomBottomNavigationTile(
    this.item, {
    Key? key,
    this.onTap,
    this.selected = false,
    this.iconThemeData,
    this.textStyle,
  }) : super(key: key);

  @override
  _CustomBottomNavigationTileState createState() =>
      _CustomBottomNavigationTileState();
}

class _CustomBottomNavigationTileState
    extends State<_CustomBottomNavigationTile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    /// For smaller screens, items will give more space for the
    /// selected one so that the text can be displayed correctly without
    /// overlapping the other items

    int flex = 2;

    if (MediaQuery.of(context).size.width > 600) {
      flex = 1;
    }

    return Expanded(
      /// To create the effect of an item with more space than the
      /// others the selected item was placed inside a [Expanded] widget
      /// with flex of 2 and unselected items with flex of 1

      flex: widget.selected ? flex : 1,
      child: InkResponse(
        splashColor: Colors.transparent,
        enableFeedback: false,
        highlightColor: Colors.transparent,

        /// Calling the function that was given when the [CustomBottomNavigationBar]
        /// was created
        onTap: widget.onTap,
        child: _customItem(),
      ),
    );
  }

  Widget _customItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child:

          /// Creating a [Container] with decoration so the user
          /// knows what item of the [CustomBottomNavigationBar]
          /// is selected
          Container(
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

        /// The row where the [BottomNavigationBarItem] will be displayed
        child: _itemRow(),
      ),
    );
  }

  Widget _itemRow() {
    /// if widget.iconThemeData and bottomNavigationBarTheme.selectedIconTheme
    /// are null then the icons will have [color: Theme.of(context).primaryColor]

    IconThemeData iconThemeData = widget.iconThemeData ??
        IconThemeData(color: Theme.of(context).primaryColor);

    String text = "";

    if (widget.selected) {
      text = widget.item.label.toString();
    } else if (MediaQuery.of(context).size.width > 600) {
      text = widget.item.label.toString();
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,

        /// As the [Text] widget as an animation its necessary to place the widgets
        /// in a [Flexible] widget with different flex properties
        children: [
          Flexible(
            flex: 1,
            child: IconTheme(
                data: iconThemeData,

                /// if [activeIcon] not specified activeIcon = icon
                child: widget.selected
                    ? widget.item.activeIcon
                    : widget.item.icon),
          ),
          Flexible(
            flex: 4,
            child: AnimatedSize(
              duration: Duration(milliseconds: 125),
              vsync: this,
              child: Text(
                text,
                style: widget.textStyle ??
                    Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedLabelStyle,
              ),
            ),
          ),
        ]);
  }
}

// class CustomBottomNavigationBarIcons {
//   final String label;
//   final IconData icon;

//   const CustomBottomNavigationBarIcons(
//       {required this.label, required this.icon});
// }

/// List of the [BottomNavigationBarItem] that will be used when creating
/// the [CustomBottomNavigationBar]

final List<BottomNavigationBarItem> bottomItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
];
