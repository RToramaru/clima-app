import 'package:geolocator/geolocator.dart';

class Localizacao {
   double latitude;
   double longitude;

  Future<void> getLocalizacaoAtual() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // ignore: avoid_print
      print('Erro $e');
    }
  }
}
