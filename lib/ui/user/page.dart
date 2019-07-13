import 'package:flutter/material.dart';
import 'package:sawtex_manager/models/city.dart';
import 'package:sawtex_manager/service/api_clients.dart';
import 'package:sawtex_manager/service/city_api_service.dart';
import 'package:sawtex_manager/widgets/manager/edit_page.dart';
import 'package:sawtex_manager/widgets/manager/list_page.dart';
import 'package:sawtex_manager/widgets/manager/page.dart';

class UserPage extends ManagerPage<City> {
  UserPage({Key key})
      : super(
            key: key,
            title: "City v2",
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

  static final String countryCodeRegExp =
      r'^(AF|AX|AL|DZ|AS|AD|AO|AI|AQ|AG|AR|AM|AW|AU|AT|AZ|BS|BH|BD|BB|BY|BE|BZ|BJ|BM|BT|BO|BQ|BA|BW|BV|BR|IO|BN|BG|BF|BI|KH|CM|CA|CV|KY|CF|TD|CL|CN|CX|CC|CO|KM|CG|CD|CK|CR|CI|HR|CU|CW|CY|CZ|DK|DJ|DM|DO|EC|EG|SV|GQ|ER|EE|ET|FK|FO|FJ|FI|FR|GF|PF|TF|GA|GM|GE|DE|GH|GI|GR|GL|GD|GP|GU|GT|GG|GN|GW|GY|HT|HM|VA|HN|HK|HU|IS|IN|ID|IR|IQ|IE|IM|IL|IT|JM|JP|JE|JO|KZ|KE|KI|KP|KR|KW|KG|LA|LV|LB|LS|LR|LY|LI|LT|LU|MO|MK|MG|MW|MY|MV|ML|MT|MH|MQ|MR|MU|YT|MX|FM|MD|MC|MN|ME|MS|MA|MZ|MM|NA|NR|NP|NL|NC|NZ|NI|NE|NG|NU|NF|MP|NO|OM|PK|PW|PS|PA|PG|PY|PE|PH|PN|PL|PT|PR|QA|RE|RO|RU|RW|BL|SH|KN|LC|MF|PM|VC|WS|SM|ST|SA|SN|RS|SC|SL|SG|SX|SK|SI|SB|SO|ZA|GS|SS|ES|LK|SD|SR|SJ|SZ|SE|CH|SY|TW|TJ|TZ|TH|TL|TG|TK|TO|TT|TN|TR|TM|TC|TV|UG|UA|AE|GB|US|UM|UY|UZ|VU|VE|VN|VG|VI|WF|EH|YE|ZM|ZW|AFG|ALB|DZA|ASM|AND|AGO|AIA|ATA|ATG|ARG|ARM|ABW|AUS|AUT|AZE|BHS|BHR|BGD|BRB|BLR|BEL|BLZ|BEN|BMU|BTN|BOL|BIH|BWA|BVT|BRA|IOT|VGB|BRN|BGR|BFA|BDI|KHM|CMR|CAN|CPV|CYM|CAF|TCD|CHL|CHN|CXR|CCK|COL|COM|COD|COG|COK|CRI|CIV|CUB|CYP|CZE|DNK|DJI|DMA|DOM|ECU|EGY|SLV|GNQ|ERI|EST|ETH|FRO|FLK|FJI|FIN|FRA|GUF|PYF|ATF|GAB|GMB|GEO|DEU|GHA|GIB|GRC|GRL|GRD|GLP|GUM|GTM|GIN|GNB|GUY|HTI|HMD|VAT|HND|HKG|HRV|HUN|ISL|IND|IDN|IRN|IRQ|IRL|ISR|ITA|JAM|JPN|JOR|KAZ|KEN|KIR|PRK|KOR|KWT|KGZ|LAO|LVA|LBN|LSO|LBR|LBY|LIE|LTU|LUX|MAC|MKD|MDG|MWI|MYS|MDV|MLI|MLT|MHL|MTQ|MRT|MUS|MYT|MEX|FSM|MDA|MCO|MNG|MSR|MAR|MOZ|MMR|NAM|NRU|NPL|ANT|NLD|NCL|NZL|NIC|NER|NGA|NIU|NFK|MNP|NOR|OMN|PAK|PLW|PSE|PAN|PNG|PRY|PER|PHL|PCN|POL|PRT|PRI|QAT|REU|ROU|RUS|RWA|SHN|KNA|LCA|SPM|VCT|WSM|SMR|STP|SAU|SEN|SCG|SYC|SLE|SGP|SVK|SVN|SLB|SOM|ZAF|SGS|ESP|LKA|SDN|SUR|SJM|SWZ|SWE|CHE|SYR|TWN|TJK|TZA|THA|TLS|TGO|TKL|TON|TTO|TUN|TUR|TKM|TCA|TUV|VIR|UGA|UKR|ARE|GBR|UMI|USA|URY|UZB|VUT|VEN|VNM|WLF|ESH|YEM|ZMB|ZWE)$';

  static String _fieldRequired(String value) {
    if (value.isEmpty) return 'This field is required';
    return null;
  }

  static String _fieldPattern(String value, RegExp regExp) {
    if (!regExp.hasMatch(value)) return 'Pattern did not match';
    return null;
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
                validator: _fieldRequired,
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
                validator: _fieldRequired,
                onSaved: (String value) => formData['name'] = value,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(labelText: 'State'),
          initialValue: city?.state,
          validator: _fieldRequired,
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
                validator: _fieldRequired,
                onSaved: (String value) => formData['country'] = value,
              ),
            ),
            SizedBox(width: 10.0),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Country Code'),
                initialValue: city?.countryCode,
                validator: (String value) =>
                    _fieldPattern(value, RegExp(countryCodeRegExp)),
                onSaved: (String value) => formData['countryCode'] = value,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
