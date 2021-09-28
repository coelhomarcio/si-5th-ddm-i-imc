import "package:flutter/material.dart";
import "dart:math";

import "package:imc/app/global/global.dart" as app;

class AppIMCForm extends StatefulWidget {
  const AppIMCForm({Key? key}) : super(key: key);

  @override
  _AppIMCFormState createState() => _AppIMCFormState();
}

class _AppIMCFormState extends State<AppIMCForm> {
  final _formKey = GlobalKey<FormState>();
  double _weight = 0;
  double _height = 0;
  double _imc = 0;
  bool _validate = false;

  Widget appTextFormField({
    required String field,
  }) {
    String? _labelText;
    double _maxValue = 0;
    String? _invalidText;
    if (field == "weight") {
      _labelText = "Peso (Kg)";
      _maxValue = 270;
      _invalidText = "0,01 até 270Kg";
    } else if (field == "height") {
      _labelText = "Altura (m)";
      _maxValue = 2.7;
      _invalidText = "0,01 até 2,70m";
    }

    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: _labelText,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) return "Campo obrigatório!";
            value = value.replaceAll(",", ".");
            double? _value = double.tryParse(value);
            if (_value == null) return "Digite apenas números!";
            if (_value <= 0 || _value > _maxValue) return _invalidText;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (value) {
            value = value!.replaceAll(",", ".");
            if (field == "weight") _weight = double.tryParse(value)!;
            if (field == "height") _height = double.tryParse(value)!;
          },
        ),
      ),
    );
  }

  Widget appElevatedButton({
    required String buttonLabel,
  }) =>
      ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(12),
          ),
        ),
        onPressed: () {
          if (!_validate) {
            if (_formKey.currentState!.validate()) {
              setState(() {
                _validate = true;
              });
              FocusScope.of(context).unfocus();
              _formKey.currentState!.save();
              _formKey.currentState!.reset();
            }
          } else
            setState(() {
              _validate = false;
            });
        },
        child: app.text(string: buttonLabel, isSubTitle: true),
      );

  Widget appIMC() {
    _imc = _weight / pow(_height, 2);
    String _resultTitle = "IMC = "
        "${_imc.toStringAsFixed(2).replaceAll(".", ",")}";
    String _resultParagraph = "Peso: "
        "${_weight.toStringAsFixed(2).replaceAll(".", ",")}Kg\nAltura: "
        "${_height.toStringAsFixed(2).replaceAll(".", ",")}m\n\n";
    if (_imc < 18.5)
      _resultParagraph += "Baixo peso!\n\n         Nesse ponto, o corpo magro "
          "deixa de ser saudável e o organismo fica mais vulnerável a "
          "infecções.";
    else if (_imc >= 18.5 && _imc < 25)
      _resultParagraph += "Peso ideal!\n\n         O peso está adequado à "
          "altura. É importante manter a educação alimentar e a atividade "
          "física.";
    else if (_imc >= 25 && _imc < 30)
      _resultParagraph += "Sobrepeso!\n\n         Esta faixa indica a "
          "possibilidade de predisposição à obesidade.";
    else if (_imc >= 30 && _imc < 35)
      _resultParagraph += "Obesidade Grau 1!\n\n         O risco de "
          "desenvolver diabetes, é de 20%, e o de hipertensão ultrapassa 25%. "
          "Há risco maior de outras doenças cardiovasculares, articulares, "
          "entre outras.";
    else if (_imc >= 35 && _imc < 40)
      _resultParagraph += "Obesidade Grau 2!\n\n         O risco de "
          "desenvolver diabetes chega a 40%, e a chance de surgirem doenças "
          "associadas à obesidade, pode chegar a 50%. Procure orientação "
          "médica.";
    else if (_imc >= 40)
      _resultParagraph += "Obesidade Grau 3!\n\n         O risco de "
          "desenvolver doenças associadas ao excesso de peso, como diabetes, "
          "reumatismos, hipertensão e outros problemas cardiovasculares chega "
          "a até 90%. Procure orientação médica imediatamente.";
    return Column(
      children: [
        app.text(string: _resultTitle, isTitle: true),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: app.text(string: _resultParagraph),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_validate)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  appTextFormField(field: "weight"),
                  appTextFormField(field: "height"),
                  appElevatedButton(buttonLabel: "Calcular"),
                ],
              ),
            ),
          ),
        if (_validate)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                appIMC(),
                appElevatedButton(buttonLabel: "Voltar"),
              ],
            ),
          ),
      ],
    );
  }
}
