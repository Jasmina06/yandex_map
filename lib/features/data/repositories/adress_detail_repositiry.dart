import 'package:dio/dio.dart';
import 'package:map_yandex1/features/data/models/address_detailmodel.dart';
import 'package:map_yandex1/features/data/models/app.lat_long.dart';


class AddressDetailRepository {
  Future<AddressDetailModel?> getAddressDetail(AppLatLong latLong) async {
    String mapApiKey = "Cc569340-9587-47a2-8f66-f030205e2692";
    try {
      // Создаем словарь с параметрами запроса
      Map<String, String> queryParams = {
        'apikey': mapApiKey,
        'geocode': "${latLong.long},${latLong.lat}",
        'lang': 'uz',
        'format': 'json',
        'results': '1'
      };
      Dio yandexDio = Dio();
      var response = await yandexDio.get(
          "https://geocode-maps.yandex.ru/1.x/",
          queryParameters: queryParams
      );
      return AddressDetailModel.fromJson(response.data);
    } catch (e) {
      print("Error $e");
      return null;
    }
  }
}
