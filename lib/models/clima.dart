class Clima {
  final String cidade;
  final num condicao;
  final num temperadura;
  final num vento;
  final num umidade;

  Clima(
      {required this.cidade,
      required this.condicao,
      required this.temperadura,
      required this.vento,
      required this.umidade});

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      cidade: json['name'],
      condicao: json['weather'][0]['id'],
      temperadura: json['main']['temp'],
      vento: json['wind']['speed'],
      umidade: json['main']['humidity'],
    );
  }
}
