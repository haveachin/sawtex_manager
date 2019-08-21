import 'package:flutter/material.dart';

import 'list_tile_dismissible.dart';

class ListTileEditable extends StatelessWidget {
  final Widget leading, title, subtitle;
  final Function onDismissed, onEdit;

  const ListTileEditable({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.onDismissed,
    this.onEdit,
  }) : super(key: key);

  Widget _buildEditButton(BuildContext context) {
    return FlatButton(
      child: Icon(Icons.edit),
      onPressed: onEdit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTileDismissible(
      key: key,
      onDismissed: onDismissed,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: _buildEditButton(context),
      ),
    );
  }
}
