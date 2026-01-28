part of 'login_provider.dart';

class LoginState extends Equatable {
  const LoginState({
    this.step = SignInStepEnum.initial,
    this.email = '',
    this.password = '',
    this.confirmationCode = '',
  });

  LoginState copyWith({
    SignInStepEnum? step,
    String? email,
    String? password,
    String? confirmationCode,
  }) => LoginState(
    step: step ?? this.step,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmationCode: confirmationCode ?? this.confirmationCode,
  );

  final SignInStepEnum step;
  final String email;
  final String password;
  final String confirmationCode;

  @override
  List<Object?> get props => [
    step,
    email,
    password,
    confirmationCode,
  ];

  bool get buttonEnabled {
    switch (step) {
      case SignInStepEnum.initial:
      case SignInStepEnum.email:
        return email.isNotEmpty;

      case SignInStepEnum.createPassword:
        return password.length >= 8;
      case SignInStepEnum.hello:
      case SignInStepEnum.confirmationCode:
        return true;
    }
  }
}
