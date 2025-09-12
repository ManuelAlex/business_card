import 'package:flutter/material.dart';

typedef EntityWidgetBuilder<T> = Widget Function(T entity);

class BusinessCard<T> extends StatelessWidget {
  const BusinessCard({super.key, required this.entity, required this.builder});

  final T entity;
  final EntityWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: const EdgeInsets.all(16), child: builder(entity)),
    );
  }
}
