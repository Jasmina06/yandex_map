class AddressDetailModel {
  final String address;
  final double latitude;
  final double longitude;

  AddressDetailModel({required this.address, required this.latitude, required this.longitude});

  factory AddressDetailModel.fromJson(Map<String, dynamic> json) {
    var geoObject = json['response']['GeoObjectCollection']['featureMember'][0]['GeoObject'];
    var point = geoObject['Point']['pos'].split(" ");
    return AddressDetailModel(
      address: geoObject['metaDataProperty']['GeocoderMetaData']['text'],
      longitude: double.parse(point[0]),
      latitude: double.parse(point[1]),
    );
  }
}
