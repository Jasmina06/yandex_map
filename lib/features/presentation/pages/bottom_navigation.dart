import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
            const SizedBox(width: 73.39), // Отступ для FAB
            _buildNavItem(2, Icons.contact_support, "Связь"),
            _buildNavItem(3, Icons.person, "Профиль"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemSelected(index),
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
}
