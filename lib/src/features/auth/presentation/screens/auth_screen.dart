import 'package:academy/src/core/locale_provdier.dart';
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
    final localeProvider = context.read<LocaleProvider>();
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
          additionalSignUpFormDescription:
              localizations.additionalSignUpFormDescription,
          additionalSignUpSubmitButton: localizations.submit,
          goBackButton: localizations.back,
        ),
        logo: 'assets/icon.png',
        additionalSignupFields: [
          UserFormField(
            keyName: AppConstants.isFa ? 'نام‌کاربری' : 'username',
            icon: const Icon(Icons.person),
          )
        ],
        onLogin: (p0) async {
          final result = await cubit.login(p0.name, p0.password);
          if (result == null) {
            context.go('/main');
            return null;
          } else {
            return AppConstants.isFa ? 'ورود ناموفق' : result;
          }
        },
        userValidator: (value) =>
            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value ?? '')
                ? null
                : localizations.invalidEmail,
        passwordValidator: (value) =>
            (value?.length ?? 0) < 4 ? localizations.shortPasswordError : null,
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
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.9,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (localeProvider.locale == const Locale('en')) {
                      localeProvider.changeLocale(const Locale('fa'));
                    } else {
                      localeProvider.changeLocale(const Locale('en'));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('EN',style: TextStyle(fontWeight: FontWeight.w700),),
                          Switch(value: AppConstants.isFa, onChanged: (value) {
                            if (localeProvider.locale == const Locale('en')) {
                              localeProvider.changeLocale(const Locale('fa'));
                            } else {
                              localeProvider.changeLocale(const Locale('en'));
                            }
                          },

                          ),

                          const Text('فا',style: TextStyle(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
