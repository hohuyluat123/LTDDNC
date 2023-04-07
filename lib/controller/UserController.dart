import 'package:get/get.dart';

import '../model/User.dart';

class UserController extends GetxController {
  var currentUser = User(
          accountId: -1,
          name: "name",
          accessToken: "accessToken",
          refreshToken: "refreshToken",
          isSeller: false).obs;

}
