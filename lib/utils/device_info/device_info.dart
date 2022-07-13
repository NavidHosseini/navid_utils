import 'package:client_information/client_information.dart';

/// Get basic client information
///
/// ClientInformation is
///
/// applicationBuildCode
/// applicationId
/// applicationName
/// applicationType
/// applicationVersion
/// deviceId
/// deviceName
/// osName
/// osVersion
/// softwareName
/// softwareVersion
///
///
Future<ClientInformation> nhGetDeviceInfo() async {
  try {
    ClientInformation info = await ClientInformation.fetch();
    return info;
  } catch (e) {
    return ClientInformation(
      applicationBuildCode: "not recognize",
      applicationId: "not recognize",
      applicationName: "not recognize",
      applicationType: "not recognize",
      applicationVersion: "not recognize",
      deviceId: "not recognize",
      deviceName: "not recognize",
      osName: "not recognize",
      osVersion: "not recognize",
      softwareName: "not recognize",
      softwareVersion: "not recognize",
    );
  }
}
