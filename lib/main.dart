import 'package:flutter/material.dart';
import 'package:flutter_application/core/di/dependency_injection.dart';
import 'package:flutter_application/core/routing/app_route.dart';
import 'package:flutter_application/doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRoute: AppRoute()));
}
