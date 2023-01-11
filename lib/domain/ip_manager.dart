import 'package:bsi/data/w_data.dart';
import 'package:drift/drift.dart';
import 'package:get_ip_address/get_ip_address.dart';

class IpManager {
  static Future<void> addIp() async {
    final database = WDatabase();
    final ipAddress = IpAddress(type: RequestType.json);
    final dynamic data = await ipAddress.getIpAddress();

    final date = DateTime.now();
    print(date);

    try {
      final databaseIp = await database.getIpAddressByIp(
        data['ip'].toString(),
      );
    } catch (e) {
      await database.addAddresIp(
        LoginIpsCompanion(
          addresIp: Value(data['ip'].toString()),
          lastLogIn: Value(date),
          lastNoSucces: Value(date),
          counter: Value(0),
        ),
      );
    }
    print('Koniec');
  }

  static Future<void> printIpDB() async {
    final database = WDatabase();
    final ipAddress = IpAddress(type: RequestType.json);
    final dynamic data = await ipAddress.getIpAddress();
    try {
      var ob = await database.getIpAddressByIp(
        data['ip'].toString(),
      );
      print(ob.addresIp);
      print(ob.counter);
      await database.changeLoginIpS(
        data['ip'].toString(),
      );
      ob = await database.getIpAddressByIp(
        data['ip'].toString(),
      );
      print(ob.counter);
    } catch (e) {
      print('Nie udało sie odblokować');
    }
  }
}
