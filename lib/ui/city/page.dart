import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/city_api_service.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';
import 'package:sawtex_manager/widgets/manager/list_page.dart';
import 'package:sawtex_manager/widgets/manager/page.dart';

import '../validator.dart';

class CityManagerPage extends ManagerPage<City> {
  CityManagerPage({Key key})
      : super(
            key: key,
            title: "City",
            editPage: ManagerEditPage<City>(
              apiService: CityApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
            ),
            listPage: ManagerListPage<City>(
              apiService: CityApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
              buildListTile: _buildListTile,
            ));

  static ListTile _buildListTile(BuildContext context, BuildEditButton<City> buildEditButton,  City city) {
    return ListTile(
      leading: Icon(Icons.location_city),
      title: Text(city.name),
      subtitle: Text('${city.state}, ${city.countryCode}'),
      trailing: buildEditButton(context, city),
    );
  }

  static Widget _buildForm(
      BuildContext contex, City city, Map<String, dynamic> formData) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'ZIP Code'),
                initialValue: city?.zipCode,
                validator: Validator.isRequired,
                onSaved: (String value) => formData['zipCode'] = value,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              flex: 3,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: city?.name,
                validator: Validator.isRequired,
                onSaved: (String value) => formData['name'] = value,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'State'),
          initialValue: city?.state,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['state'] = value,
        ),
        SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                initialValue: city?.country,
                validator: Validator.isRequired,
                onSaved: (String value) => formData['country'] = value,
              ),
            ),
            SizedBox(width: 10.0),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Country Code'),
                initialValue: city?.countryCode,
                validator: Validator.isISOCode,
                onSaved: (String value) => formData['countryCode'] = value,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
