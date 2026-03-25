import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final bool isLogout;
  final VoidCallback? onTap;

  const ProfileOption({
    super.key,
    required this.title,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isLogout ? FontWeight.bold : FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      trailing: isLogout 
          ? null 
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
