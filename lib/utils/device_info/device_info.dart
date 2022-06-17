import 'package:client_information/client_information.dart';

Future<ClientInformation> getDeviceInfo() async {
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
