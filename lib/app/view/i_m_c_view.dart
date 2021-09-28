import "package:flutter/material.dart";

import "package:imc/app/global/global.dart" as app;
import "package:imc/app/widget/app_drawer.dart";
import "package:imc/app/widget/app_i_m_c_form.dart";

class IMCView extends StatelessWidget {
  const IMCView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _title = "IMC";
    const String _subTitle = "Índice de Massa Corporal";
    const String _paragraph = "Calculadora";

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
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Divider(
                color: app.primaryColor,
              ),
            ),
            const AppIMCForm(),
          ],
        ),
      ),
    );
  }
}
