import 'package:flutter/material.dart';
import 'package:tunecache_with_flutter/components/custom_drawer.dart';

import '../components/custom_bottom_player.dart';
import '../components/custom_list_tile_playlist.dart';
import 'package:tunecache_with_flutter/controllers/user_controller.dart';

class ListPlaylistsPageView extends StatefulWidget {
  const ListPlaylistsPageView({super.key});

  @override
  State<ListPlaylistsPageView> createState() => _ListPlaylistsPageViewState();
}

class _ListPlaylistsPageViewState extends State<ListPlaylistsPageView> {
  UserController _userController = UserController();

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
        title: Text('Minhas Playlists'),
      ),
      drawer: customDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return customListTilePlaylist(
                  title: "Teste",
                  buttonFunction: () {},
                  cover:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1BXHz6D0"
                      "o_loHU43N8pdOqwomoLti07_fpYLNiwgPQh26mJlEEg4RfJBMsS7VuV7NjdY"
                      "&usqp=CAU",
                );
              },
              itemCount: 30,
            ),
          ),
          CustomBottomPlayer()
        ],
      ),
    );
  }
}
