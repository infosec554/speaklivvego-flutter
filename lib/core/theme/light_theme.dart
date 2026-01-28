import 'package:flutter/material.dart';
import 'package:speak_live_go/core/constants/app_colors.dart';
import 'package:speak_live_go/core/constants/font_family_names.dart';
import 'package:speak_live_go/core/theme/theme_elements/app_bar/light.dart';
import 'package:speak_live_go/core/theme/theme_elements/checkbox/light.dart';
import 'package:speak_live_go/core/theme/theme_elements/color/light.dart';
import 'package:speak_live_go/core/theme/theme_elements/elevated_button/light.dart';
import 'package:speak_live_go/core/theme/theme_elements/input_decoration_theme/light.dart';
import 'package:speak_live_go/core/theme/theme_elements/text/light.dart';

ThemeData get lightThemeData {
  return ThemeData(
    fontFamily: FFN.poppins,
    scrollbarTheme: ScrollbarThemeData(
      crossAxisMargin: 0,
      mainAxisMargin: -12,
      thickness: WidgetStateProperty.all(8),
      interactive: false,
      radius: const Radius.circular(12),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.c2A85F3primary,
    ),
    primaryColorLight: AppColors.white,
    brightness: Brightness.light,
    // dialogBackgroundColor: AppColors.lightDialogBackgroundColor,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.c2A85F3primary,
    splashColor: Colors.transparent,
    dividerColor: AppColors.cC1E2F3disableOrDivider,
    // fontFamily: FFNames.productSans,
    appBarTheme: lightAppBarTheme,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),

    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme: lightCheckboxThemeData,
    // popupMenuTheme: const PopupMenuThemeData(
    //   color: AppColors.white,
    //   textStyle: TextStyle(
    //     fontSize: 16,
    //     color: AppColors.cE2E8F0borderColorLight,
    //     fontWeight: FontWeight.w400,
    //   ),
    // ),
    elevatedButtonTheme: lightElevatedButtonThemeData,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
    ),
    dataTableTheme: const DataTableThemeData(
      dataRowMinHeight: 50,
      dataRowMaxHeight: 65,
      checkboxHorizontalMargin: 16,
      // headingTextStyle: GoogleFonts.inter(
      //   fontSize: 16,
      //   fontWeight: FontWeight.w500,
      //   color: AppColors.cE2E8F0borderColorLight,
      // ),
      // dataTextStyle: GoogleFonts.inter(
      //   fontSize: 16,
      //   fontWeight: FontWeight.w400,
      //   color: AppColors.c1E293Bdark,
      // ),
    ),
    textTheme: lightTextTheme,
    tabBarTheme: const TabBarThemeData(
      splashFactory: InkRipple.splashFactory,
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      indicator: BoxDecoration(
        color: AppColors.c2A85F3primary,
        // borderRadius: BorderRadius.circular(8),
      ),
      dividerHeight: 0,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      // unselectedLabelColor: AppColors.darkScaffoldBgColor,
      labelColor: AppColors.white,
      // splashBorderRadius: BorderRadius.circular(8),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.c2A85F3primary),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.c2A85F3primary.withValues(alpha: 0.2),
      selectionHandleColor: AppColors.white,
    ),

    visualDensity: VisualDensity.comfortable,
    colorScheme: colorSchemeLight,
    dividerTheme: const DividerThemeData(
      color: AppColors.cC1E2F3disableOrDivider,
    ),
  );
}
