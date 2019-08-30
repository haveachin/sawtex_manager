import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/models/compartment.dart';
import 'package:sawtex_manager/widgets/curd_list_view_editable.dart';

import 'edit_page.dart';

class CompartmentListPage extends StatelessWidget {
  Widget _buildListView(BuildContext context, List<Compartment> cities) {
    return CurdListViewEditable<Compartment>(
      items: cities,
      onEdit: (Compartment compartment) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => CompartmentEditPage(
            compartment: compartment,
          ),
        ),
      ),
      subtitleBuilder: (Compartment compartment) => Text(compartment.code.toString()),
      tileIcon: Icon(Icons.crop_16_9),
      titelBuilder: (Compartment compartment) => Text(compartment.toString())
          
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurdBloc<Compartment>>(
      builder: (BuildContext context) {
        final bloc = CurdBloc<Compartment>();
        bloc.dispatch(GetMany());
        return bloc;
      },
      child: BlocBuilder<CurdBloc<Compartment>, CurdState>(
        builder: (BuildContext context, CurdState state) {
          if (state is LoadedMany) {
            return _buildListView(context, state.items.toList());
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
