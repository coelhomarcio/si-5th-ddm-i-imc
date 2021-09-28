import "package:flutter/material.dart";

import "package:imc/app/global/global.dart" as app;
import "package:imc/app/widget/app_drawer.dart";

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _title = "Home";
    const String _subTitle = "Cálculo de Índice de Massa Corpórea";
    const String _paragraph = "         App desenvolvido para calcular o IMC, "
        "fornecendo sugestões para uma vida mais saudável.";

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: app.text(string: _title, isTitle: true),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            app.text(string: _subTitle, isSubTitle: true),
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Divider(
                color: app.primaryColor,
              ),
            ),
            app.text(string: _paragraph),
          ],
        ),
      ),
    );
  }
}
