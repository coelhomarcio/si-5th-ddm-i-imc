import "package:flutter/material.dart";

import "package:imc/app/global/global.dart" as app;
import "package:imc/app/widget/app_drawer.dart";

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _title = "Sobre";
    const String _subTitle = "Informações sobre o aplicativo";
    const List<String> _paragraphs = [
      "Framework\nFlutter\n",
      "Linguagem\nDart\n",
      "Desenvolvedores\nLucca Costa\nMarcio Coelho\nVicthória Nunes",
    ];

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: app.text(string: _title, isTitle: true),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          app.text(string: _subTitle, isSubTitle: true),
          const Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Divider(
              color: app.primaryColor,
            ),
          ),
          for (var _paragraph in _paragraphs) app.text(string: _paragraph),
        ],
      ),
    );
  }
}
