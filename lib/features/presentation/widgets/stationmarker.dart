import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class StationMarker {

  static List<Point> generateChargingStations() {
    final random = Random();
    return List.generate(
      20,
      (index) => Point(
        latitude: 41.280 + random.nextDouble() * 0.05,
        longitude: 69.110 + random.nextDouble() * 0.05,
      ),
    );
  }

  static Future<void> addAllChargingStations(
    List<Point> allChargingStations,
    List<MapObject> mapObjects,
    BuildContext context,
    void Function({
      required BuildContext context,
      required String stationName,
      required String stationAddress,
      required List<Map<String, String>> ports,
    }) showStationDetails,
    VoidCallback updateUI,
  ) async {
    final customIcon = await _createCustomIcon();

    for (int i = 0; i < allChargingStations.length; i++) {
      mapObjects.add(
        PlacemarkMapObject(
          mapId: MapObjectId('charging_station_$i'),
          point: allChargingStations[i],
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              image: BitmapDescriptor.fromBytes(customIcon),
              scale: 1.2,
            ),
          ),
          onTap: (PlacemarkMapObject self, Point point) {
            showStationDetails(
              context: context,
              stationName: 'Станция ${i + 1}',
              stationAddress: 'Улица Мирзо Улугбека, Ташкент',
              ports: [
                {'name': 'A порт', 'status': 'Свободен'},
                {'name': 'B порт', 'status': 'Свободен'},
              ],
            );
          },
        ),
      );
    }

    updateUI(); // ✅ Обновляем UI после добавления станций
  }

  static Future<Uint8List> _createCustomIcon() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(100, 100);

    final gradient = const LinearGradient(
      colors: [
        Color(0xFFB7FCEB),
        Color(0xFFB0C7EE),
        Color(0xFF9A22F9),
      ],
      stops: [0.1685, 0.4402, 0.8517],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final paint = Paint()..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    final image = await _loadAssetImage('assets/images/charging.png');
    if (image != null) {
      const imageSize = 50.0;
      canvas.drawImageRect(
        image,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        Rect.fromLTWH(25, 25, imageSize, imageSize),
        Paint(),
      );
    }

    final picture = recorder.endRecording();
    final img = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  /// ✅ Загрузка изображения из assets
  static Future<ui.Image?> _loadAssetImage(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final codec = await ui.instantiateImageCodec(byteData.buffer.asUint8List());
      final frame = await codec.getNextFrame();
      return frame.image;
    } catch (e) {
      debugPrint('Ошибка загрузки изображения: $e');
      return null;
    }
  }
}