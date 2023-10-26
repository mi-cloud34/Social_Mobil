import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/init/theme/app_theme.dart';
import 'package:social_mobil_app/core/init/theme/light/color_scheme_light.dart';
import 'package:social_mobil_app/core/init/theme/light/light_theme_interface.dart';
import 'package:social_mobil_app/core/init/theme/light/text_theme_light.dart';

class AppThemeLight extends AppTheme implements ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  //ThemeData get theme => ThemeData.light().copyWith(
  ThemeData? get theme => ThemeData(
      textTheme: textTheme(),
      colorScheme: _colorSchemeLight(),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFF6F35A5),
          shape: const StadiumBorder(),
          maximumSize: const Size(double.infinity, 56),
          minimumSize: const Size(double.infinity, 56),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        iconColor: Color(0xFF6F35A5),
        prefixIconColor: Color(0xFF6F35A5),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: _colorSchemeLight()?.onSecondary,
          backgroundColor: _colorSchemeLight()!.primary,
          selectedItemColor: Colors.black),
      // scaffoldBackgroundColor: colorSchemeLight?.gray,
      drawerTheme: DrawerThemeData(
        backgroundColor: _colorSchemeLight()!.primary,
      ),
      sliderTheme: SliderThemeData(
          // overlayColor: Colors.grey,
          //activeTrackColor: _colorSchemeLight()?.primary,
          //disabledThumbColor: _colorSchemeLight()?.primary,
          // inactiveTrackColor: _colorSchemeLight()?.primary,
          valueIndicatorColor: _colorSchemeLight()?.primary,
          /*  disabledActiveTrackColor: _colorSchemeLight()?.primary,
          disabledActiveTickMarkColor: _colorSchemeLight()?.primary,
          secondaryActiveTrackColor: _colorSchemeLight()?.primary,
          disabledInactiveTrackColor: _colorSchemeLight()?.primary, */
          //activeTickMarkColor: _colorSchemeLight()?.primary ?? Colors.orange,
          inactiveTickMarkColor:
              _colorSchemeLight()?.primary ?? Colors.orange.shade50,
          showValueIndicator: ShowValueIndicator.always,
          thumbColor: _colorSchemeLight()?.primary ?? Colors.purple,
          activeTickMarkColor: _colorSchemeLight()?.primary ?? Colors.purple),
      floatingActionButtonTheme: ThemeData.light()
          .floatingActionButtonTheme
          .copyWith(backgroundColor: colorSchemeLight?.lightGreen),
      tabBarTheme: TabBarTheme(
          labelColor: colorSchemeLight?.purple ?? Colors.purple,
          unselectedLabelColor: _colorSchemeLight()?.primary ?? Colors.purple,
          //labelPadding: insets!.paddingLow,
          unselectedLabelStyle:
              textThemeLight?.headline1.copyWith(color: colorSchemeLight?.red)),
      /*       appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: colorSchemeLight?.darkGray,
            size: 12.0,
          ), 
          toolbarTextStyle: textThemeLight?.bodyLarge
              .copyWith(color: colorSchemeLight?.black)) */
      //appBarTheme: ThemeData.light().appBarTheme.copyWith(
      appBarTheme: const AppBarTheme(
          //backgroundColor: Colors.purple,
          iconTheme: IconThemeData(color: Colors.black87, size: 21)));
  @override
  ColorSchemeLight? colorSchemeLight;

  @override
  TextThemeLight? textThemeLight;
  TextTheme? textTheme() {
    return TextTheme(
        displayLarge: textThemeLight?.headline1,
        displayMedium: textThemeLight?.headline2,
        displaySmall: textThemeLight?.headline3,
        headlineMedium: textThemeLight?.headline4,
        headlineSmall: textThemeLight?.headline5,
        titleLarge: textThemeLight?.headline6,
        bodySmall: textThemeLight?.bodySmall,
        bodyMedium: textThemeLight?.bodyMedium,
        bodyLarge: textThemeLight?.bodyLarge);
  }

  ColorScheme? _colorSchemeLight() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: colorSchemeLight?.purple ?? const Color(0xff69389A),
      onPrimary: colorSchemeLight?.white ?? Colors.white,
      secondary: colorSchemeLight?.red ?? Colors.red,
      onSecondary: colorSchemeLight?.white ?? Colors.white,
      error: colorSchemeLight?.red ?? Colors.red,
      onError: colorSchemeLight?.orange ?? Colors.orange,
      background: colorSchemeLight?.lightGreen ?? Colors.lightBlue,
      onBackground: colorSchemeLight?.lightGreen ?? Colors.green,
      surface: colorSchemeLight?.azure ?? Colors.lightBlue,
      onSurface: colorSchemeLight?.darkGray ?? Colors.blueGrey,
    );
  }
}
