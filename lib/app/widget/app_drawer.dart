import "package:flutter/material.dart";

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage("assets/img/imc.png"),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 12,
                  left: 16,
                  child: Text(
                    "Menu".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.home_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Home"),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, "home");
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.monitor_weight_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("IMC"),
                ),
              ],
            ),
            subtitle: const Text("Índice de Massa Corporal"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "imc");
            },
          ),
          const Divider(),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.feed_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("Sobre"),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, "about");
            },
          ),
        ],
      ),
    );
  }
}
