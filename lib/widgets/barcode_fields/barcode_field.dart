import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class BarcodeField extends StatefulWidget {
  final String hintText;
  final void Function(String) onChanged;
  final String initialValue;

  BarcodeField({
    Key key,
    this.hintText,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  _BarcodeFieldState createState() => _BarcodeFieldState();
}

class _BarcodeFieldState extends State<BarcodeField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget?.initialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget?.onChanged,
      decoration: InputDecoration(
        labelText: widget?.hintText ?? "",
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () async {
            try {
              final code = await BarcodeScanner.scan();
              _controller.text = code;
              widget?.onChanged(code);
            } catch (e) {}
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
