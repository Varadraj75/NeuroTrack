import 'package:flutter/material.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:intl/intl.dart';

class DataSyncScreen extends StatefulWidget {
  const DataSyncScreen({super.key});

  @override
  State<DataSyncScreen> createState() => _DataSyncScreenState();
}

class _DataSyncScreenState extends State<DataSyncScreen> {
  final String _lastSyncTime = DateFormat('hh:mm a').format(DateTime.now());

  void _showComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feature coming soon'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _confirmClearCache() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear Local Cache'),
        content: const Text('Are you sure? This will delete all local data.'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await localDb.delete(localDb.consultationRequests).go();
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cache cleared successfully'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Confirm', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              const Text(
                'Data Sync',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Manage your local data',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Sync status card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Synced',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last synced: Today, $_lastSyncTime',
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Storage section
              const Text(
                'Storage',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 12),
              _buildInfoRow('Local Data', '2.4 MB'),
              const Divider(height: 1),
              _buildInfoRow('Pending Changes', '0 items'),
              const SizedBox(height: 28),

              // Actions section
              const Text(
                'Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 12),
              _buildActionRow(
                'Export Data',
                Icons.download_rounded,
                Colors.black87,
                _showComingSoon,
              ),
              const Divider(height: 1),
              _buildActionRow(
                'Import Data',
                Icons.upload_rounded,
                Colors.black87,
                _showComingSoon,
              ),
              const Divider(height: 1),
              _buildActionRow(
                'Clear Local Cache',
                Icons.delete_outline,
                Colors.red,
                _confirmClearCache,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(String label, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 15, color: color),
            ),
            Icon(icon, size: 22, color: color),
          ],
        ),
      ),
    );
  }
}
