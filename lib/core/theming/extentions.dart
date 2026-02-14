import 'package:flutter/material.dart';
import 'package:news/core/theming/bloc/cubit.dart';
import 'package:news/core/theming/light_colors.dart';
import 'package:news/core/theming/text_theming.dart';

extension ThemeExtentions on BuildContext {
  Color secondary() {
    return ThemingCubit.get(this).colors.secondary;
  }

  Color surface() {
    return ThemingCubit.get(this).colors.surface;
  }

  Color onSurface() {
    return ThemingCubit.get(this).colors.onSurface;
  }

  Color outline() {
    return ThemingCubit.get(this).colors.outline;
  }

  Color background() {
    return ThemingCubit.get(this).colors.background;
  }

  TextStyle title() {
    return TextTheming(this).title;
  }

  TextStyle categoryLabel() {
    return TextTheming(this).categoryLabel;
  }

  TextStyle titleMedium() {
    return TextTheming(this).titleMedium;
  }

  TextStyle titleSmall() {
    return TextTheming(this).titleSmall;
  }

  TextStyle bodySmall() {
    return TextTheming(this).bodySmall;
  }

  TextStyle bodyMedium() {
    return TextTheming(this).bodyMedium;
  }

  TextStyle titleLarge() {
    return TextTheming(this).titleLarge;
  }

  TextStyle drawer() {
    return TextTheming(this).drawer;
  }

  bool isLightTheme() {
    return ThemingCubit.get(this).colors is LightColors;
  }
}
