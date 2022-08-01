import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  final T inheritedData;

  const InheritedProvider({Key? key,
    required Widget child,
    required this.inheritedData,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) =>
      inheritedData != oldWidget.inheritedData;
  static T of<T>(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>())!
          .inheritedData;
}
