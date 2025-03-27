import '../../model/ride/ride_pref.dart';
import '../ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

//class MockRidePreferencesRepository extends RidePreferencesRepository {//bla200
class MockRidePreferencesRepository implements RidePreferencesRepository {
  //bla202
  final List<RidePreference> _pastPreferences = fakeRidePrefs;

  @override
  //List<RidePreference> getPastPreferences() {//bla201
  Future<List<RidePreference>> getPastPreferences() async {
    //bla200
    await Future.delayed(const Duration(seconds: 2));
    return _pastPreferences;
  }

  @override
  //void addPreference(RidePreference preference) {
  Future<void> addPreference(RidePreference preference) async {
    //bla202
    await Future.delayed(const Duration(seconds: 2));
    _pastPreferences.add(preference);
  }
}
