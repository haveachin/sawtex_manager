import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sawtex_manager/utils/translation.dart';

class ListTileDismissible extends StatelessWidget {
  final Widget child;
  final Function onDismissed;

  const ListTileDismissible({
    @required Key key,
    @required this.onDismissed,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              Translation.of(context).delete.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        if (direction != DismissDirection.endToStart) return;
        onDismissed();
      },
      child: child,
    );
  }
}
