import "package:flutter/material.dart";
import "package:imc/app/widget/app_drawer.dart";

class IMCView extends StatelessWidget {
  const IMCView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Índice de Massa Corporal", textAlign: TextAlign.center),
      ),
      body: const Center(child: Text("IMCView")),
    );
  }
}
