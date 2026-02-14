import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerView extends StatelessWidget {
  final Function onClick;
  final List<String> themes = ['Light', 'Dark'];
  final List<String> languages = ['Arabic', 'English'];

  DrawerView({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
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
                  "News App",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
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
                          AssetImage('assets/images/home.png',),
                          color: Colors.white,
                        ),
                        Text(
                          "Go To Home",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  Divider(color: Colors.white, thickness: 1, endIndent: 20),

                  SizedBox(height: 24),
                  Row(
                    spacing: 8,
                    children: [
                      Image.asset('assets/images/theme.png', width: 24, height: 24,),
                      Text('Theme', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),)
                    ],
                  ),
                  SizedBox(height: 8),

                  DropdownMenu(
                    initialSelection: themes[0],
                      width: 270,
                      inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: Colors.black,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Colors.white
                            ),
                          )
                      ),
                    dropdownMenuEntries: [
                      for (var theme in themes)
                        DropdownMenuEntry(
                            label: theme,
                            value: null,
                        ),
                    ],
                  ),
                  SizedBox(height: 24),

                  Divider(color: Colors.white, thickness: 1, endIndent: 20),

                  SizedBox(height: 24),
                  Row(
                    spacing: 8,
                    children: [
                      Image.asset('assets/images/language.png', width: 24, height: 24,),
                      Text('Language', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),)
                    ],
                  ),
                  SizedBox(height: 8),

                  DropdownMenu(
                    initialSelection: languages[0],
                    width: 270,
                    inputDecorationTheme: InputDecorationTheme(
                        filled: true,
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: Colors.white
                          ),
                        )
                    ),
                    dropdownMenuEntries: [
                      for (var language in languages)
                        DropdownMenuEntry(
                          label: language,
                          value: null,
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
