import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    // main colors
    scaffoldBackgroundColor: ColorManager.background,

    primaryColor: ColorManager.primary,

    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.secondary, // ribble effect color
    // TODO: Apply fontFamily

    // cardView theme
    // TODO: add cardView theme.

    // appBar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      color: ColorManager.secondary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularTextStyle(context,
          color: ColorManager.white, fontSize: FontSize.s16),
    ),

    // button theme
    // TODO: add button theme.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: AppPadding.p4, vertical: 0)),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(
            AppSize.s100,
            AppSize.s45,
          ),
        ),
        side: MaterialStateProperty.all<BorderSide?>(
          const BorderSide(color: ColorManager.secondary, width: 0.5),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s2),
          ),
        ),
      ),
    ),
    // elevated button theme
    // TODO: add elevated button theme.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(
            AppSize.s145,
            AppSize.s40,
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color?>(ColorManager.primary),
      ),
    ),

    // text theme
    // TODO: add text theme.

    // inputDecoration theme (text field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: AppPadding.p10,
      ),
      hintStyle: const TextStyle(color: ColorManager.lightGrey),
      filled: true,
      fillColor: ColorManager.white,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s2)),
      ),
      // errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: ColorManager.error),
      //   borderRadius: const BorderRadius.all(Radius.circular(AppSize.s2)),
      // ),
      // disabledBorder: const OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(AppSize.s2)),
      //   borderSide: BorderSide(color: ColorManager.primary),
      // ),
      // focusedErrorBorder: const OutlineInputBorder(
      //   borderSide: BorderSide(color: ColorManager.lightGrey),
      //   borderRadius: BorderRadius.all(Radius.circular(AppSize.s2)),
      // ),
    ),
    textTheme: TextTheme(
        caption: getLightTextStyle(context, color: ColorManager.grey),
        headline4: getBoldTextStyle(context, color: ColorManager.primary),
        subtitle1: getMediumTextStyle(context, color: ColorManager.black),
        subtitle2: getRegularTextStyle(context, color: ColorManager.black)),
  );
}
