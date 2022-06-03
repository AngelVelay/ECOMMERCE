import 'package:flutter/material.dart';

enum CustomButtonTheme{
  dark, light
}

class CustomButton extends StatelessWidget {  
  CustomButton(
      {required this.text,
      required this.onPressed,
      this.color = Colors.blue,
      this.size = 15,
      this.leading = const SizedBox(),
      this.trailing = const SizedBox(), 
      this.theme = CustomButtonTheme.dark
    });

  final GestureTapCallback? onPressed;
  final String text;
  final Color color;
  final double size;
  final Widget leading;
  final Widget trailing;
  final CustomButtonTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme == CustomButtonTheme.dark 
          ? Colors.black87
          : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: onPressed!=null?Colors.white60:Colors.white24,
          width: 2,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: theme == CustomButtonTheme.dark 
                ? MaterialStateProperty.all<Color>(Colors.black87)
                : MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: theme == CustomButtonTheme.dark 
                ? MaterialStateProperty.all<Color>(Colors.white)
                : MaterialStateProperty.all<Color>(Colors.black87)
        ),
        onPressed: onPressed!=null?() => onPressed!():null,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 10),
              Container(
                alignment: Alignment.center,                
                child: Text(
                  text,
                  style:  onPressed != null 
                    ? TextStyle(fontSize: size, color: Colors.white)
                    : TextStyle(fontSize: size, color: Colors.white24),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
              const SizedBox(width: 10),
              trailing
            ],
          ),
        )
      ),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).primaryColor;
    } else {
      return color;
    }
  }
}
