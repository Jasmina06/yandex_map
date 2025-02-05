class AppLatLong {
 final double lat;
 final double long;

const AppLatLong({
   required this.lat,
   required this.long,
 });
}

class TashkentLocation extends AppLatLong {
 const TashkentLocation({
   super.long = 69.1145593,
   super.lat = 41.2824799,
 });
}