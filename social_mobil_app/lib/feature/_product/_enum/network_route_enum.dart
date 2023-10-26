

enum NetworkRoutes {

  // ignore: constant_identifier_names
  LOGIN,
  // ignore: constant_identifier_names
  REGISTER,

}

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'api/Auth/login';
      case NetworkRoutes.REGISTER:
        return 'api/Auth/register';
     
      default:
        throw Exception('Routes Not FouND');
    }
  }
}
