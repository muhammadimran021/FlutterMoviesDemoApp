import 'package:hive/hive.dart';

final String _api_key = "bd9a0f3aac2b3bb637d47a4ab5c5d388";

Future<Box> getBoxForHive(String boxName) async {
  if (Hive.isBoxOpen(boxName)) {
    return Hive.box(boxName);
  } else {
    return await Hive.openBox(boxName);
  }
}
