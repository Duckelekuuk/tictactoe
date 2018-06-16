abstract class CustomExceptionBase implements Exception {
  final String _info;
  final String _name;

  CustomExceptionBase(this._name, [this._info]);

  @override
  String toString() {
    if(_info != null) return "$_name: $_info";
    return "$_name";
  }
}

class FieldAlreadyFilledException extends CustomExceptionBase {
  FieldAlreadyFilledException([String info]) : super("FieldAlreadyFilledException", info);
}

class InvalidFieldException extends CustomExceptionBase {
  InvalidFieldException([String info]) : super("InvalidFieldException", info);
}
