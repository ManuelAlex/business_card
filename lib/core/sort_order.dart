enum SortDirection { ascending, descending }

class SortOrder {
  const SortOrder(this.field, [this.direction = SortDirection.ascending]);
  final String field; // e.g. "name" or "timestamp"
  final SortDirection direction;
}
