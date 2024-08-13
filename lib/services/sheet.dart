import 'package:gsheets/gsheets.dart';
import 'package:ultrasound/models/dataset.dart';

class DataSheetApi {
  static const credentials = r'''
{
  "type": "service_account",
  "project_id": "pcos-373308",
  "private_key_id": "0fdfaa74b8c77375e635a85b4176b0e1bcfa644f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCWoxWq1KwvPeWO\nWMp3W4iBK5VTyRm5yJ+puAuxDELN3Q7c32Uq+jjpw5dF2R6SotYl3umeJBPjRFcl\njspN/COMHtkGQDIzP5Q6VweFV4RWEoxVrCPK76hQzmDfhZLy+6xpbUkC3e1qeEX7\nG2zOtU8cg0PZ9xtbXXJ08uWdliscqEC23aJiNzBszJLqo1ECkYgFMSOJOoj4J4ZP\nPX8j8qsZkimpd+gAKuYtb0GrV9pujQfuNulfthqiP+L54/LJ/lV9+i/pmqvVJJkL\nvmMu9mOl6avLMZSjFkionU6ASFWHgBhhxldxMCfyxjXylVReWcI5GB8voY5pLCZj\nJsb+nn+bAgMBAAECggEADZG4QHCy5/iD5qwx5MmOhNA3vdnmItmjJEcranHnzKKG\nlbfb5aCvosMXK9gQjHX1o2iuk6u9TOIZlY0ExTyauSMIOqtqujoWcKDpUQYeqiA2\nmvsMKFopR8onaMsf/xpToBWTl5oFKmuWJjYEuaQUccWTRZ2gTb0fs9AzhdwCmyyb\nZp/2/3WAQ5KX9UFuQ+h76K8Hn3dlaCSeSP4U1zNW68JF15QMlMG174fmOTCmI09W\n6Q31PLQXkUU8eZPr+zDyeTOJhknmdnvLsB5tOyrdXn0xisIGLK++pK63/HF0dfTW\nF2Zjw8Qttc2Qr7EHsWrbOkxi3mpZZGHWMgD9r/xGiQKBgQDOycCdTv+8LVrFhQrb\nwylZYXwBmcmgQSVvGI5SdKP3h4qGrzaNYr8GAmNtcma+GRm0vLJBGHHdHHjI4KEe\npm6PGmah/KMFRDadHNyOO3YnxbBa4jEjhr9IQ5XZPPgfccmDgrzxIfnL8w7P4O81\nS4Spv9X7Y6itkBm60GEC/js6cwKBgQC6fGp2ebq6sItXq3tLc6DS2iHVRIrTGJ6j\nYh6E5Zdq8/WSM703dH6k23VjTGVrsR+JNUDSvxxVZoVO1mXoXQWswRy/pnBdi8ef\nAe+KmW30T0xfjDMdoCuUa9JUaFlM2tVjwErZwnR1MbmWzI99hdqCg41ppKzCzuoy\nVvGTpsyUOQKBgHizzxiDekbu+mL863+nhUVE38tXZxeBr0YPwVNj/imIFlXThDY3\nA2WQk1TZSBuCLz0OP8Y7bIsyCVbHt4RahYJGWM4I12dFj9NZe2wSTT+d5vjFuwUP\nrCuUN62cJwDDvGplL8BYoqRndafllfs333HuJgsc+uKEkGA5Lcc/enb9AoGBAIlk\neJto++XnhAHHWUMxoV83To3tvcng7Z+5/nozHOezbU2VyOY+cb/L4CSUeHRrPqy8\nC1I5cwqISdbXpqUXQ8MPU7rvSQHipePEbVNTzuqcMcyDYnWFOBZVidSePIye/XBM\nj9j3pw1g4Tb05xK3t1FI0rrulEnCYFFONRVvYnIhAoGAFVjsOVf/zO/H5tf9pBW5\nw24jrachxrm3yuIYea+EznrDNX+Lo4sRc75iCMWsLk23wMiFqTzlTNTxDCefIqTL\nZo5KgsPIYp3mjr28ZGz8pLRc6oIWQnljBxewkaHb+6awd5du77CHu2zhE8SSMysl\nUnNSXF5NTpeYVxU1Z1Gilns=\n-----END PRIVATE KEY-----\n",
  "client_email": "pcos-new@pcos-373308.iam.gserviceaccount.com",
  "client_id": "116306789631841290537",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/pcos-new%40pcos-373308.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static const spreadsheetId = '1u-HF9Wh_AtFwr4ykLOhnfQMRm866fwqQ9XALYi86vpg';

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
