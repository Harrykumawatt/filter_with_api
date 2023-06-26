import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return (PopupMenuButton(
      initialValue: 0,
      splashRadius: 24,
      offset: Offset(15, 60),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: Text("code"),
          ),
          const PopupMenuItem(child: Text("code")),
          const PopupMenuItem(child: Text("code")),
          const PopupMenuItem(child: Text("code"))
        ];
      },
    ));
  }
}
