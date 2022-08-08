# Flutter Travel

Flutter Travel is an App Template created using flutter framework with firebase integration, translation options, dark and light theme, rtl or ltr text direction to start booking your trips in only one place.

## Packages:

- flutter_screenutil; Relative scalling

- line_icons; Icons

- rive; Background effects 

- animations; 

## Tips:

To help with firebase configurations install firebase CLI.

## Usage/Examples:

### Internaciolization

Find more details in [Internationalizing Flutter apps | Flutter](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)

This app was created with internaciolization in mind, so it would be easy to translate the text presented to the user.

Inside lib/l10n/ you will find intl_en.arb file with the main structure of strings used in the application. 

Everything is generated by flutter, the only things you have to do are:

1. Create a json file with the name "intl_LangCode.arb";



### CustomBottomNavigationBar

- You can customize the **CustomBottomNavigationBar**

Change Icon Themes for selected and unselected Icons.

Using properties:

```dart
selectedIconTheme:  IconThemeData(color:  Colors.blue),
```

```dart
unselectedIconTheme:  IconThemeData(color:  Colors.grey),
```

Using ThemeData:

```dart
ThemeData(
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor:  Color(0xff242428),
        unselectedIconTheme:  IconThemeData(color:  Colors.grey),
        selectedIconTheme:  IconThemeData(color:  Colors.white),
        selectedLabelStyle:  TextStyle(color:  Colors.white),
    ),
);
```

#### CustomBottomNavigationBar Items:

```dart
final  List<BottomNavigationBarItem> bottomItems =  <BottomNavigationBarItem>[
BottomNavigationBarItem(icon:  Icon(Icons.home), label:  "Home"),
BottomNavigationBarItem(icon:  Icon(Icons.map), label:  "Map"),
];
```

Text Style:

```dart
textStyle: TextStyle(color:Colors.grey),
```

Background Color:

```dart
backgroundColor: Colors.black38,
```

Shadow Color:

```dart
ThemeData(shadowColor: Colors.blue);
```

Example:

```dart
CustomBottomNavigationBar(
    items: bottomItems,
    onTap: onBottomNavigationBarIconTap,
    currentIndex: _currentIndex,
    textStyle:  TextStyle(color:Colors.grey),
    selectedIconTheme:  IconThemeData(color:  Colors.blue),
    unselectedIconTheme:  IconThemeData(color:  Colors.grey),
    backgroundColor:Colors.black38,

),
```

## Authors

- [@rick195s](https://www.github.com/rick195s)
