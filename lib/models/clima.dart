class Clima {
  final String cidade;
  final num condicao;
  final num temperatura;
  final num vento;
  final num umidade;

  Clima(
      { this.cidade,
       this.condicao,
       this.temperatura,
       this.vento,
       this.umidade});

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      cidade: json['name'],
      condicao: json['weather'][0]['id'],
      temperatura: json['main']['temp'],
      vento: json['wind']['speed'],
      umidade: json['main']['humidity'],
    );
  }
}
