import 'package:flutter/material.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:patient/presentation/auth/auth_screen.dart';
import 'widgets/profile_option.dart'; 

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PatientDbEntity? _patientInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final patientList = await localDb.select(localDb.patients).get();
    setState(() {
      if (patientList.isNotEmpty) {
        _patientInfo = patientList.first;
      }
      _isLoading = false;
    });
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final name = _patientInfo?.patientName ?? "Patient";
    final email = _patientInfo?.email ?? "No Email Provided";
    final phone = _patientInfo?.phoneNo ?? "No Phone";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EAF5),
                  borderRadius: BorderRadius.circular(20),
                ),
                constraints: const BoxConstraints(minHeight: 160),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueAccent.shade100,
                      child: const Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            email,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            phone,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProfileOption(title: "About Us"),
                      const ProfileOption(title: "Terms & Conditions"),
                      const ProfileOption(title: "Privacy Policy"),
                      const ProfileOption(title: "Contact Admin"),
                      ProfileOption(
                        title: "Log Out", 
                        isLogout: true,
                        onTap: _logout,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
