# Flutter Inset Box Shadow

Flutter currently does not support the `inset` property for shadows. This type of shadow is for example used in Neumorphism.

This package extends BoxShadow and BoxDecoration to support the `inset` property.

## Usage

To use this package, import it as follows:

```dart
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
```

It is necessary to hide `BoxDecoration` and `BoxShadow` because this library replaces them.

The `BoxShadow` now has a boolean `inset` property, which is set to `false` by default.

```dart
Container(
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
),
