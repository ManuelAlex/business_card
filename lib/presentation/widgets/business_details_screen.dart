import 'package:flutter/material.dart';
import '../../domain/entities/business.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key, required this.business});

  final Business business;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(business.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailsRow(
              icon: Icons.business,
              label: 'Name',
              value: business.name,
            ),
            const SizedBox(height: 12),
            _DetailsRow(
              icon: Icons.location_on,
              label: 'Location',
              value: business.location,
            ),
            const SizedBox(height: 12),
            _DetailsRow(
              icon: Icons.phone,
              label: 'Phone',
              value: business.phoneNumber,
            ),
            const SizedBox(height: 12),
            _DetailsRow(
              icon: Icons.access_time,
              label: 'Added On',
              value: '${business.timestamp.toLocal()}'.split(' ')[0],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsRow extends StatelessWidget {
  const _DetailsRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24, color: Colors.deepPurple),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
