import 'package:flutter/material.dart';

class CheckableExpansionTile extends StatefulWidget {
  final bool initialValue;
  final bool initiallyExpanded;
  final List<Widget> children;
  final Function(bool) onChanged;
  final Widget title;

  CheckableExpansionTile({
    Key key,
    this.title,
    this.onChanged,
    this.children,
    this.initialValue,
    this.initiallyExpanded,
  }) : super(key: key);

  _CheckableExpansionTileState createState() => _CheckableExpansionTileState();
}

class _CheckableExpansionTileState extends State<CheckableExpansionTile> {
  bool _isActive = false;

  @override
  void initState() {
    _isActive = widget?.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: widget?.initiallyExpanded ?? false,
      title: widget?.title,
      leading: Checkbox(
        value: _isActive,
        onChanged: (bool value) {
          setState(() => _isActive = value);
          widget?.onChanged(value);
        },
      ),
      children: (_isActive) ? widget.children ?? const <Widget>[] : const <Widget>[Text('Check the box to activate this form')],
    );
  }
}
