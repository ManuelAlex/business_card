class PageRequest {
  // how many items per page

  const PageRequest({required this.page, required this.pageSize});
  final int page; // page number (starts at 0 or 1, up to you)
  final int pageSize;
}
