import 'package:bsi/data/w_data.dart';
import 'package:get_ip_address/get_ip_address.dart';

class IpManager {
  static Future<void> addIp() async {
    final database = WDatabase();
    final ipAddress = IpAddress(type: RequestType.json);
    final dynamic data = await ipAddress.getIpAddress();

    final date = DateTime.now();
    print(date);

    try {
      final databaseIp = await database.getIpAddressByIp(data['ip'].toString());
    } catch (e) {
      print('Nie ma');
    }
    print('Koniec');
  }
}
