import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/models/user_model.dart';
import 'package:tunecache_with_flutter/services/firebase_operations.dart';
import 'package:tunecache_with_flutter/components/snack_message.dart';

class UserController {
  final UserOperationsFirebase _firebaseUserOperations =
      UserOperationsFirebase();

  Future<void> registerUser(context, UserModel user) async {
    Map<String, dynamic> userResult = await _firebaseUserOperations.createUser(
      user.emailAdress,
      user.password,
    );

    SnackMessage.show(context, userResult["message"]);

    if (userResult["registered"]) {
      Navigator.popAndPushNamed(context, '/homePage');
    }
  }

  Future<void> loginUser(context, String email, String password) async {
    Map<String, dynamic> loginResult =
        await _firebaseUserOperations.loginUser(email, password);

    SnackMessage.show(context, loginResult["message"]);

    if (loginResult["registered"]) {
      Navigator.popAndPushNamed(context, '/homePage');
    }
  }

  Future<void> logoutUser(context) async {
    String message = await _firebaseUserOperations.signOutUser();

    Navigator.popAndPushNamed(context, '/loginPage');
    SnackMessage.show(context, message);
  }
}
