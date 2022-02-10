import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  //Instance of get storage
  final box = GetStorage();

  setUser({
    required String userid,
    required String name,
    required String pass,
    required String user,
    required String gender,
  }) {
    box.write('userid', userid);
    box.write('name', name);
    box.write('pass', pass);
    box.write('user', user);
    box.write('gender', gender);
    print("Succesfuly saved");
  }

  removeUsers() {
    box.remove('userid');
    box.remove('name');
    box.remove('pass');
    box.remove('user');
    box.remove('gender');
  }
}
