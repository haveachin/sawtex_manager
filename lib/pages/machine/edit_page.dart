import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/models/machine.dart';
import 'package:sawtex_manager/utils/validator.dart';
import 'package:sawtex_manager/widgets/curd_form.dart';

class MachineEditPage extends StatelessWidget {
  final Machine machine;

  MachineEditPage({this.machine});

  Widget _buildForm(BuildContext context) {
    return CurdForm<Machine>(
      initialValue: machine,
      builder: (Map<String, dynamic> formData) => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'IP-Address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: machine?.ip,
                  validator: (value) => Validator.isIP(context, value),
                  onSaved: (String value) => formData['ip'] = value,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Port',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  initialValue: machine?.port?.toString() ?? "",
                  validator: (value) => Validator.isPort(context, value),
                  onSaved: (String value) =>
                      formData['port'] = int.parse(value),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            initialValue: machine?.description,
            validator: (value) => Validator.isRequired(context, value),
            onSaved: (String value) => formData['description'] = value,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CurdBloc<Machine>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(machine?.description ?? 'New Machine'),
        ),
        body: BlocListener<CurdBloc<Machine>, CurdState>(
          listener: (BuildContext context, CurdState state) {
            if (state is UpdatedOne) {
              Navigator.pop(context);
            }
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: _buildForm(context),
          ),
        ),
      ),
    );
  }
}
