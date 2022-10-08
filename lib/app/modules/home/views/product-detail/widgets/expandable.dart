import 'package:flutter/material.dart';
import 'package:jexpoints/app/shared/values/constants.dart';

class Expandable extends StatefulWidget {
  final String title;
  final String description;
  final Widget trailing;
  const Expandable({Key? key, 
    required this.title,
    required this.description,
    required this.trailing,
  }) : super(key: key);

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: kTitleStyle),
              const Spacer(),
              widget.trailing,
              InkWell(
                child: RotatedBox(
                  quarterTurns: _expanded ? 2 : 0,
                  child: const Icon(Icons.arrow_drop_down_sharp,
                      color: Colors.white),
                ),
                onTap: () => setState(() => _expanded = !_expanded),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 150),
            vsync: this,
            child: ConstrainedBox(
              constraints:
                  _expanded ? const BoxConstraints() : const BoxConstraints(maxHeight: 0),
              child: Text(
                widget.description,
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
