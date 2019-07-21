import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/user.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/user_api_service.dart';
import 'package:sawtex_manager/widgets/checkable_expansion_tile.dart';
import 'package:sawtex_manager/widgets/forms.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';
import 'package:sawtex_manager/widgets/manager/list_page.dart';
import 'package:sawtex_manager/widgets/manager/page.dart';

import '../validator.dart';

class UserManagerPage extends ManagerPage<User> {
  UserManagerPage({Key key})
      : super(
            key: key,
            title: "User",
            editPage: ManagerEditPage<User>(
              apiService: UserApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
            ),
            listPage: ManagerListPage<User>(
              apiService: UserApiService.create(ApiClients.authorized),
              buildFrom: _buildForm,
              buildListTile: _buildListTile,
            ));

  static ListTile _buildListTile(
      BuildContext context, BuildEditButton<User> buildEditButton, User user) {
    return ListTile(
      leading: Icon(Icons.people),
      title: Text(user.username),
      subtitle: Text(user.email),
      trailing: buildEditButton(context, user),
    );
  }

  static Widget _buildForm(
      BuildContext contex, User user, Map<String, dynamic> formData) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: 'E-mail'),
          initialValue: user?.email,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['email'] = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Username'),
          initialValue: user?.username,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['username'] = value,
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          initialValue: user?.password,
          validator: Validator.isRequired,
          onSaved: (String value) => formData['password'] = value,
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              CheckableExpansionTile(
            title: Text('Admin'),
            initialValue: (user?.admin == null) ? false : true,
            onChanged: (bool value) => setState(() =>
                formData['admin'] = (value) ? Map<String, dynamic>() : null),
            children: <Widget>[
              if (formData['admin'] != null)
                CheckableExpansionTile(
                  title: Text('Address'),
                  initialValue: (user?.admin?.address == null) ? false : true,
                  onChanged: (bool value) => formData['admin']['address'] =
                      (value) ? Map<String, dynamic>() : null,
                  children: <Widget>[
                    Forms.addressForm(
                      initialValue: user?.admin?.address,
                      formData: formData['admin']['address'],
                    ),
                  ],
                )
            ],
          ),
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              CheckableExpansionTile(
            title: Text('Creditor'),
            initialValue: (user?.creditor == null) ? false : true,
            onChanged: (bool value) => setState(() => formData['creditor'] =
                (value) ? {'address': Map<String, dynamic>()} : null),
            children: <Widget>[
              if (formData['creditor'] != null)
                Column(
                  children: <Widget>[
                    Forms.addressForm(
                      initialValue: user?.creditor?.address,
                      formData: formData['creditor']['address'],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      initialValue: user?.creditor?.name,
                      validator: Validator.isRequired,
                      onSaved: (String value) =>
                          () {
                            print(value);
                            formData['creditor']['name'] = value;
                          },
                    ),
                  ],
                ),
            ],
          ),
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              CheckableExpansionTile(
            title: Text('Debtor'),
            initialValue: (user?.debtor == null) ? false : true,
            onChanged: (bool value) => setState(() => formData['debtor'] =
                (value) ? {'address': Map<String, dynamic>()} : null),
            children: <Widget>[
              if (formData['debtor'] != null)
                Column(
                  children: <Widget>[
                    Forms.addressForm(
                      initialValue: user?.debtor?.address,
                      formData: formData['debtor']['address'],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      initialValue: user?.debtor?.name,
                      validator: Validator.isRequired,
                      onSaved: (String value) =>
                          () => formData['debtor']['name'] = value,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Default password'),
                      initialValue: user?.debtor?.defaultPassword,
                      validator: Validator.isRequired,
                      onSaved: (String value) =>
                          () => formData['debtor']['defaultPassword'] = value,
                    ),
                  ],
                ),
            ],
          ),
        ),
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              CheckableExpansionTile(
            title: Text('Employee'),
            initialValue: (user?.employee == null) ? false : true,
            onChanged: (bool value) => setState(
                () => formData['employee'] = (value) ? {'roleIds': [], 'canFill': false} : null),
            children: <Widget>[
              Forms.employeeForm(
                initialValue: user?.employee,
                formData: formData['employee'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
