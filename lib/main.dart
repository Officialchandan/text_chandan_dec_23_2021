import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_chandan_23_dec/api_reposotory/end_point.dart';
import 'package:text_chandan_23_dec/constant/colors.dart';
import 'package:text_chandan_23_dec/ui/stores_home_screen.dart';

import 'api_reposotory/api_reposotory.dart';

BaseOptions baseOptions = BaseOptions(
  baseUrl: ApiEndPoint.baseUrl,
  receiveTimeout: 60000,
  sendTimeout: 60000,
  responseType: ResponseType.json,
  maxRedirects: 3,
);

Dio dio = Dio(baseOptions);

ApiReposotory apiReposotory = ApiReposotory();

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          AppColors.myPrimaryColors, // navigation bar color
      statusBarColor: AppColors.myPrimaryColors,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        logPrint: (text) {
          log(text.toString());
        }),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.myPrimaryColors,
        ),
        primaryColor: AppColors.myPrimaryColors,
      ),
      home: const StoresHomeScreen(),
    );
  }
}
