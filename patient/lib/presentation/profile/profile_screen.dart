import 'package:flutter/material.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:patient/core/theme/theme.dart';
import 'package:patient/presentation/auth/auth_screen.dart';
import 'package:patient/presentation/profile/data_sync_screen.dart';
import 'dart:math';

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

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const AuthScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final name = _patientInfo?.patientName ?? 'Mohammed Mohsin';
    final email = _patientInfo?.email ?? 'mohsin@example.com';
    final phone = _patientInfo?.phoneNo ?? '+91 98765 43210';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 20),

                // User info card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2EAF5),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F2937),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
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
                const SizedBox(height: 20),

                // Subscription card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF97066),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Basic Pack',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '5000/- per Month',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: CustomPaint(
                          painter: _CircleProgressPainter(0.6),
                          child: const Center(
                            child: Text(
                              '60%\nUsed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Menu list
                _buildMenuItem('About Us', Icons.arrow_forward_ios, onTap: () {}),
                _buildMenuItem('Terms & Conditions', Icons.arrow_forward_ios, onTap: () {}),
                _buildMenuItem('Privacy Policy', Icons.arrow_forward_ios, onTap: () {}),
                _buildMenuItem('Contact Support', Icons.arrow_forward_ios, onTap: () {}),
                _buildMenuItem(
                  'Export Data',
                  Icons.download_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DataSyncScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  'Import Data',
                  Icons.upload_rounded,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DataSyncScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  'Log Out',
                  null,
                  isLogout: true,
                  onTap: _confirmLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData? trailingIcon, {
    bool isLogout = false,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isLogout ? FontWeight.bold : FontWeight.w500,
              color: isLogout ? Colors.red : Colors.black87,
            ),
          ),
          trailing: trailingIcon != null
              ? Icon(trailingIcon, size: 18, color: Colors.grey)
              : null,
        ),
        if (!isLogout) Divider(height: 1, color: Colors.grey.shade200),
      ],
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;
  _CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawCircle(center, radius, bgPaint);

    // Progress arc
    final fgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
