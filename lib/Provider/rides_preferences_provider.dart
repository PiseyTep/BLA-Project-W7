import 'package:flutter/material.dart';
import '../model/ride/ride_pref.dart';
import '../provider/async_value.dart';
import '../repository/ride_preferences_repository.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  // List<RidePreference> _pastPreferences = [];

  late AsyncValue<List<RidePreference>> pastPreferences; //bla202
  final RidePreferencesRepository repository;

  // Constructor fetches past preferences
  RidesPreferencesProvider({required this.repository}) {
    // _pastPreferences = repository.getPastPreferences();
    fetchPastPreferences(); //bla202
  }

  // Public API
  RidePreference? get currentPreference => _currentPreference;
  // List<RidePreference> get preferencesHistory =>
  //     _pastPreferences.reversed.toList();//bla201
//------------------- Manages current search preference------------------
// -------------------Tracks history of past searches------------------
// -------------------Notifies UI when data changes------------------
  // Set a new ride preference
  void setCurrentPreference(RidePreference pref) {
    // if (_currentPreference == pref) return; // Step 1: Only process if different

    // _currentPreference = pref; // Step 2: Update current preference
    // _addPreference(pref); // Step 3: Add to history (if unique)

    // notifyListeners(); // Step 4: Notify listeners
    if (_currentPreference != pref) {
      //bla202
      _currentPreference = pref;
      _addPreference(pref);
      notifyListeners();
    }
  }

  // // Add preference to history only if it's not already in the list
  // void _addPreference(RidePreference preference) {
  //   if (!_pastPreferences.contains(preference)) {
  //     _pastPreferences.add(preference);
  //     repository.addPreference(preference); // Persist to repository
  //   }
  // }
  //bla201
  /// Fetches past ride preferences from the repository
  Future<void> fetchPastPreferences() async {
    pastPreferences = AsyncValue.loading(); // Set loading state
    notifyListeners();

    try {
      List<RidePreference> pastPrefs =
          await repository.getPastPreferences(); // Fetch data from repository
      pastPreferences = AsyncValue.success(pastPrefs); // Store successful data
    } catch (error) {
      pastPreferences = AsyncValue.error(error); // Handle errors
    }
    notifyListeners();
  }

  /// Adds a new ride preference to the repository and updates past preferences
  Future<void> _addPreference(RidePreference preference) async {
    await repository.addPreference(preference);
    fetchPastPreferences(); // Fetch updated list of past preferences (ensuring sync with stored data)
  }

  /// Returns the list of past ride preferences, or an empty list if data isn't available
  List<RidePreference> get preferencesHistory => pastPreferences.data ?? [];
}
