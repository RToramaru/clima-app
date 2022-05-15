import 'package:clima_app/helpers/api_helper.dart';
import 'package:clima_app/models/clima.dart';
import 'package:clima_app/models/localizacao.dart';
import 'package:clima_app/utils/constantes.dart';

class ClimaController {
  ApiHelper _api(String url) {
    return ApiHelper(url);
  }

  Future<dynamic> getClimaLocalizacao() async {
    Localizacao localizacaoAtual = Localizacao();
    await localizacaoAtual.getLocalizacaoAtual();

    var result = await _api(
      getLocalizacao(
        localizacaoAtual.latitude,
        localizacaoAtual.longitude,
      ),
    ).getDados();

    return Clima.fromJson(result);
  }

  Future<dynamic> getClimaCidade(String cidade) async {
    var result = await _api(
      getCidade(
        cidade,
      ),
    ).getDados();

    return Clima.fromJson(result);
  }
}
