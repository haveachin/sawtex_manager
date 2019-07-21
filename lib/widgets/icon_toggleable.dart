import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconToggleable extends StatefulWidget {
  final String text;
  final IconData iconData;
  final bool initialState;

  IconToggleable({this.text, this.iconData, this.initialState});

  @override
  State<StatefulWidget> createState() => _IconToggleableState();
}

class _IconToggleableState extends State<IconToggleable> {
  bool isActive = false;

  void _toggle() => setState(() => isActive = !isActive);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggle,
      child: Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          children: <Widget>[
            Icon(widget.iconData,
                color: isActive ? Colors.grey[400] : Colors.grey[600], size: 32.0,),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: isActive ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
