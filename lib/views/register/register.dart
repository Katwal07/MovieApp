part of 'register_imports.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final fullnameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  InputField(
                    focusNode: fullnameFocusNode,
                    hintText: 'Fullname',
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Fullname is required";
                      }
                      return null;
                    },
                  ),
                  InputField(
                    focusNode: emailFocusNode,
                    hintText: 'E-mail',
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  InputField(
                    focusNode: passwordFocusNode,
                    hintText: 'Password',
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                   InputField(
                    focusNode: confirmPasswordFocusNode,
                    hintText: 'Confirm-Password',
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Confirm-Password is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: CustomSize.defaultSpace,),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 53,
                    child: CommonButton(
                      child: const Text('REGISTER'),
                      onPressed: () {},
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have an account?"),
                      TextButton(onPressed: () => Navigator.pop
                      (context,RoutesName.login), child: const Text("LOGIN"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}