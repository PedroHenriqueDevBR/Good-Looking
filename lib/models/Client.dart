class Client {
  int id;
  String _name;
  String _address;
  String _phone;
  String _mail;

  Client(this._name, this._address, this._phone, this._mail);

  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

}