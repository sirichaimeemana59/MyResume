class UserModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  UserModel({this.name, this.email, this.phone, this.password});

  factory UserModel.formJson(final json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        password: json['password']);
  }
}
