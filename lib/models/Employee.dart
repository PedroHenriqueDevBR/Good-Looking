class Employee {
  int ind;
  String _name;
  String _phone;
  String _mail;
  double _percent_commission;

  Employee(this._name, this._phone, this._mail, this._percent_commission);

  double get percent_commission => _percent_commission;

  set percent_commission(double value) {
    _percent_commission = value;
  }

  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}