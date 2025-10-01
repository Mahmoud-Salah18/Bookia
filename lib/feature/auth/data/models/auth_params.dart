class AuthParams {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? verifyCode;
  String? newPassword;
  String? confirmNewPassword;

  AuthParams({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.verifyCode,
    this.newPassword,
    this.confirmNewPassword,
  });

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      confirmPassword: json["password_confirmation"],
      verifyCode: json["verify_code"],
      newPassword: json["new_password"],
      confirmNewPassword: json["new_password_confirmation"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      "verify_code": verifyCode,
      "new_password": newPassword,
      "new_password_confirmation": confirmNewPassword,
    };
  }
}
