import 'package:flutter/material.dart';

class ErrorAlertBox extends StatelessWidget {
  final String title;

  const ErrorAlertBox({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        color: Colors.red,
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.warning,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
