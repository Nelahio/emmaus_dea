import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      toolbarHeight: 70,
      backgroundColor: Colors.black,
      actions: [
        Image.asset(
          "assets/logo_international.png",
          fit: BoxFit.contain,
          height: 60,
        ),
      ],
      title: Image.asset(
        "assets/logo.png",
        fit: BoxFit.contain,
        height: 60,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
