// ignore: import_of_legacy_library_into_null_safe
import 'package:geolocator/geolocator.dart';

class Localizacao {
  late double latitude;
  late double longitude;

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
