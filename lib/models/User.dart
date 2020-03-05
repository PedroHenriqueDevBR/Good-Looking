class User {
  int id;
  String name;
  String login;
  String pass;

  User({name, login, id, pass}) {}

  int getId() {
    return this.id;
  }

  String getName() {
    return this.name;
  }

  String getLogin() {
    return this.login;
  }

  String getPass() {
    return this.pass;
  }
}
