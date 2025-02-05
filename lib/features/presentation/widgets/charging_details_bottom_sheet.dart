import 'package:flutter/material.dart';

class ChargingDetailsBottomSheet extends StatelessWidget {
  final String stationName;
  final String stationAddress;

  const ChargingDetailsBottomSheet({
    Key? key,
    required this.stationName,
    required this.stationAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Название станции
          Text(
            stationName, // ✅ Теперь используется переданное имя
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          // Адрес станции
          Text(
            stationAddress, // ✅ Теперь используется переданный адрес
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          // Блок с характеристиками
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric('18.50 КВт', 'Скорость', Icons.flash_on),
                _buildMetric('3107.00 КВт', 'Потраченные', Icons.energy_savings_leaf),
                _buildMetric('6 524 700 сум', 'Стоимость', Icons.money),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Прогресс зарядки
          Center(
            child: Column(
              children: [
                const Text(
                  '10 мин время зарядки',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 16),
                _buildChargingProgress(53), // Передаем процент заряда
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Кнопка "Прекратить зарядку"
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Прекратить зарядку',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Виджет характеристики зарядки
  Widget _buildMetric(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // Виджет прогресса зарядки
  Widget _buildChargingProgress(int percent) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Контейнер фона
        Container(
          width: 120,
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
        ),
        // Контейнер с градиентом (динамическая высота)
        Container(
          width: 120,
          height: (240 * percent / 100).toDouble(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF9A22F9), Color(0xFFB7FCEB)],
            ),
          ),
        ),
        // Текст с процентами
        Positioned(
          top: 90,
          child: Text(
            '$percent%',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
