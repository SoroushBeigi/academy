import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:academy/src/features/new_content/new_content.dart';
import 'package:flutter_login/flutter_login.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final cubit = getIt<AuthCubit>();
    return BlocProvider(
      create: (context) {
        return AuthCubit();
      },
      child: FlutterLogin(
        hideForgotPasswordButton: true,
        messages: LoginMessages(
          signupButton: localizations.signup,
          loginButton: localizations.login,
          userHint: localizations.email,
          passwordHint: localizations.password,
          confirmPasswordHint: localizations.confirmPassword,
          flushbarTitleError: localizations.error,
          confirmPasswordError: localizations.confirmPasswordError,
        ),
        logo: 'assets/icon.png',
        additionalSignupFields: const [
          UserFormField(
            keyName: 'username',
            icon: Icon(Icons.person),
          )
        ],
        onLogin: (p0)async {
          final result = await cubit.login(p0.name,p0.password);
          if(result==null){
            context.go('/main');
            return null;
          }else{
            return AppConstants.isFa? 'ورود ناموفق': result;
          }
        },
        userValidator: (value) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value??'')?null:localizations.invalidEmail,
        passwordValidator: (value) => (value?.length??0)<4 ? localizations.shortPasswordError : null,
        onRecoverPassword: (p0) => null,
        onSignup: (p0) async {
          final result = await cubit.register(p0.name ?? '', p0.password ?? '',
              p0.additionalSignupData?['username'] ?? '');
          if (result == null) {
            context.go('/main');
            return null;
          } else {
            return result;
          }
        },
      ),
    );
  }
}
