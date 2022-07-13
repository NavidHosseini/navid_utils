// import 'dart:async';
// import 'dart:convert';

// import 'package:client_information/client_information.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;


// class DeepLinkController extends GetxController {
//   final base_url = dotenv.get('BASE_URL');
//   GetStorage AsyncStorage = GetStorage();

//   late BuildContext context;
//   DeepLinkController({required this.context});
//   Uri? _latestUri;
//   Object? _err;
//   late StreamSubscription _sub;

//   Future<void> initUniLinks() async {
//     _sub = uriLinkStream.listen((Uri? link) {
//       _latestUri = link;
//       final queryParams = _latestUri?.queryParametersAll.entries.toList();
//       //print('queryParams $queryParams');
//       if (queryParams!.isNotEmpty) {
//         // onMessagePremium("");

//         onMessagePremium(queryParams[0].value[0].toString());
//       }
//     }, onError: (err) {
//       // Handle exception by warning the user their action did not succeed
//     });

//     // NOTE: Don't forget to call _sub.cancel() in dispose()
//   }

//   onMessagePremium(String data) async {
//     Get.back();
//     await refreshToken();
//     bool isRefreshCompleted = await refreshToken();
//     if (isRefreshCompleted) {
//       await getMyPaymentMovies(data);
//       // TODO navigate to moviePlayer
//     } else {}

//     // if (data == "true") {
//     //   // Phoenix.rebirth(context);
//     //   prController.getMyPlan();
//     //   prController.getAllListPurchases();
//     // } else {
//     //   Get.back();
//     // }
//   }

//   getMyPaymentMovies(String data) async {
//     GetStorage AsyncStorage = GetStorage();

//     final reguest = await getHttp('video/user-premium-videos');
//     final decodedResponse = jsonDecode(reguest.body);
//     if (decodedResponse['success']) {
//       List paymentMovies = decodedResponse['result'];
//       if (paymentMovies.isNotEmpty) {
//         List successPayment = paymentMovies
//             .where((element) =>
//                 element['paymentMovies'] != null ||
//                 element['paymentMovies'] != "null")
//             .toList();
//         final List listIdMovies =
//             successPayment.map((element) => element['_id']).toList();
//         // //print("listIdMovies $listIdMovies");

//         AsyncStorage.write("successPayment_Id", jsonEncode(listIdMovies));
//         if (data == "success") {
//           String movieId = AsyncStorage.read("movieIdPayment");

//           List movieUrls = await getVideoUrls(movieId);
//           if (movieUrls.isNotEmpty) {
//             Get.toNamed('./VideoPlayerScreen', arguments: [movieUrls, movieId]);
//           }
//         }
//       }
//     } else {}
//   }

//   Future<bool> refreshToken() async {
//     try {
//       ClientInformation info = await getDeviceInfo();

//       var URL = Uri.parse('$base_url/auth/refresh-token');
//       var response = await http.post(
//         URL,
//         body: {
//           "device_id": info.deviceId,
//           "refreshToken":
//               jsonDecode(AsyncStorage.read("profile"))['refreshToken']
//         },
//       );
//       final decodedResponse = jsonDecode(response.body);
//       if (decodedResponse['success']) {
//         var newAccessToken = decodedResponse['accessToken'];
//         var newRefreshToken = decodedResponse['refreshToken'];

//         //
//         Map myProfile = jsonDecode(AsyncStorage.read("profile"));

//         AsyncStorage.write(
//             "profile",
//             jsonEncode({
//               "mobile": myProfile['mobile'],
//               "username": myProfile['username'],
//               "first_name": myProfile['first_name'],
//               "last_name": myProfile['last_name'],
//               "accessToken": newAccessToken,
//               "refreshToken": newRefreshToken
//             }));

//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<List> getVideoUrls(String movieId) async {
//     final reguest = await getHttp('video/video-url/$movieId');
//     final decodedResponse = jsonDecode(reguest.body);

//     if (decodedResponse['success']) {
//       final List data = decodedResponse['result'];
//       if (data.isNotEmpty) {
//         Get.back();

//         return data;
//       } else {
//         Get.back();
//         return [];
//       }
//     } else {
//       Get.back();
//       ErrorHandle(
//               errorReceive: decodedResponse['message'],
//               urlRequest: decodedResponse['urlRequest'])
//           .showErr();
//       return [];
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     initUniLinks();
//   }

//   @override
//   void onClose() {
//     _sub.cancel();
//     super.onClose();
//   }
// }
