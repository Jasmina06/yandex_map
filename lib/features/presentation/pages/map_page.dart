import 'dart:async';
import 'package:flutter/material.dart';
import 'package:map_yandex1/controllers/map_controller.dart' as mapController;
import 'package:map_yandex1/features/presentation/pages/profile_page.dart';
import 'package:map_yandex1/features/presentation/widgets/charging_details_bottom_sheet.dart';
import 'package:map_yandex1/features/presentation/widgets/stationmarker.dart';
import 'package:map_yandex1/features/presentation/widgets/show_station_detail.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'bottom_navigation.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapObjects = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    final stations = StationMarker.generateChargingStations();

    await mapController.moveToCurrentLocation(
      mapControllerCompleter,
      const Point(latitude: 41.2824799, longitude: 69.1145593),
    );

    await StationMarker.addAllChargingStations(
      stations,
      mapObjects,
      context,
      _showStationDetails,
          () => setState(() {}),
    );
  }

  /// ✅ Показывает `StationDetails` при нажатии на значок зарядки
  void _showStationDetails({
    required BuildContext context,
    required String stationName,
    required String stationAddress,
    required List<Map<String, String>> ports,
  }) {
    StationDetails.show(
      context: context,
      stationName: stationName,
      stationAddress: stationAddress,
      ports: ports,
    );
  }

  /// ✅ Открывает `ChargingDetailsBottomSheet` при нажатии на кнопку "Машина"
  void _showChargingDetailsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const ChargingDetailsBottomSheet(
        stationName: 'Станция 1',
        stationAddress: 'Улица Мирзо Улугбека, Ташкент',
      ),
    );
  }

  /// ✅ Переход на `ProfileScreen` при нажатии на иконку профиля
  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            mapObjects: mapObjects,
            onMapCreated: (controller) => mapControllerCompleter.complete(controller),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;

            // ✅ Проверяем, если нажат профиль (например, 3-й элемент)
            if (index == 3) {
              _navigateToProfile();
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB7FCEB),
              Color(0xFFB0C7EE),
              Color(0xFF9A22F9),
            ],
            stops: [0.1685, 0.4402, 0.8517],
          ),
        ),
        child: FloatingActionButton(
          onPressed: _showChargingDetailsBottomSheet, // ✅ Открывает `ChargingDetailsBottomSheet`
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.directions_car, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
