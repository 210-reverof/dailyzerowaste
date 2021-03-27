import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission() async {
  //여러가지 퍼미션을 하고 싶으면 []안에 추가하면된다. (팝업창이뜬다)
  Map<Permission, PermissionStatus> statuses =
      await [Permission.camera, Permission.storage].request();

  bool per = true;

  statuses.forEach((permission, permissionStatus) {
    if (!permissionStatus.isGranted) {
      per = false; //하나라도 허용이안됐으면 false
    }
  });

  return per;
}
