import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tracy/data_response.dart';

class User extends Equatable {
  const User._(
      this.firstname, this.lastname, this.phone, this.email, this.password);

  factory User.newUser(firstname, lastname, phone, email, password) {
    return User._(firstname, lastname, phone, email, password);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    // ignore: prefer_const_constructors
    return User._(json['firstname'], json['lastname'], json['phone'],
        json['email'], json['password']);
  }

  final String firstname, lastname, phone, email, password;

  @override
  List<String> get props => [firstname, lastname, phone, email, password];
}

class UserRestApi {
  final _api = Dio(BaseOptions(
    baseUrl: 'http://localhost:8081/api/auth/',
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
    headers: {
      'Content-type': ContentType.json.mimeType,
    },
  ));

  Future<DataRes> createUser(User user) async {
    final res = await _api.post('register', data: {
      'firstname': user.firstname,
      'lastname': user.lastname,
      'phone': user.phone,
      'email': user.email,
      'password': user.password,
    });
    String message = res.statusCode! > 201
        ? 'Erreur inattendue'
        : 'Inscription effectué avec succès';
    return DataRes(res.statusCode!, message);
  }

  Future<DataRes> loginUser(String email, String password) async {
    final res =
        await _api.post('login', data: {'email': email, 'password': password});
    if (res.statusCode == 200) {
      return DataRes(res.statusCode!, res.data['message']);
    }
    return DataRes(res.statusCode!, res.data['error']);
  }
}
