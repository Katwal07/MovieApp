part of 'widgets_imports.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: 53,
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current.loginStatus != previous.loginStatus,
        listener: (context, state) {
          if(state.loginStatus == LoginStatus.error){
            AppHelperFunction.showSnackBar(state.message.toString(), context);
          }
          if(state.loginStatus == LoginStatus.success){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
          }
          if(state.loginStatus == LoginStatus.loading){
            AppHelperFunction.showSnackBar('submitting...', context);
      
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
    );
  }
}
