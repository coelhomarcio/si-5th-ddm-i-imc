import "package:flutter/material.dart";

import "app_list_tile.dart";

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset("assets/img/imc.png"),
                    ),
                ),
                Positioned(
                  bottom: 4,
                  left: 16,
                  child: Text(
                    "Menu".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2),
                  ),
                ),
              ],
            ),
          ),
          const AppListTile(Icons.home_outlined, "Home", "home"),
          const AppListTile(Icons.monitor_weight_outlined, "IMC", "imc",
              subTitle: "Índice de Massa Corporal"),
          const Divider(),
          const AppListTile(Icons.feed_outlined, "Sobre", "about"),
        ],
      ),
    );
  }
}
