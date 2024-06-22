part of 'login_imports.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: BlocListener<LoginBloc, LoginState>(
                listenWhen: (previous, current) =>
                    current.loginStatus != previous.loginStatus,
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message.toString(),
                          ),
                        ),
                      );
                  }
                  if (state.loginStatus == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Login Successful',
                          ),
                        ),
                      );
                  }
                },
                child: Column(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          current.email != previous.email,
                      builder: (context, state) {
                        return InputField(
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'E-mail',
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(EmailChanged(email: value));
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          current.password != previous.password,
                      builder: (context, state) {
                        return InputField(
                          focusNode: passwordFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(PasswordChanged(password: value));
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: CustomSize.defaultSpace,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 53,
                      child: BlocBuilder<LoginBloc, LoginState>(
                        buildWhen:(previous, current) => current.loginStatus != previous.loginStatus,
                        builder: (context, state) {
                          return CommonButton(
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                context.read<LoginBloc>().add(LoginApi());
                              }
                            },
                            child: state.loginStatus == LoginStatus.loading ? const CircularProgressIndicator(): const Text('LOGIN'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
