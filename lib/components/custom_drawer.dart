import 'package:flutter/material.dart';

Drawer customDrawer(context) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              "images/Tune_Logo_Name.png",
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/homePage"),
              label: Text("Página Principal"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/listPlaylistsPage"),
              label: Text("Playlists"),
            ),
          ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 8), // Espaço entre o avatar e o texto
              Expanded(
                child: Text(
                  'Nome de usuário muito longo',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "/userConfigsPage"),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
