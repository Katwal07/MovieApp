part of 'login_imports.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginEmailInput(emailFocusNode: emailFocusNode),
                    LoginPasswordInput(passwordFocusNode: passwordFocusNode),
                    const SizedBox(
                      height: CustomSize.defaultSpace,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 53,
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
                                SnackBar(
                                  content: Text(
                                    state.message.toString(),
                                  ),
                                ),
                              );
                          }

                          if (state.loginStatus == LoginStatus.loading) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'submitting...',
                                  ),
                                ),
                              );
                          }
                        },
                        child: BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (previous, current) =>
                              current.loginStatus != previous.loginStatus,
                          builder: (context, state) {
                            return CommonButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginBloc>().add(LoginApi());
                                }
                              },
                              child: state.loginStatus == LoginStatus.loading
                                  ? const CircularProgressIndicator()
                                  : const Text('LOGIN'),
                            );
                          },
                        ),
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
