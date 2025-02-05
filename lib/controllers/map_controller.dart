import 'dart:async';
import 'package:yandex_mapkit/yandex_mapkit.dart';


Future<void> moveToCurrentLocation(
  Completer<YandexMapController> controllerCompleter,
  Point target,
) async {
  final controller = await controllerCompleter.future;
  controller.moveCamera(
    CameraUpdate.newCameraPosition(CameraPosition(target: target, zoom: 14)),
  );
}
