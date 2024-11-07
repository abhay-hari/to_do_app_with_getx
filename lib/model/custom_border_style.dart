import 'package:flutter/material.dart';

class MyCustomBorder extends OutlineInputBorder {
  const MyCustomBorder({
    BorderSide borderSide = const BorderSide(),
    super.borderRadius,
  }) : super(
          borderSide: BorderSide.none,
        );

  @override
  MyCustomBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
    double? gapPadding,
  }) {
    return MyCustomBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
