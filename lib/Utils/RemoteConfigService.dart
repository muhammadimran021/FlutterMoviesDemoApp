import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration(days: 1), // Adjust for testing
    ));

    await remoteConfig.setDefaults({
      "api_key": "test",
      "auth_token": "test1",
    });
    await fetchAndActivate();
  }

  Future<void> fetchAndActivate() async {
    await remoteConfig.fetchAndActivate();
  }

  String getStringValue(String key) {
    return remoteConfig.getString(key);
  }

  bool getBoolValue(String key) {
    return remoteConfig.getBool(key);
  }

  int getIntValue(String key) {
    return remoteConfig.getInt(key);
  }
}
