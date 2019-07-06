import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/bloc/basic/bloc.dart';
import 'package:sawtex_manager/widgets/list_dismissible.dart';

class ManagerListPage<T> extends StatefulWidget {
  final BasicBloc<T> bloc;
  final ListDismissible Function(BuildContext, int) buildListDismissible;

  ManagerListPage({
    Key key,
    @required this.bloc,
    @required this.buildListDismissible,
  }) : super(key: key);

  _ManagerListPageState createState() => _ManagerListPageState();
}

class _ManagerListPageState extends State<ManagerListPage> {
  Widget _buildListView(Iterable items) {
    return RefreshIndicator(
      onRefresh: () async => widget.bloc.dispatch(GetMany()),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: widget.buildListDismissible,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.bloc,
      listener: (BuildContext context, BasicState state) {
        if (state is InitialBasicState) {
          widget.bloc.dispatch(GetMany());
        }
      },
      child: BlocBuilder(
        bloc: widget.bloc,
        builder: (BuildContext context, BasicState state) {
          if (state is LoadedMany) {
            return _buildListView(state.items);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
