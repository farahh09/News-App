import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/theming/bloc/cubit.dart';
import 'package:news/core/theming/extentions.dart';

class DrawerView extends StatelessWidget {
  final Function onClick;

  DrawerView({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.isLightTheme() ? 'light'.tr() : 'dark'.tr();
    final isArabic = context.locale.languageCode == 'ar';
    final currentLanguage = isArabic ? 'arabic'.tr() : 'english'.tr();

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
        children: [
          Container(
            height: 166,
            width: double.infinity,
            color: Colors.white,
            child: SafeArea(
              child: Center(
                child: Text(
                  'app_name'.tr(),
                  style: context.drawer(),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      onClick();
                    },
                    child: Row(
                      spacing: 8,
                      children: [
                        ImageIcon(
                          AssetImage('assets/images/home.png'),
                          color: Colors.white,
                        ),
                        Text(
                          'go_to_home'.tr(),
                          style: context.bodyMedium().copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Divider(color: Colors.white, thickness: 1, endIndent: 20),
                  SizedBox(height: 24),

                  // Theme Section
                  Row(
                    spacing: 8,
                    children: [
                      Image.asset(
                        'assets/images/theme.png',
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        'theme'.tr(),
                        style: context.bodyMedium().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownMenu(
                    initialSelection: currentTheme,
                    width: 270,
                    textStyle: TextStyle(color: Colors.white),
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onSelected: (theme) {
                      final lightLabel = 'light'.tr();
                      final darkLabel = 'dark'.tr();

                      if ((theme == lightLabel && !context.isLightTheme()) ||
                          (theme == darkLabel && context.isLightTheme())) {
                        ThemingCubit.get(context).changeTheming();
                      }
                      Navigator.pop(context);
                    },
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        label: 'light'.tr(),
                        value: 'light'.tr(),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                      ),
                      DropdownMenuEntry(
                        label: 'dark'.tr(),
                        value: 'dark'.tr(),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Divider(color: Colors.white, thickness: 1, endIndent: 20),
                  SizedBox(height: 24),

                  // Language Section
                  Row(
                    spacing: 8,
                    children: [
                      Image.asset(
                        'assets/images/language.png',
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        'language'.tr(),
                        style: context.bodyMedium().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownMenu(
                    initialSelection: currentLanguage,
                    width: 270,
                    textStyle: TextStyle(color: Colors.white),
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    onSelected: (language) async {
                      final englishLabel = 'english'.tr();
                      final arabicLabel = 'arabic'.tr();

                      if (language == englishLabel && isArabic) {
                        await context.setLocale(Locale('en', 'US')); // ✅ Full locale
                      } else if (language == arabicLabel && !isArabic) {
                        await context.setLocale(Locale('ar', 'EG')); // ✅ Full locale
                      }
                      Navigator.pop(context);
                    },
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        label: 'english'.tr(),
                        value: 'english'.tr(),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                      ),
                      DropdownMenuEntry(
                        label: 'arabic'.tr(),
                        value: 'arabic'.tr(),
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}