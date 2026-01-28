extension BooleanExtensions on bool {
  String get toDisplayAsNetworkStatus => this ? 'Online' : 'Offline';
}
