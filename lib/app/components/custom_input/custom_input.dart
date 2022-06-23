import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputFormatter? inputFormatter;
  final TextEditingController? controller;
  final int? maxLength;

  // final String formProperty;
  // final Map<String, String> formValues;

  const CustomInputField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.helperText,
      this.icon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.prefixIcon,
      this.controller,
      this.inputFormatter,
      this.maxLength

      // required this.formProperty,
      // required this.formValues,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLength: maxLength,
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        inputFormatters: inputFormatter == null
            ? null
            : List<TextInputFormatter>.from([inputFormatter]),

        // onChanged: (value) => formValues[formProperty] = value,
        // validator: (value) {
        //   if (value == null) return 'Este campo es requerido';
        //   return value.length < 3 ? 'Mínimo de 3 letras' : null;
        // },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          hintText: hintText, hintStyle: TextStyle(color: Colors.white),
          labelText: labelText, labelStyle: TextStyle(color: Colors.white),
          helperText: helperText, helperStyle: TextStyle(color: Colors.white),
          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  color: Colors.white,
                ),

          // prefixIcon: Icon( Icons.verified_user_outlined ),
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null
              ? null
              : Icon(
                  icon,
                  color: Colors.white,
                ),
        ));
  }
}
