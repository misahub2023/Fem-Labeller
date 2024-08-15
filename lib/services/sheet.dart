import 'package:gsheets/gsheets.dart';
import 'package:ultrasound/models/dataset.dart';

class DataSheetApi {
  static const credentials = r'''
{
  "type": "service_account",
  "project_id": "<your_project_id>",
  "private_key_id": "<your_private_key_id>",
  "private_key": "<your_private_key>",
  "client_email": "<your_client_email>",
  "client_id": "<your_client_id>",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "<your_client_x509_cert_url>"
}
''';
  static const spreadsheetId = '<your_spreadsheet_id>';

  static final gsheets = GSheets(credentials);

  static Worksheet? dataSheet;

  static Future init() async {
    try {
      final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
      dataSheet = await getWorksheet(spreadsheet, 'Sheet 1');

      final firstRow = DataSet.getFields();
      dataSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init error: $e');
    }
  }

  static Future<Worksheet> getWorksheet(
      Spreadsheet spreadsheet, String title) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    dataSheet!.values.map.appendRows(rowList);
  }

  static Future deleteByImagePath(String imagePath) async {
    if (dataSheet == null) return false;

    final index = await dataSheet!.values.rowIndexOf(imagePath);
    if (index == -1) return false;

    return dataSheet!.deleteRow(index);
  }
}
