import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/failure.dart';
import '../../domain/entities/business.dart';
import '../providers/provider.dart';
import '../providers/provider_states/business_state.dart';
import '../widgets/business_list.dart';

class BusinessListScreen extends StatefulWidget {
  const BusinessListScreen({super.key});

  @override
  State<BusinessListScreen> createState() => _BusinessListScreenState();
}

class _BusinessListScreenState extends State<BusinessListScreen> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> _refresh() async {
    await Provider.of<BusinessProvider>(
      context,
      listen: false,
    ).loadBusinesses(forceRefresh: true);
  }

  void _onSearchChanged(String query) {
    final BusinessProvider provider = Provider.of<BusinessProvider>(
      context,
      listen: false,
    );
    if (query.isEmpty) {
      provider.loadBusinesses();
    } else {
      provider.searchBusinesses(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BusinessProvider provider = Provider.of<BusinessProvider>(context);
    final BusinessState state = provider.state;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search businesses...',
            border: InputBorder.none,
          ),
          onChanged: _onSearchChanged,
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refresh),
        ],
      ),
      body: switch (state) {
        BusinessLoading() => const Center(child: CircularProgressIndicator()),
        BusinessError(:final Failure failure) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Error: ${failure.message}'),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _refresh, child: const Text('Retry')),
            ],
          ),
        ),
        BusinessData(:final Iterable<Business> businesses) => RefreshIndicator(
          onRefresh: _refresh,
          child: BusinessList(businesses: businesses.toList()),
        ),
        BusinessEmpty(:final Iterable<Business> businesses) => RefreshIndicator(
          onRefresh: _refresh,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 64),
              const Center(child: Text('No businesses available')),
              ...businesses.map((Business b) => ListTile(title: Text(b.name))),
            ],
          ),
        ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
