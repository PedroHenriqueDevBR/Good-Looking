class Service {
  int id;
  String _name;
  String _description;
  double _price;
  double _cost_for_service;

  Service(this._name, this._description, this._price, this._cost_for_service);

  double get cost_for_service => _cost_for_service;

  set cost_for_service(double value) {
    _cost_for_service = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

}