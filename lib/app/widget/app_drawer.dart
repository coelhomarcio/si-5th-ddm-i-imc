import "package:flutter/material.dart";

import "package:imc/app/global/global.dart" as app;
import "package:imc/app/widget/app_list_tile.dart";

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
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
                    child: app.text(string: "Menu", isTitle: true),
                  ),
                ],
              ),
            ),
            const AppListTile(
              icon: Icons.home_outlined,
              title: "Home",
              link: "home",
            ),
            const AppListTile(
              icon: Icons.monitor_weight_outlined,
              title: "IMC",
              link: "imc",
              subTitle: "Índice de Massa Corporal",
            ),
            const Divider(),
            const AppListTile(
              icon: Icons.feed_outlined,
              title: "Sobre",
              link: "about",
            ),
          ],
        ),
      );
}
