part of 'components_imports.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const InputField({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
        ),
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
