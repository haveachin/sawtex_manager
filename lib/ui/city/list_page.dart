import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/widgets/list_dismissible.dart';

import 'bloc/bloc.dart';
import 'edit_page.dart';

class CityListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CityListPageState();
  }
}

class _CityListPageState extends State<CityListPage> {
  final _cityBloc = CityBloc();
  List<City> _cities = [];

  @override
  void initState() {
    super.initState();
    _cityBloc.dispatch(GetCities());
  }

  Widget _buildEditButton(BuildContext context, City city) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (BuildContext context) => CityEditPage(city: city),
            ),
          )
          .whenComplete(() => _cityBloc.dispatch(GetCities())),
    );
  }

  Widget _buildListView() {
    return RefreshIndicator(
      onRefresh: () async => _cityBloc.dispatch(GetCities()),
      child: ListView.separated(
        itemCount: _cities.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListDismissible(
            key: Key(_cities[index].id),
            onDismissed: () {
              _cityBloc.dispatch(DeleteCity(_cities[index].id));
              _cities.removeAt(index);
            },
            child: ListTile(
              leading: Icon(Icons.location_city),
              title: Text(_cities[index].name),
              subtitle: Text(
                  '${_cities[index].state}, ${_cities[index].countryCode}'),
              trailing: _buildEditButton(context, _cities[index]),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cityBloc,
      builder: (BuildContext context, CityState state) {
        if (state is CitiesLoaded) {
          _cities = state.cities.toList();
          return _buildListView();
        } else if (state is LoadingCities) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _buildListView();
      },
    );
  }

  @override
  void dispose() {
    _cityBloc.dispose();
    super.dispose();
  }
}
