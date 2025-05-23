import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: must_be_immutable
class InputKoodiarana extends StatelessWidget {
  Widget? leading;
  Text? placeholder;
  TextInputType? textInputType;
  Widget? trailing;
  double? height;
  TextEditingController controller;
  InputKoodiarana({
    this.height,
    super.key,
    this.leading,
    this.trailing,
    this.placeholder,
    this.textInputType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ShadInput(
        keyboardType: textInputType,
        focusNode: FocusNode(),
        decoration: ShadDecoration(
          secondaryFocusedBorder: ShadBorder(
            radius: BorderRadius.circular(100),
            top: ShadBorderSide(width: 0.4),
                        bottom: ShadBorderSide(width: 0.4),
            left: ShadBorderSide(width: 0.4),
            right: ShadBorderSide(width: 0.4),

          ),
          color: Colors.grey[300],
          border: ShadBorder(radius: BorderRadius.all(Radius.circular(100))),
        ),
        controller: controller,
        leading: leading,
        trailing: trailing,
        placeholder: placeholder,
          padding: EdgeInsets.only(left: 32.00, right: 32, top: 8, bottom: 8),
      ),
    );
  }
}
