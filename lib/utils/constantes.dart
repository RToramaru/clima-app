const String _urlBase = 'https://api.openweathermap.org/data/2.5/weather';

const String _apiChave = '62ba3d3b693fb1c4d64189695068670e';

String getLocalizacao(double latitude, double longitude){
  return '$_urlBase?lat=$latitude&lon=$longitude&appid=$_apiChave&units=metric';
}

String getCidade(String cidade){
  return '$_urlBase?q=$cidade&appid=$_apiChave&units=metric';
}

