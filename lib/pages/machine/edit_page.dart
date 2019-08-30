import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/models/machine.dart';
import 'package:sawtex_manager/utils/translation.dart';
import 'package:sawtex_manager/widgets/curd_form.dart';

class MachineEditPage extends StatelessWidget {
  final Machine machine;

  MachineEditPage({this.machine});

  Widget _buildForm(BuildContext context) {
    return CurdForm<Machine>(
      initialValue: machine,
      builder: () => Column(
        children: <Widget>[
          FormBuilderTextField(
            attribute: 'ip',
            decoration: InputDecoration(
              labelText: '${Translation.of(context).ipAddress}*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            initialValue: machine?.ip,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.IP(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          FormBuilderTextField(
            attribute: 'port',
            decoration: InputDecoration(
              labelText: '${Translation.of(context).port}*',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            initialValue: machine?.port?.toString() ?? "",
            valueTransformer: (value) => int.parse(value),
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.min(0),
              FormBuilderValidators.max(65535),
            ],
          ),
          SizedBox(height: 16.0),
          FormBuilderTextField(
            attribute: 'description',
            decoration: InputDecoration(
              labelText: '${Translation.of(context).description}*',
              border: OutlineInputBorder(),
            ),
            initialValue: machine?.description ?? "",
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
          title: Text(machine?.description ?? Translation.of(context).machinePageTitleNew),
        ),
        body: BlocListener<CurdBloc<Machine>, CurdState>(
          listener: (BuildContext context, CurdState state) {
            if (state is AddedOne || state is UpdatedOne) {
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
