// ignore: depend_on_referenced_packages
import "package:equatable/equatable.dart";
import "package:online_courses/models/user_model.dart";

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthStateChanged extends AuthEvent {
  final UserModel? user;
  const AuthStateChanged(this.user);
  @override
  List<Object?> get props => [user];
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final UserRole role;
  const RegisterRequested({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
  });
  @override
  List<Object?> get props => [email, password, fullName, role];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class LogoutRequested extends AuthEvent {
  // final String email;

  // const LogoutRequested({required this.email});
  // @override
  // List<Object?> get props => [email];
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  const ForgotPasswordRequested({required this.email});
  @override
  List<Object?> get props => [email];
}

class UpdateProfileRequested extends AuthEvent {
  final String? fullName;
  final String? photoUrl;

  const UpdateProfileRequested({ this.fullName,  this.photoUrl});
  @override
  List<Object?> get props => [photoUrl, fullName];
}