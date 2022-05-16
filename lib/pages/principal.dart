import 'package:clima_app/controllers/clima_controller.dart';
import 'package:clima_app/models/clima.dart';
import 'package:clima_app/pages/cidade.dart';
import 'package:clima_app/pages/tela_carregamento.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Principal extends StatefulWidget {
  final Clima clima;
  const Principal({Key key, this.clima}) : super(key: key);
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  ClimaController climaController;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.location_searching),
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaCarregamento(pagina: 'atual'),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          widget.clima.cidade,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cidade(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Image.asset(
                  'assets/images/trovoada.png',
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 150,
                  child: Text(' ${widget.clima.temperatura} °C',
                      style: const TextStyle(fontSize: 25)),
                ),
              ),
            ],
          ),
          Container(
            height: 75,
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                    ' ${widget.clima.cidade} ${DateFormat('HH:mm').format(DateTime.now())}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                    ' ${DateFormat('EEEE, d MMM, yyyy', 'pt_br').format(DateTime.now())}',
                    style: const TextStyle(fontSize: 25)),
                Text('Temperatura ${widget.clima.temperatura} °C',
                    style: const TextStyle(fontSize: 20)),
                Text('Umidade ${widget.clima.umidade} %',
                    style: const TextStyle(fontSize: 20)),
                Text('Vento ${widget.clima.vento} Km/h',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
