import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            mapObjects: [], // Должен быть массив объектов карты
            onMapCreated: (controller) => {},
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        child: Container(
          height: 60.77,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Icons.map, "Карта"),
              _buildNavItem(1, Icons.history, "История"),
              const SizedBox(width: 73.39),
              _buildNavItem(2, Icons.contact_support, "Связь"),
              _buildNavItem(3, Icons.person, "Профиль"),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 64.21,
        height: 64.45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFB7FCEB), Color(0xFF9A22F9)],
            stops: [0.1685, 0.8517],
          ),
        ),
        child: FloatingActionButton(
          onPressed: () => _showChargingDetailsBottomSheet(context),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.directions_car, color: Colors.white, size: 30),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          widget.onItemSelected(index);
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF9D36F8) : Colors.grey,
            size: isSelected ? 28 : 24,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF9D36F8) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showChargingDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          // Содержимое модального окна для деталей зарядки
        );
      },
    );
  }
}
