import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';
import '../providers/provider_states/business_state.dart';
import '../widgets/business_list.dart';

class BusinessListScreen extends StatefulWidget {
  const BusinessListScreen({super.key});

  @override
  State<BusinessListScreen> createState() => _BusinessListScreenState();
}

class _BusinessListScreenState extends State<BusinessListScreen> {
  Future<void> _refresh() async {
    await Provider.of<BusinessProvider>(
      context,
      listen: false,
    ).loadBusinesses(forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final BusinessProvider provider = Provider.of<BusinessProvider>(context);
    final BusinessState state = provider.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Businesses'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refresh),
        ],
      ),
      body: switch (state) {
        BusinessLoading() => const Center(child: CircularProgressIndicator()),
        BusinessError(:final failure) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: ${failure.message}'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _refresh, child: const Text('Retry')),
            ],
          ),
        ),
        BusinessData(:final businesses) => RefreshIndicator(
          onRefresh: _refresh,
          child: BusinessList(businesses: businesses.toList()),
        ),
        BusinessEmpty(:final businesses) => RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            children: [
              const SizedBox(height: 64),
              const Center(child: Text('No businesses available')),
              ...businesses.map((b) => ListTile(title: Text(b.name))),
            ],
          ),
        ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
