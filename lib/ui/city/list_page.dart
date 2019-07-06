import 'dart:async';

import 'package:built_collection/built_collection.dart';
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

  Widget _buildEditButton(BuildContext context, City city) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => CityEditPage(city: city),
            ),
          ),
    );
  }

  Widget _buildListView(BuiltList<City> cities) {
    return RefreshIndicator(
      onRefresh: () async => _cityBloc.dispatch(GetCities()),
      child: ListView.separated(
        itemCount: cities.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListDismissible(
            key: Key(cities[index].id),
            onDismissed: () {
              _cityBloc.dispatch(DeleteCity(cities[index].id));
              _cityBloc.dispatch(GetCities());
            },
            child: ListTile(
              leading: Icon(Icons.location_city),
              title: Text(cities[index].name),
              subtitle:
                  Text('${cities[index].state}, ${cities[index].countryCode}'),
              trailing: _buildEditButton(context, cities[index]),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _cityBloc,
      listener: (BuildContext context, CityState state) {
        if (state is CityInitial) {
          _cityBloc.dispatch(GetCities());
        }
      },
      child: BlocBuilder(
        bloc: _cityBloc,
        builder: (BuildContext context, CityState state) {
          if (state is CitiesLoaded) {
            return _buildListView(state.cities);
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
    _cityBloc.dispose();
    super.dispose();
  }
}
