import 'package:flutter/material.dart';
import 'package:patient/core/theme/theme.dart';

class _TherapistData {
  final String name;
  final String specialization;
  final List<String> tags;

  const _TherapistData({
    required this.name,
    required this.specialization,
    required this.tags,
  });
}

class FindTherapistScreen extends StatefulWidget {
  const FindTherapistScreen({super.key});

  @override
  State<FindTherapistScreen> createState() => _FindTherapistScreenState();
}

class _FindTherapistScreenState extends State<FindTherapistScreen> {
  String _selectedFilter = 'All';

  final List<_TherapistData> _therapists = const [
    _TherapistData(
      name: 'Dr. Priya Sharma',
      specialization: 'ASD Specialist',
      tags: ['ASD Specialist'],
    ),
    _TherapistData(
      name: 'Dr. Rahul Mehta',
      specialization: 'ADHD Specialist',
      tags: ['ADHD Specialist'],
    ),
    _TherapistData(
      name: 'Dr. Anita Nair',
      specialization: 'ASD & Learning Difficulties',
      tags: ['ASD Specialist'],
    ),
  ];

  final List<String> _filters = const ['All', 'ASD Specialist', 'ADHD Specialist'];

  List<_TherapistData> get _filteredTherapists {
    if (_selectedFilter == 'All') return _therapists;
    return _therapists.where((t) => t.tags.contains(_selectedFilter)).toList();
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
                'Find a Therapist',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Matched based on your assessment results',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Filter chips
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = _selectedFilter == filter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            filter,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.white : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Therapist list
              Expanded(
                child: ListView.separated(
                  itemCount: _filteredTherapists.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final therapist = _filteredTherapists[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.person, size: 28, color: Colors.white),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  therapist.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  therapist.specialization,
                                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Request sent to ${therapist.name}'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Request',
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
