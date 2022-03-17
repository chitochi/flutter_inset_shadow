# Flutter Inset Box Shadow

Flutter currently does not support the `inset` property for shadows. This type of shadow is for example used in Neumorphism.

This package extends `BoxShadow` and `BoxDecoration` to support the `inset` property.

## Features

- All properties of `BoxShadow` are supported.
- If the property of a `BoxShadow` changes during a transition, we first make the old shadow disappear before making the new one appear.

## Example

![A simple neumorphic container](https://raw.githubusercontent.com/qoumo/flutter_inset_box_shadow/main/example.png)

```dart
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const ExampleApp());
}

const primaryColor = Color(0xFFE0E0E0);

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: primaryColor,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-20, -20),
                  blurRadius: 60,
                  color: Colors.white,
                  inset: true,
                ),
                BoxShadow(
                  offset: Offset(20, 20),
                  blurRadius: 60,
                  color: Color(0xFFBEBEBE),
                  inset: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Usage

First, add the package:

```
flutter pub add flutter_inset_box_shadow
```

Then, import it as follows:

```dart
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
```

It is necessary to hide `BoxDecoration` and `BoxShadow` because this library replaces them.

`BoxShadow` now has a boolean `inset` property, which is set to `false` by default.

```dart
return Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        blurRadius: 5,
        color: Colors.red,
      ),
      BoxShadow(
        offset: Offset(1, 2),
        blurRadius: 5,
        spreadRadius: 2,
        color: Colors.green,
        inset: true,
      ),
    ],
  ),
);
```

## How does it work?

The algorithm used is the same as that of Blink, the Chromium rendering engine.

The idea is that we draw a rectangle hollowed out by another rounded rectangle inside, then we blur this hollowed rectangle.
