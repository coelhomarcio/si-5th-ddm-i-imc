import "package:flutter/material.dart";

class AppListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String link;
  final String subTitle;

  const AppListTile(
    this.icon,
    this.title,
    this.link, {
    Key? key,
    this.subTitle = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(title.toUpperCase(),
                style: const TextStyle(color: Colors.white, letterSpacing: 2)),
          ),
        ],
      ),
      subtitle: subTitle != ""
          ? Text(subTitle, style: const TextStyle(color: Colors.white))
          : null,
      onTap: () {
        if (link != ModalRoute.of(context)!.settings.name)
          Navigator.pushReplacementNamed(context, link);
        else
          Future.delayed(const Duration(milliseconds: 100),
              () => Scaffold.of(context).openEndDrawer());
      },
      selected: link == ModalRoute.of(context)!.settings.name,
      selectedTileColor: const Color(0xFF1EA1D9),
    );
  }
}
