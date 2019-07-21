import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/size_choice.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/role_api_service.dart';
import 'package:sawtex_manager/service/size_choice_api_service.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';
import 'package:sawtex_manager/widgets/manager/list_page.dart';
import 'package:sawtex_manager/widgets/manager/page.dart';

import '../validator.dart';

class SizeChoiceManagerPage extends ManagerPage<SizeChoice> {
  SizeChoiceManagerPage({Key key})
      : super(
          key: key,
          title: "Size Choice",
          editPage: ManagerEditPage<SizeChoice>(
            apiService: SizeChoiceApiService.create(ApiClients.authorized),
            buildFrom: _buildForm,
          ),
          listPage: ManagerListPage<SizeChoice>(
            apiService: SizeChoiceApiService.create(ApiClients.authorized),
            buildFrom: _buildForm,
            buildListTile: _buildListTile,
          ),
        );

  static ListTile _buildListTile(BuildContext context,
      BuildEditButton<SizeChoice> buildEditButton, SizeChoice sizeChoice) {
    return ListTile(
      leading: Icon(Icons.content_paste),
      title: Text(sizeChoice.description),
      trailing: buildEditButton(context, sizeChoice),
    );
  }

  static Widget _buildForm(BuildContext contex, SizeChoice sizeChoice,
      Map<String, dynamic> formData) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      initialValue: sizeChoice?.description,
      validator: Validator.isRequired,
      onSaved: (String value) => formData['description'] = value,
    );
  }
}
