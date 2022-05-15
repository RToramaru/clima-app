import 'package:clima_app/controllers/clima_controller.dart';
import 'package:clima_app/models/clima.dart';
import 'package:clima_app/pages/principal.dart';
import 'package:flutter/material.dart';

class TelaCarregamento extends StatefulWidget {
  final String pagina;
  final String cidade;
  // ignore: use_key_in_widget_constructors
  const TelaCarregamento({ @required this.pagina,
    this.cidade,});
  @override
  State<TelaCarregamento> createState() => _TelaCarregamentoState();
}

class _TelaCarregamentoState extends State<TelaCarregamento> {
  ClimaController climaController = ClimaController();
  Clima clima;

  @override
  void initState() {
    // If connection is available then load weather
    // Otherwise loading 404 page
    getClimaAtual();
    super.initState();
  }

    void getClimaAtual() async {
    if (widget.pagina == 'atual') {
      clima = await climaController.getClimaLocalizacao();
    } else if (widget.pagina == 'cidade') {
      if (widget.cidade != null) {
        clima = await climaController.getClimaCidade(widget.cidade);
      } else {
        clima = await climaController.getClimaLocalizacao();
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Principal(
          clima: clima,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}