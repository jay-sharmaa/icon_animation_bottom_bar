# icon_animation_bottom_bar

A customizable, animated bottom navigation bar for Flutter. This widget supports icon and text transitions, and allows you to place a floating widget above the selected tab — ideal for custom indicators, animations, or badges.

## Features

- Animated floating widget that tracks the selected tab.
- Smooth transitions with customizable animation curve and duration.
- Fully customizable icons, labels, and styles.
- Responsive layout — works with any number of items.
- Easy to integrate and lightweight.

![Demo Screenshot](example\imlp1.jpg)
![Demo Screenshot](example\impl0.jpg)

## Getting started

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  icon_animation_bottom_bar: ^0.0.1
```

## Usage

Detailed example in example/lib/example.dart

```dart
IconAnimationBottomBar(
          items: [
            BottomBarItem(icon: Icons.home, label: 'Home'),
            BottomBarItem(icon: Icons.email, label: 'Search'),
            BottomBarItem(icon: Icons.alarm, label: 'Alarm'),
            BottomBarItem(icon: Icons.person, label: 'Person'),
          ],
          selectedIndex: selectedIndex,
          onTap: _onTabTapped,
          floatingWidget: Image.asset('assets/example.jpg', scale: 12,), 
          iconSelectedColor: Colors.blueAccent,
          iconColor: Colors.black,
          textSelectedColor: Colors.blue,
          textColor: Colors.black,
          verticalPadding: 6,
          bottomBarHeight: 84,
          alignParameter: 15,
        ),
```

## Additional information

For more details, examples, or to contribute, visit the GitHub repository.

If you encounter any issues, feel free to open a bug report or feature request in the issues section.

Contributions are welcome! Whether it's a bug fix, feature suggestion, or documentation update — your help is appreciated.
This package is released under the MIT License.