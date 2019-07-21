import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/city_api_service.dart';
import 'package:sawtex_manager/widgets/manager/bloc/bloc.dart';

class CityFormField extends StatefulWidget {
  final FormFieldSetter<City> onSaved;
  final Iterable<City> cities;
  final City initialValue;

  CityFormField({
    this.onSaved,
    this.cities,
    this.initialValue,
  });

  @override
  _CityFormField createState() => _CityFormField();
}

class _CityFormField extends State<CityFormField> {
  ManagerBloc<City> _cityBloc;
  Iterable<City> _cities;
  City _selectedCity;

  DropdownMenuItem<City> _buildItem(dynamic city) {
    return DropdownMenuItem<City>(
      value: city,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(city.name),
            Text(city.country),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.cities == null) {
      _cityBloc =
          ManagerBloc<City>(CityApiService.create(ApiClients.authorized));
      _cityBloc.dispatch(GetMany());
    } else {
      _cities = widget.cities;
    }

    _selectedCity = widget?.initialValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_cityBloc == null)
        ? DropdownButtonFormField<City>(
            items: _cities.map<DropdownMenuItem<City>>(_buildItem).toList(),
            onSaved: widget?.onSaved,
            value: _selectedCity,
            onChanged: (City city) => _selectedCity = city,
          )
        : BlocBuilder(
            bloc: _cityBloc,
            builder: (BuildContext context, ManagerState state) {
              if (state is ActionFailed) {
                return DropdownButtonFormField<City>(
                  items: null,
                  hint: Text(state.error.message),
                );
              } else if (state is LoadingMany) {
                return DropdownButtonFormField<City>(
                  items: null,
                  hint: Text('Loading...'),
                );
              } else if (state is LoadedMany) {
                return DropdownButtonFormField<City>(
                  items: state.items
                      .map<DropdownMenuItem<City>>(_buildItem)
                      .toList(),
                  onSaved: widget?.onSaved,
                  value: _selectedCity,
                  onChanged: (City city) => _selectedCity = city,
                );
              }
              return DropdownButtonFormField<City>(
                items: null,
                hint: Text('Something went wrong'),
              );
            },
          );
  }
}
