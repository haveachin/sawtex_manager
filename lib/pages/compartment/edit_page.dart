import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:convert/convert.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/models/compartment.dart';
import 'package:sawtex_manager/models/machine.dart';
import 'package:sawtex_manager/widgets/barcode_fields/form_builder_barcode_field.dart';
import 'package:sawtex_manager/widgets/curd_form.dart';
import 'package:sawtex_manager/widgets/curd_type_ahead_fields/form_builder_curd_type_ahead.dart';

class CompartmentEditPage extends StatelessWidget {
  final Compartment compartment;

  CompartmentEditPage({this.compartment});

  Widget _buildForm(BuildContext context) {
    return CurdForm<Compartment>(
      initialValue: compartment,
      builder: () => Column(
        children: <Widget>[
          FormBuilderCurdTypeAhead<Machine>(
            attribute: 'machineId',
            hintText: 'Machine',
            initialId: compartment?.machineId,
            icon: Icon(Icons.dns),
            patternFilter: (String pattern) => {
              'description': {
                '\$regex': pattern,
              }
            },
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          SizedBox(height: 16.0),
          FormBuilderTextField(
            attribute: 'description',
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            initialValue: compartment?.description ?? "",
          ),
          SizedBox(height: 16.0),
          FormBuilderBarcodeField(
            attribute: 'code',
            initialValue: hex.encode(compartment?.code?.toList() ?? []),
            hintText: 'Code',
            valueTransformer: (value) => hex.decode(value),
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(8),
              FormBuilderValidators.maxLength(8),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => CurdBloc<Compartment>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(compartment?.description ?? 'New Compartment'),
        ),
        body: BlocListener<CurdBloc<Compartment>, CurdState>(
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
