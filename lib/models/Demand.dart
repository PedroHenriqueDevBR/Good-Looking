class Demand {
  int id;
  String _date_created;
  String _date_service;
  String _hour_service;
  String _client;
  String _employee;
  List<String> _services;


  Demand(this._date_created, this._date_service, this._hour_service,
      this._client, this._employee, this._services);

  String get date_created => _date_created;

  set date_created(String value) {
    _date_created = value;
  }

  String get date_service => _date_service;

  List<String> get services => _services;

  set services(List<String> value) {
    _services = value;
  }

  String get employee => _employee;

  set employee(String value) {
    _employee = value;
  }

  String get client => _client;

  set client(String value) {
    _client = value;
  }

  String get hour_service => _hour_service;

  set hour_service(String value) {
    _hour_service = value;
  }

  set date_service(String value) {
    _date_service = value;
  }


}