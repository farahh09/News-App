import 'package:flutter/material.dart';
import 'package:news/core/theming/base_colors.dart';

class DarkColors implements BaseColors {
  @override
  Color get background => Color(0xFF171717);

  @override
  Color get secondary => Color(0xFFA0A0A0);

  @override
  Color get surface => Color(0xFF808080).withOpacity(0.5);

  @override
  Color get onSurface => Color(0xFFFFFFFF);

  @override
  Color get outline => Color(0xFFFFFFFF);
}
