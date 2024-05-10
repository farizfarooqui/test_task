import 'package:flutter/services.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:test_task/Constant/app_styles.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.preFilledValue,
    this.passwordField = false,
    this.labelText,
    this.width,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmit,
    this.maxLength,
    this.suffixIcon,
    required this.onChanged,
  });
  final List<TextInputFormatter>? inputFormatters;
  final String? preFilledValue;
  final bool passwordField;
  final int? maxLength;
  final bool readOnly;
  final String? labelText;
  final double? width;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;
  final void Function(String)? onSubmit;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final controller = TextEditingController();
  bool isObsecure = true;
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_handleFocusChange);
    if (widget.preFilledValue != null) {
      controller.text = '${widget.preFilledValue}';
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: focusNode.hasFocus ? AppColors.green : AppColors.transparent,
            width: 1.8,
          )),
      child: Column(
        children: [
          if (focusNode.hasFocus)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 3),
                child: Text(widget.labelText ?? '',
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.black)),
              ),
            ),
          SizedBox(
            height: widget.passwordField && !focusNode.hasFocus ? 30 : 30,
            child: Padding(
              padding: EdgeInsets.only(
                  top: widget.passwordField && !focusNode.hasFocus ? 4 : 0),
              child: TextFormField(
                  focusNode: focusNode,
                  keyboardType: widget.keyboardType,
                  controller: controller,
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.passwordField ? isObsecure : false,
                  readOnly: widget.readOnly,
                  cursorColor: AppColors.green,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  onFieldSubmitted: widget.onSubmit,
                  decoration: AppStyle.inputFieldDecoration(
                    labelText:
                        focusNode.hasFocus ? null : widget.labelText ?? '',
                    hasFocus: focusNode.hasFocus,
                    suffixIcon: widget.passwordField
                        ? SizedBox(
                            width: 50,
                            child: GestureDetector(
                                onTap: () {
                                  isObsecure = !isObsecure;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 13, top: 10, bottom: 0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(isObsecure ? 'View' : 'Hide',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: AppColors.black)),
                                  ),
                                )),
                          )
                        : null,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
