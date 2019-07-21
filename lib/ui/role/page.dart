import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/role.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/role_api_service.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';
import 'package:sawtex_manager/widgets/manager/list_page.dart';
import 'package:sawtex_manager/widgets/manager/page.dart';

import '../validator.dart';

class RoleManagerPage extends ManagerPage<Role> {
  RoleManagerPage({Key key})
      : super(
            key: key,
            title: "Role",
            editPage: ManagerEditPage<Role>(
              apiService: RoleApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
            ),
            listPage: ManagerListPage<Role>(
              apiService: RoleApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
              buildListTile: _buildListTile,
            ));

  static ListTile _buildListTile(
      BuildContext context, BuildEditButton<Role> buildEditButton, Role role) {
    return ListTile(
      leading: Icon(Icons.content_paste),
      title: Text(role.description),
      trailing: buildEditButton(context, role),
    );
  }

  static Widget _buildForm(
      BuildContext contex, Role role, Map<String, dynamic> formData) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      initialValue: role?.description,
      validator: Validator.isRequired,
      onSaved: (String value) => formData['description'] = value,
    );
  }
}
