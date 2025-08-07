import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  buildAppBar({required this.title});

  String formattedDate = DateFormat(
    'yyyy-MM-dd – kk:mm',
  ).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: null,
          ),
          Column(
            children: [
              Text(title, style: TextStyle(fontSize: 14)),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 12, color: Colors.black38),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: null,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
