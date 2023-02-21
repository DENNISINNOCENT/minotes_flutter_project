//login exception

class UserNotFoundAuthException implements Exception {}
class WrongPasswordAuthException implements Exception {}
 //register exceptions
 class WeakPasswordAuthAuthException implements Exception {}
 class EmailAlreadyInUseAuthException implements Exception {}
 class InvalidEmailAuthException implements Exception {}

 //GENERIC EXCEPTIONS
 class GenericAuthException implements Exception {}

 class UserNotLoggedInAuthException implements Exception {}