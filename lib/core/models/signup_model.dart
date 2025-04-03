
class SignupModel {
  String firstname;
  String lastname;
  String email;

  SignupModel({
    this.firstname = '',
    this.lastname = '',
    this.email = '',
  });

  String get fullName => "$firstname $lastname";
}
