import 'package:flutter/material.dart';

class TherapistProvider with ChangeNotifier {
  List<Map<String, dynamic>> _therapists = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get therapists => _therapists;
  bool get isLoading => _isLoading;

  Future<void> fetchTherapists() async {
    _isLoading = true;
    notifyListeners();
    // Stub
    _therapists = [];
    _isLoading = false;
    notifyListeners();
  }

  Future<void> bookAppointment(BuildContext context, Map<String, dynamic> therapist, String patientId) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Appointment"),
        content: Text("Are you sure you want to book an appointment with ${therapist["name"]}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Confirm")),
        ],
      ),
    );

    if (!confirm) return;

    _isLoading = true;
    notifyListeners();
    // Stub
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Appointment booked successfully!"))
    );
    _isLoading = false;
    notifyListeners();
  }
}
