import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/controllers/user_controller.dart';

class UserConfigsPageView extends StatefulWidget {
  const UserConfigsPageView({super.key});

  @override
  State<UserConfigsPageView> createState() => _UserConfigsPageViewState();
}

class _UserConfigsPageViewState extends State<UserConfigsPageView> {
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout_sharp),
            onPressed: () => _userController.logoutUser(context),
            tooltip: 'Sair da conta',
          ),
        ],
        title: Text('Configurações'),
      ),
    );
  }
}
