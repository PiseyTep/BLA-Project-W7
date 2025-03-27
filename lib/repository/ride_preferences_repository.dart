import '../model/ride/ride_pref.dart';

abstract class RidePreferencesRepository {
  // List<RidePreference> getPastPreferences();

  // void addPreference(RidePreference preference);
  Future<List<RidePreference>> getPastPreferences();

  Future<void> addPreference(RidePreference preference);
}
