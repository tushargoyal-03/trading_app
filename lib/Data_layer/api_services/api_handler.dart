import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trading_app/Data_layer/api_services/response_handling.dart';

import '../../Application_layer/utils/share_preferences.dart';
import '../../main.dart';
import 'app_urls.dart';


class ApiHandler {
  Dio? _dio;

  String deviceId = '';
  String deviceType = '';
  String deviceUniqueId = '';

  ApiHandler() {
    BaseOptions options = BaseOptions(
      baseUrl: BASE_URL, receiveTimeout: Duration(milliseconds: 300000), connectTimeout: Duration(milliseconds: 300000),);
    _dio = Dio(options);
    _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  /// ----------------------------------------------------------
  /// ADS API
  /// ----------------------------------------------------------
  /// put ads

  Future<OnComplete> uploadVideoApi(dynamic fromData, String url) async {
    try {
      ApiResponse apiResponse = await apiRequest(

          request: _dio!.post(
              url,
              data: fromData,
              options:
              Options(
                  contentType: "application/from-data",
                  headers: {
                    "Authorization": "Bearer " + "${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
                  }
              )) );
      if (apiResponse.status&&apiResponse.data!=null) {
        return OnComplete.success(apiResponse.data);
      } else {
        return OnComplete.error(
          apiResponse.messsage ?? "",);
      }
    } catch (e) {
      print("adsApi Error: ${e.toString()}"); // Log error details

      return OnComplete.error("Something went wrong!");
    }
  }


  Future<OnComplete> uploadImageApi(dynamic fromData, String url) async {
    try {
      ApiResponse apiResponse = await apiRequest(

          request: _dio!.post(
              url,
              data: fromData,
              options:
              Options(
                  contentType: "multipart/form-data",
                  headers: {
                    "Authorization": "Bearer " + "${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
                  }
              )) );
      if (apiResponse.status) {
        return OnComplete.success(apiResponse.status);
      } else {
        return OnComplete.error(
          apiResponse.messsage ?? "",);
      }
    } catch (e) {
      print("adsApi Error: ${e.toString()}"); // Log error details

      return OnComplete.error("Something went wrong!");
    }
  }




}