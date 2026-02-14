import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/theming/bloc/cubit.dart';

class TextTheming {
  final BuildContext context;

  TextTheming(this.context);

  TextStyle get title => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: ThemingCubit.get(context).colors.onSurface,
  );
  TextStyle get drawer => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  TextStyle get categoryLabel => GoogleFonts.inter(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: ThemingCubit.get(context).colors.background,
  );

  TextStyle get titleMedium => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ThemingCubit.get(context).colors.onSurface,
  );

  TextStyle get titleSmall => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemingCubit.get(context).colors.onSurface,
  );

  TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ThemingCubit.get(context).colors.secondary,
  );

  TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ThemingCubit.get(context).colors.background,
  );

  TextStyle get titleLarge => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ThemingCubit.get(context).colors.onSurface,
  );
}
