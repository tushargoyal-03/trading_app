import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';

import '../../Application_layer/constants/app_color.dart';
import '../../Application_layer/utils/connectivity.dart';
import '../../Application_layer/utils/share_preferences.dart';
import '../../main.dart';
import 'app_urls.dart';

class ApiHelper {


  // TODO : Post API Function

  Future<Map<String, dynamic>?> postApiCallDio(
      bool isShown,
      String url,
      BuildContext context,
      Map<String, dynamic>? jsonData, {
        bool showLoader = true,

      }) async {
    // Check internet connection
    bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
    if (!isNetActive) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        backgroundColor: Colors.red,
      );
      return null;
    }

    // Show loader
    if (showLoader && context != null) {
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: buttonColor)),
        barrierDismissible: false,
      );
    }

    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer ${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      Response response = await dio.post(url, data: jsonData);

      // Close loader
      if (showLoader && Get.isDialogOpen == true) Get.back();

      if (kDebugMode) {
        print("🔹 URL: $BASE_URL$url");
        print("🔹 Request: $jsonData");
        print("🔹 Status Code: ${response.statusCode}");
        print("🔹 Response: ${response.data}");
      }

      if (response.data == null) {
        return {"status": false, "message": "Empty response from server"};
      }

      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else if (response.data is String) {
        return jsonDecode(response.data) as Map<String, dynamic>;
      } else {
        return {"status": false, "message": "Invalid response format"};
      }
    } on DioException catch (e) {
      // Close loader
      if (showLoader && Get.isDialogOpen == true) Get.back();

      String errorMessage = "Unknown network error";

      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = "Connection timeout";
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = "Send timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = "Receive timeout";
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage =
        "Connection error. Check your internet or server URL: $url";
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = "Request cancelled";
      } else if (e.response != null) {
        // Server returned error
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ??
              e.response?.data['error'] ??
              "Server error";
        } else if (e.response?.data is String) {
          errorMessage = e.response?.data ?? errorMessage;
        }
      }

      if (kDebugMode) print("Dio Error: $errorMessage");

      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
      );

      return {"status": false, "message": errorMessage};
    } catch (e) {
      if (showLoader && Get.isDialogOpen == true) Get.back();

      if (kDebugMode) print("General Error: $e");

      Fluttertoast.showToast(
        msg: "Unexpected error occurred",
        backgroundColor: Colors.red,
      );

      return {"status": false, "message": "Unexpected error: ${e.toString()}"};
    }
  }


  // TODO : Get API Function

  // Get API Function
  Future<dynamic> getApiCallDio(
      BuildContext context,
      String url, {
        bool isShow = true,
        bool? isPopup = true,
      }) async {
    bool isNetActive =
    await ConnectionStatus.getInstance().checkConnection();

    if (!isNetActive) {
      //internetConnectionDialog(context);
      return null;
    }

    // Loader show
    if (isShow) {
      // Get.dialog(
      //   const Center(child: CircularProgressIndicator(color: buttonColor)),
      //   barrierDismissible: false,
      // );
    }

    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization":
          "Bearer ${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
          "accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      Response response = await dio.get(url);

      // Loader hide
      if (isShow && Get.isDialogOpen!) Get.back();

      if (kDebugMode) {
        print("🔹 API URL: ${BASE_URL + url}");
        print("🔹 Token: ${sp?.getString(SpUtil.ACCESS_TOKEN) }");
        print("🔹 Status Code: ${response.statusCode}");
        log("🔹 Response Body: ${response.data.toString()}");
      }

      final responseData = response.data;

      // Error status handling
      if ([401, 422, 403, 404, 409, 500]
          .contains(response.statusCode)) {
        Fluttertoast.showToast(
          msg: responseData['message'] ?? "Something went wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: iconColor,
        );
        return responseData;
      }

      // Popup error (status false)
      if (isPopup == true) {
        final status = responseData['status'];
        if (status is bool && !status) {
          Fluttertoast.showToast(
            msg: responseData['message'] ?? "Operation failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: iconColor,
          );
        }
      }

      return responseData;
    } on DioException catch (e) {
      if (isShow && Get.isDialogOpen!) Get.back();

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout) {
        //showToastMessage("No Internet connection");
      } else if (e.response != null) {
        // Fluttertoast.showToast(
        //   msg: e.response?.data['message'] ?? "Something went wrong",
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.CENTER,
        //   backgroundColor: Colors.orange,
        // );
        return e.response?.data;
      }

      return {
        "status": false,
        "message": "Something went wrong",
      };
    } catch (e) {
      if (isShow && Get.isDialogOpen!) Get.back();
      print("⚠️ API Exception: $e");
      return {
        "status": false,
        "message": "Something went wrong",
      };
    }
  }


  // TODO : PUT API

  Future<Map<String, dynamic>?> putApiCallDio(
      bool isShow,
      String url,
      BuildContext context,
      Map<String, dynamic>? jsonData, {
        bool? isPopup = true,
      }) async {
    // Check internet connection
    bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
    if (!isNetActive) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        backgroundColor: Colors.red,
      );
      return null;
    }

    // Show loading dialog
    if (isShow) {
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: buttonColor)),
        barrierDismissible: false,
      );
    }

    // Initialize Dio
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer ${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
          "accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      // Make API call
      Response response = await dio.put(url, data: jsonData);

      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      // Debug logs
      if (kDebugMode) {
        print("🔹 API URL: $BASE_URL$url");
        print("🔹 Request Body: $jsonData");
        print("🔹 Status Code: ${response.statusCode}");
        log("🔹 Response Body: ${response.data}");
      }

      // Validate response
      if (response.data == null) {
        return {"status": false, "message": "Empty response from server"};
      }

      // Handle different response types
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else if (response.data is String) {
        try {
          return jsonDecode(response.data) as Map<String, dynamic>;
        } catch (e) {
          return {"status": false, "message": "Invalid JSON response"};
        }
      } else {
        return {"status": false, "message": "Invalid response format"};
      }
    } on DioException catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      String errorMessage = "Something went wrong";

      // Handle different error types
      if (e.response != null) {
        // Server responded with error
        if (kDebugMode) {
          print("Error Response: ${e.response?.data}");
          print("Status Code: ${e.response?.statusCode}");
        }

        // Try to extract error message from response
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ??
              e.response?.data['error'] ??
              "Server error occurred";
        } else if (e.response?.data is String) {
          errorMessage = e.response?.data ?? errorMessage;
        }
      } else {
        // No response from server
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = "Connection timeout";
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = "Send timeout";
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = "Receive timeout";
            break;
          case DioExceptionType.connectionError:
            errorMessage = "Connection error. Please check your internet";
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request cancelled";
            break;
          default:
            errorMessage = e.message ?? "Network error occurred";
        }
      }

      if (kDebugMode) {
        print("DioException: $errorMessage");
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
      );

      return {
        "status": false,
        "message": errorMessage,
      };
    } catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      if (kDebugMode) {
        print("General Exception: $e");
      }

      Fluttertoast.showToast(
        msg: "Unexpected error occurred",
        backgroundColor: Colors.red,
      );

      return {
        "status": false,
        "message": "Unexpected error: ${e.toString()}",
      };
    }
  }


  // TODO : PATCH

  Future<Map<String, dynamic>?> patchApiCallDio(
      bool isShow,
      String url,
      BuildContext context,
      Map<String, dynamic>? jsonData, {
        bool? isPopup = true,
      }) async {
    // Check internet connection
    bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
    if (!isNetActive) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        backgroundColor: Colors.red,
      );
      return null;
    }

    // Show loading dialog
    if (isShow) {
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: buttonColor)),
        barrierDismissible: false,
      );
    }

    // Initialize Dio
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer ${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
          "accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      // Make API call
      Response response = await dio.patch(url, data: jsonData);

      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      // Debug logs
      if (kDebugMode) {
        print("🔹 API URL: $BASE_URL$url");
        print("🔹 Request Body: $jsonData");
        print("🔹 Status Code: ${response.statusCode}");
        log("🔹 Response Body: ${response.data}");
      }

      // Validate response
      if (response.data == null) {
        return {"status": false, "message": "Empty response from server"};
      }

      // Handle different response types
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else if (response.data is String) {
        try {
          return jsonDecode(response.data) as Map<String, dynamic>;
        } catch (e) {
          return {"status": false, "message": "Invalid JSON response"};
        }
      } else {
        return {"status": false, "message": "Invalid response format"};
      }
    } on DioException catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      String errorMessage = "Something went wrong";

      // Handle different error types
      if (e.response != null) {
        // Server responded with error
        if (kDebugMode) {
          print("Error Response: ${e.response?.data}");
          print("Status Code: ${e.response?.statusCode}");
        }

        // Try to extract error message from response
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ??
              e.response?.data['error'] ??
              "Server error occurred";
        } else if (e.response?.data is String) {
          errorMessage = e.response?.data ?? errorMessage;
        }
      } else {
        // No response from server
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = "Connection timeout";
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = "Send timeout";
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = "Receive timeout";
            break;
          case DioExceptionType.connectionError:
            errorMessage = "Connection error. Please check your internet";
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request cancelled";
            break;
          default:
            errorMessage = e.message ?? "Network error occurred";
        }
      }

      if (kDebugMode) {
        print("DioException: $errorMessage");
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
      );

      return {
        "status": false,
        "message": errorMessage,
      };
    } catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      if (kDebugMode) {
        print("General Exception: $e");
      }

      Fluttertoast.showToast(
        msg: "Unexpected error occurred",
        backgroundColor: Colors.red,
      );

      return {
        "status": false,
        "message": "Unexpected error: ${e.toString()}",
      };
    }
  }


  // TODO : Delete
  Future<Map<String, dynamic>?> deleteApiCallDio(
      bool isShow,
      String url,
      BuildContext context,
      Map<String, dynamic>? jsonData, {
        bool? isPopup = true,
      }) async {
    // Check internet connection
    bool isNetActive = await ConnectionStatus.getInstance().checkConnection();
    if (!isNetActive) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        backgroundColor: Colors.red,
      );
      return null;
    }
    // Show loading dialog
    if (isShow) {
      Get.dialog(
        const Center(child: CircularProgressIndicator(color: buttonColor)),
        barrierDismissible: false,
      );
    }

    // Initialize Dio
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          "Authorization": "Bearer ${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
          "accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    try {
      // Make API call
      Response response = await dio.delete(url, data: jsonData);

      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      // Debug logs
      if (kDebugMode) {
        print("🔹 API URL: $BASE_URL$url");
        print("🔹 Request Body: $jsonData");
        print("🔹 Status Code: ${response.statusCode}");
        log("🔹 Response Body: ${response.data}");
      }

      // Validate response
      if (response.data == null) {
        return {"status": false, "message": "Empty response from server"};
      }

      // Handle different response types
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else if (response.data is String) {
        try {
          return jsonDecode(response.data) as Map<String, dynamic>;
        } catch (e) {
          return {"status": false, "message": "Invalid JSON response"};
        }
      } else {
        return {"status": false, "message": "Invalid response format"};
      }
    } on DioException catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      String errorMessage = "Something went wrong";

      // Handle different error types
      if (e.response != null) {
        // Server responded with error
        if (kDebugMode) {
          print("Error Response: ${e.response?.data}");
          print("Status Code: ${e.response?.statusCode}");
        }

        // Try to extract error message from response
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ??
              e.response?.data['error'] ??
              "Server error occurred";
        } else if (e.response?.data is String) {
          errorMessage = e.response?.data ?? errorMessage;
        }
      } else {
        // No response from server
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = "Connection timeout";
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = "Send timeout";
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = "Receive timeout";
            break;
          case DioExceptionType.connectionError:
            errorMessage = "Connection error. Please check your internet";
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request cancelled";
            break;
          default:
            errorMessage = e.message ?? "Network error occurred";
        }
      }

      if (kDebugMode) {
        print("DioException: $errorMessage");
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
      );

      return {
        "status": false,
        "message": errorMessage,
      };
    } catch (e) {
      // Close loading dialog
      if (isShow && Get.isDialogOpen == true) {
        Get.back();
      }

      if (kDebugMode) {
        print("General Exception: $e");
      }

      Fluttertoast.showToast(
        msg: "Unexpected error occurred",
        backgroundColor: Colors.red,
      );

      return {
        "status": false,
        "message": "Unexpected error: ${e.toString()}",
      };
    }
  }


}
