enum NavigationRoute {
  loginRoute("/login"),
  registerRoute("/register"),
  homeRoute("/home"),
  detailRoute("/detail");

  const NavigationRoute(this.name);
  final String name;
}