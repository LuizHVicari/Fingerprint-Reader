import 'package:flutter/material.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const TopBar({super.key, required this.title});

  @override
  State<TopBar> createState() => _TopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopBarState extends State<TopBar> {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white
        ),
        ),
      backgroundColor: Colors.teal.shade500,
    );
  }
}