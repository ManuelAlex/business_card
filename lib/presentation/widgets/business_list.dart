import 'package:flutter/material.dart';

import '../../domain/entities/business.dart';
import 'business_card.dart';
import 'business_details_screen.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({super.key, required this.businesses});
  final List<Business> businesses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      itemCount: businesses.length,
      itemBuilder: (BuildContext context, int index) {
        final Business business = businesses[index];
        return BusinessCard<Business>(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BusinessDetailsScreen(business: business),
              ),
            );
          },
          entity: business,
          builder: (Business b) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  b.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        b.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      b.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
