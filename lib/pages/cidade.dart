import 'package:clima_app/pages/tela_carregamento.dart';
import 'package:flutter/material.dart';

class Cidade extends StatefulWidget {
  const Cidade({ Key key }) : super(key: key);

  @override
  State<Cidade> createState() => _CidadeState();
}

class _CidadeState extends State<Cidade> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _valido = false;

  @override
  void initState() {
    super.initState();
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pesquisar Clima',
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            focusNode: _focus,
            controller: _controller,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red), 
              errorText: _valido ? 'Cidade está em branco' : null,
              suffixIcon: FocusScope.of(context).hasFocus
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _controller.clear();
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : const Icon(Icons.search),
            ),
            onSubmitted: (value) {
              if (_controller.text.isEmpty) {
                _valido = true;
                FocusScope.of(context).unfocus();
              } else {
                _valido = false;
                FocusScope.of(context).unfocus();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaCarregamento(
                      pagina: 'cidade',
                      cidade: value,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      );
  }
}