import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/foundation.dart' show kIsWeb;

class NHhttpRequests {
  late bool nCheckTokenExpired;

  Future<Map<String, String>> nGetHeader = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  } as Future<Map<String, String>>;

  late String nBaseUrl;

  Future<bool> nRefreshToken = false as Future<bool>;

  Function nOnTokenNotRefresh = () {};

  void initialize({
    /// try to check token expired with body.message "Unauthorized"
    required bool checkTokenExpired,

    /// you can use your custom header default is
    ///
    /// <String, String>{
    ///   'Content-Type': 'application/json; charset=UTF-8',
    /// }
    ///
    Future<Map<String, String>>? getHeader,

    /// base url
    required String baseUrl,

    ///when checkTokenExpired is true you MOST set this
    ///
    /// you most refresh your token and return future bool
    ///
    /// if true request repeated
    /// else function OnTokenNotRefresh executed
    Future<bool>? refreshToken,

    /// when checkTokenExpired is true you MOST set this function
    Function? onTokenNotRefresh,
  }) {
    nCheckTokenExpired = checkTokenExpired;
    nGetHeader = getHeader!;
    nBaseUrl = baseUrl;
    nRefreshToken = refreshToken!;
    nOnTokenNotRefresh = onTokenNotRefresh!;
  }

  getHttp(url) async {
    try {
      Map<String, String> headers = await nGetHeader;
      final Url = Uri.parse("$nBaseUrl/$url");
      http.Response response = await http.get(
        Url,
        headers: headers,
      );

      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();

            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return getHttp(url);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch --$e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$nBaseUrl/$url',
      }));
    }
  }

  getHttpCustomUrl(url) async {
    try {
      final Url = Uri.parse('$url');
      Map<String, String> headers = await nGetHeader;
      var response = await http.get(
        Url,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return getHttpCustomUrl(url);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch --$e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$nBaseUrl/$url',
      }));
    }
  }

  deleteHttp(url, body) async {
    try {
      final Url = Uri.parse("$nBaseUrl/$url");
      Map<String, String> headers = await nGetHeader;
      var response = await http.delete(
        Url,
        body: body,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return deleteHttp(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch --$e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$nBaseUrl/$url',
      }));
    }
  }

  postHttp(url, body) async {
    var URL = Uri.parse("$nBaseUrl/$url");
    Map<String, String> headers = await nGetHeader;
    try {
      var response = await http.post(
        URL,
        body: body,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        if (nCheckTokenExpired) {
          try {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return postHttp(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } catch (e) {
            return Response(
                body: jsonEncode({
              "message": "catch --$e",
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } else {
          return Response(
              body: jsonEncode({
            "message": msg,
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$nBaseUrl/$url',
      }));
    }
  }

  patchHttp(url, body) async {
    var URL = Uri.parse("$nBaseUrl/$url");
    Map<String, String> headers = await nGetHeader;

    try {
      var response = await http.patch(
        URL,
        body: body,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return patchHttp(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch --$e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$url',
      }));
    }
  }

  patchHttpCustom(url, body) async {
    var URL = Uri.parse(url);

    Map<String, String> headers = await nGetHeader;

    try {
      var response = await http.patch(
        URL,
        body: body,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return patchHttpCustom(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": msg,
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$url',
      }));
    }
  }

  postHttpWithoutToken(url, body) async {
    var URL = Uri.parse("$nBaseUrl/$url");
    try {
      var response = await http.post(
        URL,
        body: body,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }

        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return postHttpWithoutToken(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch --$e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch --$e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$url',
      }));
    }
  }

  postHttpCustom(url, body, {bool reqByToken = true}) async {
    var URL = Uri.parse(url);

    Map<String, String> headers = await nGetHeader;

    try {
      var response = await http.post(
        URL,
        body: body,
        headers: headers,
      );
      int responseCode = response.statusCode;
      if (responseCode > 199 && responseCode <= 299) {
        return response;
      } else {
        String msg = '';
        try {
          msg = jsonDecode(response.body)['message'].toString();
        } catch (e) {
          msg = jsonDecode(response.body);
        }
        try {
          if (nCheckTokenExpired) {
            msg = jsonDecode(response.body)['message'].toString();
            if (msg == 'Unauthorized') {
              bool isRefreshCompleted = await nRefreshToken;
              if (isRefreshCompleted) {
                return postHttpCustom(url, body);
              } else {
                nOnTokenNotRefresh();
              }
            } else {
              return Response(
                  body: jsonEncode({
                "message": msg,
                "success": false,
                "responseCode": responseCode,
                "urlRequest": '$nBaseUrl/$url',
              }));
            }
          } else {
            return Response(
                body: jsonEncode({
              "message": msg,
              "success": false,
              "responseCode": responseCode,
              "urlRequest": '$nBaseUrl/$url',
            }));
          }
        } catch (e) {
          return Response(
              body: jsonEncode({
            "message": "catch => $e",
            "success": false,
            "responseCode": responseCode,
            "urlRequest": '$nBaseUrl/$url',
          }));
        }
      }
    } catch (e) {
      return Response(
          body: jsonEncode({
        "message": "catch => $e",
        "success": false,
        "responseCode": 151515115,
        "urlRequest": '$url',
      }));
    }
  }

  // Future<bool> refreshToken() async {
  //   try {
  //     ClientInformation info = await getDeviceInfo();
  //     Map myProfile = jsonDecode(AsyncStorage.read("profile"));

  //     // final body = jsonEncode({
  //     //   'device_id': info.deviceId.toString(),
  //     //   'refreshToken': myProfile['refreshToken'].toString()
  //     // });

  //     var URL = Uri.parse('$base_url_Request/auth/refresh-token');
  //     var response = await http.post(
  //       URL,
  //       body: {
  //         'device_id': info.deviceId.toString(),
  //         'refreshToken': myProfile['refreshToken'].toString()
  //       },
  //     );

  //     final decodedResponse = jsonDecode(response.body);
  //     if (decodedResponse['success']) {
  //       var newAccessToken = decodedResponse['accessToken'];
  //       var newRefreshToken = decodedResponse['refreshToken'];

  //       AsyncStorage.write(
  //           "profile",
  //           jsonEncode({
  //             "mobile": myProfile['mobile'],
  //             "username": myProfile['username'],
  //             "first_name": myProfile['first_name'],
  //             "last_name": myProfile['last_name'],
  //             "accessToken": newAccessToken,
  //             "refreshToken": newRefreshToken
  //           }));

  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<Map<String, String>> headerRequest() async {
  //   ClientInformation info = await getDeviceInfo();
  //   if (kIsWeb) {
  //     try {
  //       if (AsyncStorage.hasData('profile')) {
  //         return <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'Authorization':
  //               jsonDecode(AsyncStorage.read("profile"))['accessToken'],
  //           'device-id': info.deviceId,
  //         };
  //       } else {
  //         return <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'device-id': info.deviceId,
  //         };
  //       }
  //     } catch (e) {
  //       return <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'device-id': 'web',
  //       };
  //     }
  //   } else {
  //     try {
  //       if (AsyncStorage.hasData('profile')) {
  //         return <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'Authorization':
  //               jsonDecode(AsyncStorage.read("profile"))['accessToken'],
  //           'device-id': info.deviceId
  //         };
  //       } else {
  //         return <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8',
  //           'device-id': info.deviceId
  //         };
  //       }
  //     } catch (e) {
  //       return <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'device-id': 'web'
  //       };
  //     }
  //   }
  // }

}
