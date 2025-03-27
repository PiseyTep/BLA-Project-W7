import '../location/locations.dart';

///
/// This model describes a ride preference.
/// A ride preference consists of the selection of a departure + arrival + a date and a number of passengers.
///
class RidePreference {
  final Location departure;
  final DateTime departureDate;
  final Location arrival;
  final int requestedSeats;

  const RidePreference({
    required this.departure,
    required this.departureDate,
    required this.arrival,
    required this.requestedSeats,
  });

  @override
  String toString() {
    return 'RidePref(departure: ${departure.name}, '
        'departureDate: ${departureDate.toIso8601String()}, '
        'arrival: ${arrival.name}, '
        'requestedSeats: $requestedSeats)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // Check for reference equality
    if (other is! RidePreference)
      return false; // Check if the other object is of the same type

    // Compare all properties for equality
    return departure == other.departure &&
        departureDate == other.departureDate &&
        arrival == other.arrival &&
        requestedSeats == other.requestedSeats;
  }

  @override
  int get hashCode {
    // Combine the hash codes of all properties
    return departure.hashCode ^
        departureDate.hashCode ^
        arrival.hashCode ^
        requestedSeats.hashCode;
  }
}
