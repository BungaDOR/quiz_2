import 'dart:convert';

class RegisterModel {
  final String firstName;
  final String lastName;
  final int age;
  final String email;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email
  });

  RegisterModel copyWith({
    String? firstName,
    String? lastName,
    int? age,
    String? email,
  }) {
    return RegisterModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'email': email,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      age: map['age']?.toInt() ?? 0,
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(firstName: $firstName, lastName: $lastName, age: $age, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterModel &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.age == age &&
      other.email == email;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode ^
      email.hashCode;
  }
}
