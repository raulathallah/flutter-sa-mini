import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int? fromIndex;
  final void Function(int)? onTabChange;

  buildAppBar({
    super.key,
    required this.title,
    this.fromIndex,
    required this.onTabChange,
  });

  String formattedDate = DateFormat(
    'd MMMM, yyyy – kk:mm',
  ).format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () {
              if (fromIndex != null) {
                onTabChange!(fromIndex!);
              }
            },
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
