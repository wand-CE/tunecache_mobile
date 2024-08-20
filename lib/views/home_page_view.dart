import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/components/custom_drawer.dart';

import '../AppRoutes.dart';
import '../controllers/user_controller.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout_sharp),
            onPressed: () => _userController.logoutUser(context),
          ),
        ],
        title: Text('TuneCache'),
      ),
      drawer: customDrawer(context),
      body: ListView(
        children: [
          ListTile(
            title: ElevatedButton(
              onPressed: () {},
              child: Text("Futuras Páginas"),
            ),
          )
        ],
      ),
      bottomSheet: Text("sdas"),
    );
  }
}
