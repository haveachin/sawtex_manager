import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/blocs/curd_bloc/bloc.dart';
import 'package:sawtex_manager/models/machine.dart';
import 'package:sawtex_manager/widgets/curd_list_view_editable.dart';

import 'edit_page.dart';

class MachineListPage extends StatelessWidget {
  Widget _buildListView(BuildContext context, List<Machine> cities) {
    return CurdListViewEditable<Machine>(
      items: cities,
      onEdit: (Machine machine) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MachineEditPage(
            machine: machine,
          ),
        ),
      ),
      subtitleBuilder: (Machine machine) =>
          Text(machine.ip),
      tileIcon: Icon(Icons.dns),
      titelBuilder: (Machine machine) => Text(machine.description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurdBloc<Machine>>(
      builder: (BuildContext context) {
        final bloc =
            CurdBloc<Machine>();
        bloc.dispatch(GetMany());
        return bloc;
      },
      child: BlocBuilder<CurdBloc<Machine>, CurdState>(
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
