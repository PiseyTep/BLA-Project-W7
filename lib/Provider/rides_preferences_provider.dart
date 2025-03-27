import 'package:flutter/material.dart';
import '../model/ride/ride_pref.dart';
import '../repository/ride_preferences_repository.dart';

class RidesPreferencesProvider extends ChangeNotifier {
  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];
  final RidePreferencesRepository repository;

  // Constructor fetches past preferences
  RidesPreferencesProvider({required this.repository}) {
    _pastPreferences = repository.getPastPreferences();
  }

  // Public API
  RidePreference? get currentPreference => _currentPreference;
  List<RidePreference> get preferencesHistory =>
      _pastPreferences.reversed.toList();
//------------------- Manages current search preference------------------
// -------------------Tracks history of past searches------------------
// -------------------Notifies UI when data changes------------------
  // Set a new ride preference
  void setCurrentPreference(RidePreference pref) {
    if (_currentPreference == pref) return; // Step 1: Only process if different

    _currentPreference = pref; // Step 2: Update current preference
    _addPreference(pref); // Step 3: Add to history (if unique)

    notifyListeners(); // Step 4: Notify listeners
  }

  // Add preference to history only if it's not already in the list
  void _addPreference(RidePreference preference) {
    if (!_pastPreferences.contains(preference)) {
      _pastPreferences.add(preference);
      repository.addPreference(preference); // Persist to repository
    }
  }
}
