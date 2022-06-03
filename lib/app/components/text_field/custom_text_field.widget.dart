import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget{

  final String labelText;
  final TextEditingController editingController;
  final int maxLines;
  final TextInputType textInputType;
  final Widget? iconSuffix;
  final Function(String text)? onChange;
  final bool isEnable;
  CustomTextField(this.labelText,this.editingController,{this.maxLines=3,this.textInputType=TextInputType.emailAddress,this.iconSuffix,this.onChange,this.isEnable=true});
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      maxLines: maxLines,
      enabled: isEnable,
      mouseCursor: MouseCursor.uncontrolled,
        //focusNode: FocusNode(),
      textAlign: (textInputType==TextInputType.number||textInputType==TextInputType.numberWithOptions())?TextAlign.center:TextAlign.start,
      onChanged: (s)=>onChange??(s),
      controller: editingController,
       //-FocusScope.of(context).requestFocus(focus),
      keyboardType: textInputType,
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        suffixIcon: iconSuffix,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(16.5),
        ),
        labelStyle: TextStyle(color: Colors.grey[400]),
        labelText: labelText,
      ),
    );
  }
}