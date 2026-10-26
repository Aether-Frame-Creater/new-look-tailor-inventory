/// Every top-level destination, in bottom-navigation order.
enum AppRoute {
  dashboard('/', 'dashboard'),
  items('/items', 'items'),
  stock('/stock', 'stock'),
  reports('/reports', 'reports'),
  settings('/settings', 'settings');

  const AppRoute(this.path, this.name);

  final String path;
  final String name;
}
