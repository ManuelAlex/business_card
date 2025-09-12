import 'package:flutter/material.dart';

typedef EntityWidgetBuilder<T> = Widget Function(T entity);

class BusinessCard<T> extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.entity,
    required this.builder,
    required this.onTap,
  });

  final T entity;
  final EntityWidgetBuilder<T> builder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: builder(entity),
        ),
      ),
    );
  }
}
