part of 'widgets_imports.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({
    super.key,
    required this.emailFocusNode,
  });

  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          current.email != previous.email,
      builder: (context, state) {
        return InputField(
          prefixIcon: const Icon(CupertinoIcons.mail_solid),
          focusNode: emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          hintText: 'E-mail',
          onChanged: (value) {
            context
                .read<LoginBloc>()
                .add(EmailChanged(email: value));
          },
          validator: (value)=>AppValidators.validateEmail(value)
        );
      },
    );
  }
}
