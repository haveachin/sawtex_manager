import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/address.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/models/employee.dart';
import 'package:sawtex_manager/models/role.dart';
import 'package:sawtex_manager/models/size_choice.dart';
import 'package:sawtex_manager/models/user.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/city_api_service.dart';
import 'package:sawtex_manager/service/role_api_service.dart';
import 'package:sawtex_manager/service/size_choice_api_service.dart';
import 'package:sawtex_manager/service/user_api_service.dart';
import 'package:sawtex_manager/ui/validator.dart';

import 'manager_dropdown_button.dart';

class Forms {
  static Widget addressForm(
      {Address initialValue,
      Iterable<City> cities,
      @required Map<String, dynamic> formData}) {
    if (formData == null) formData = Map<String, dynamic>();
    return Column(
      children: <Widget>[
        ManagerDropdownButton<City>(
          initialId: initialValue?.cityId,
          items: cities,
          apiService: CityApiService.create(ApiClients.authorized),
          onChanged: (String value) => formData['cityId'] = value,
          itemBuilder: (City city) => DropdownMenuItem<String>(
            value: city.id,
            child: Text('${city?.name} (${city?.state}, ${city?.countryCode})'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Street'),
          initialValue: initialValue?.street,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['street'] = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'House Number'),
          keyboardType: TextInputType.number,
          initialValue: initialValue?.houseNumber?.toString() ?? "",
          validator: Validator.isRequired,
          onSaved: (String value) => formData['houseNumber'] = int.parse(value),
        ),
      ],
    );
  }

  static Widget employeeForm(
      {Employee initialValue,
      Iterable<User> supervisors,
      Iterable<Role> roles,
      Iterable<SizeChoice> sizeChoices,
      @required Map<String, dynamic> formData}) {
    if (formData == null) formData = {
      "roleIds": [],
      "canFill": false,
    };
    return Column(
      children: <Widget>[
        ManagerDropdownButton<User>(
          initialId: initialValue?.supervisorId,
          apiService: UserApiService.create(ApiClients.authorized),
          onChanged: (String value) => formData['supervisorId'] = value,
          itemBuilder: (User user) => DropdownMenuItem<String>(
            value: user.id,
            child: Text('${user?.username} (${user?.email})'),
          ),
        ),
        ManagerDropdownButton<Role>(
          initialId:
              (initialValue?.roleIds != null && initialValue.roleIds.length > 0) ? initialValue?.roleIds[0] : null,
          apiService: RoleApiService.create(ApiClients.authorized),
          onChanged: (String value) => formData['roleIds'] = [value],
          itemBuilder: (Role role) => DropdownMenuItem<String>(
            value: role.id,
            child: Text(role.description),
          ),
        ),
        ManagerDropdownButton<SizeChoice>(
          initialId: initialValue?.sizeChoiceId,
          apiService: SizeChoiceApiService.create(ApiClients.authorized),
          onChanged: (String value) => formData['sizeChoiceId'] = value,
          itemBuilder: (SizeChoice sizeChoice) => DropdownMenuItem<String>(
            value: sizeChoice.id,
            child: Text(sizeChoice.description),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'First name'),
          initialValue: initialValue?.firstName,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['firstName'] = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Last name'),
          initialValue: initialValue?.lastName,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['lastName'] = value,
        ),
        Row(
          children: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) => Checkbox(
                value: formData['canFill'],
                onChanged: (bool value) => setState(() => formData['canFill'] = value),
              ),
            ),
            Text('Can fill')
          ],
        )
      ],
    );
  }
}
