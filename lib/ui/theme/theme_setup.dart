import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tots_test_app/ui/common/app_colors.dart';

class ThemeSetup {
  static List<ThemeData> getThemes() {
    return [
      ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.dmSansTextTheme(),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundBuilder: (context, states, child) {
              if (states.contains(WidgetState.disabled)) {
                return Container(
                  color: kcMediumGrey,
                  child: child,
                ); // Color opaco cuando está deshabilitado
              }
              return child!;
            },
            minimumSize: WidgetStateProperty.all(
              const Size(double.infinity, 52),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.black),
            textStyle: WidgetStateProperty.all(
              GoogleFonts.dmSans(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 28,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34),
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFC4C4C4),
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFC4C4C4),
            ),
          ),
        ),
      ),
      ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.dmSansTextTheme(),
        useMaterial3: true,
      ),
    ];
  }
}
