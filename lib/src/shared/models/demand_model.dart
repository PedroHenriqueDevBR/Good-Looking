class Demand {
  int id;
  String dateCreated;
  String dateService;
  String hourService;
  String client;
  String employee;
  List<String> services;

  Demand(this.dateCreated, this.dateService, this.hourService, this.client,
      this.employee, this.services);
}
