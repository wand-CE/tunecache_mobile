import 'package:flutter/material.dart';

Widget customListTilePlaylist(
    {required String title,
    required Function buttonFunction,
    required String cover}) {
  return ElevatedButton(
    onPressed: () => buttonFunction,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.black,
    ),
    child: Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: NetworkImage(cover)),
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
