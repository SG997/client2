part of 'create_academy_page.dart';

class StepThreeField extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? error;
  final TextInputType? keyboardType;
  const StepThreeField({
    Key? key,
    required this.title,
    this.onChanged,
    this.controller,
    this.error,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Label(
              text: title,
              color: UIColor.black.withOpacity(0.5),
              size: 12,
            ),
          ),
          const Space(height: 12),
          PrimaryTextField(
            controller: controller,
            error: error,
            onTextChanged: onChanged,
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}
