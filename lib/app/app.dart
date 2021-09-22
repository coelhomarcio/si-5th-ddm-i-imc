import "package:flutter/material.dart";

import "package:imc/app/view/home_view.dart";
import "package:imc/app/view/i_m_c_view.dart";
import "package:imc/app/view/about_view.dart";

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Índice de Massa Corporal",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        fontFamily: "Montserrat",
      ),
      locale: const Locale("pt", "BR"),
      routes: {
        "home": (context) => const HomeView(),
        "imc": (context) => const IMCView(),
        "about": (context) => const AboutView(),
      },
      initialRoute: "home",
    );
  }
}
