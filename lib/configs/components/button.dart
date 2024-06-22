part of 'components_imports.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CommonButton({
    super.key, required this.onPressed, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(Colors.green),
          foregroundColor:
              MaterialStateProperty.all(Colors.white)),
      onPressed: onPressed,
      child: child,
    );
  }
}
