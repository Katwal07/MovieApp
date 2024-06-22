part of 'widgets_imports.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({
    super.key,
    required this.passwordFocusNode,
  });

  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          current.password != previous.password,
      builder: (context, state) {
        return InputField(
          prefixIcon: const Icon(CupertinoIcons.lock_fill),
          suffixIcon: const Icon(CupertinoIcons.eye_fill),
          obscureText: true,
          focusNode: passwordFocusNode,
          keyboardType: TextInputType.visiblePassword,
          hintText: 'Password',
          onChanged: (value) {
            context
                .read<LoginBloc>()
                .add(PasswordChanged(password: value));
          },
          validator: (value) => AppValidators.validatePassword(value)        );
      },
    );
  }
}