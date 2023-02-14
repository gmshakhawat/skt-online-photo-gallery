import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum AppEnvironment {
  PROD,
  DEV,
}

class AppConfig extends InheritedWidget {
  final AppEnvironment appEnvironment;
  final String appName;
  final String appLogo;
  final String baseUrl;

  final ThemeData? themeData;
  final Widget child;

  AppConfig({
    required this.appEnvironment,
    required this.appName,
    required this.appLogo,
    this.themeData,
    required this.baseUrl,
    required this.child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType() ??
        AppConfig(
          appEnvironment: AppEnvironment.DEV,
          appName: "Otto International Dev",
          baseUrl: "",
          appLogo: "",
          child: Container(),
        );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
