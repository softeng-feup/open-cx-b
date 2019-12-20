class AppState {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;

  int userid = 0;

  AppState._internal();
}
