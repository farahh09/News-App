import 'package:flutter/material.dart';
import 'package:news/core/theming/base_colors.dart';

class LightColors implements BaseColors {
  @override
  Color get background => Color(0xFFFFFFFF);

  @override
  Color get secondary => Color(0xFFA0A0A0); //news view (auther and date)

  @override
  Color get surface => Colors.white.withOpacity(0.5); //categories view

  @override
  Color get onSurface => Color(0xFF171717); //text

  @override
  Color get outline => Color(0xFFFFFFFF); //border
}
