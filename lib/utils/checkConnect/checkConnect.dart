import 'package:connectivity_plus/connectivity_plus.dart';

/// return boolean
///
///   if return true  I am connected to a mobile network or wifi.

Future<bool> nhCheckConnect() async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
