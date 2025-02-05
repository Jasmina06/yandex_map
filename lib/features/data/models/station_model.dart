import 'dart:math';

class Station {
  final String id;
  final String name;
  final String address;
  final List<Port> ports;
  final Point location;

  Station({
    required this.id,
    required this.name,
    required this.address,
    required this.ports,
    required this.location,
  });
}

class Port {
  final String name;
  final String status;

  Port({required this.name, required this.status});
}