import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_chandan_23_dec/api_reposotory/end_point.dart';
import 'package:text_chandan_23_dec/api_reposotory/server_error_hendler.dart';
import 'package:text_chandan_23_dec/constant/colors.dart';

import '../main.dart';
import '../model/store_model.dart';
import 'network.dart';

class ApiReposotory {
  static ApiReposotory instance = ApiReposotory.internal();

  ApiReposotory.internal();

  factory ApiReposotory() {
    return instance;
  }

  Future<StoreModel?> getBooksData() async {
    if (await Network.isConnected()) {
      try {
        Response res = await dio.get(ApiEndPoint.storeApi);
        StoreModel storeItem = StoreModel.fromJson(res.toString());
        return storeItem;
      } catch (error, stacktrace) {
        String message = "";
        if (error is DioError) {
          ServerError e = ServerError.withError(error: error);
          message = e.getErrorMessage();
        } else {
          message = "Something Went wrong";
        }
        Fluttertoast.showToast(
          msg: message,
          textColor: const Color(0xFFFFFFFF),
          backgroundColor: AppColors.myPrimaryColors,
        );
        return StoreModel(result: [], message: message, status: '1');
      }
    } else {
      Fluttertoast.showToast(
        msg: "Please Check Your Internet Connection",
        textColor: const Color(0xFFFFFFFF),
        backgroundColor: AppColors.myPrimaryColors,
      );
    }
    return null;
  }
}
