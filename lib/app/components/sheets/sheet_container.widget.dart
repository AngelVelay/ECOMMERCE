import 'package:flutter/material.dart';

class SheetContainer extends StatelessWidget {
  final Widget content;
  final String? title;
  final Function? onCancel;
  final double height;

  const SheetContainer(this.content, this.title, this.onCancel, this.height,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height:
            height == 0 ? MediaQuery.of(context).size.height * 0.80 : height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Column(children: [
          Stack(children: [
            _titleWidget(context),
            _closeButtonWidget(context),
            Padding(
                padding: EdgeInsets.only(
                    top: (title == null ? 40 : 60),
                    left: 20,
                    right: 20,
                    bottom: 20),
                child: content)
          ]),
        ]));
  }

  Widget _titleWidget(BuildContext context) {
    return title == null
        ? Container()
        : Container(
            child: Text(title!,
                style: const TextStyle(color: Colors.black, fontSize: 25)),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
          );
  }

  Widget _closeButtonWidget(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          if (onCancel != null) onCancel!();
          Navigator.pop(context);
        },
        icon: Icon(Icons.close),
        color: Colors.black,
      ),
      alignment: Alignment.centerRight,
    );
  }
}
