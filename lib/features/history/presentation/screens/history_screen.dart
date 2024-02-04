import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//TODO agregar pc soport
class HistoryScreen extends HookWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> _progressValue = useState(0.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: const [DarkModeButton()],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ListJornadasRoute().push(context);
                },
                child: const Text('Lista de jornadas')),
          ],
        ),
      ),
    );
  }
  // _networkInstallApk(context, _progressValue.value);

//   _networkInstallApk(context, double _progressValue) async {
//     if (_progressValue != 0 && _progressValue < 1) {
//       showToast(context, "Wait a moment, downloading");
//       return;
//     }
//     final appcast = Appcast();
//     final items = await appcast.parseAppcastItemsFromUri(
//         'https://cast.appcastify.com/geomemsoluciones/aguazullavapp.xml');
//     final bestItem = appcast.bestItem();
//     logger.i(bestItem?.fileURL);
//     //Divice android is?
//     if (!Platform.isAndroid) showToast(context, "Device not supported ");
//     String divicesuport;
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     final androidInfo = await deviceInfo.androidInfo;
//     divicesuport = androidInfo.supportedAbis.first;

//     var appDocDir = await getTemporaryDirectory();
//     String savePath = appDocDir.path + "/AguazulLavApp.apk";
//     String fileUrl =
//         bestItem?.fileURL ?? 'https://cast.appcastify.com/geomemsoluciones/aguazullavapp.apk';
//     await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
//       final value = count / total;
//       if (_progressValue != value) {
//         if (_progressValue < 1.0) {
//           _progressValue = count / total;
//         } else {
//           _progressValue = 0.0;
//         }
//         print((_progressValue * 100).toStringAsFixed(0) + "%");
//       }
//     });

//     final res = await InstallPlugin.install(savePath);
//     showToast(context,
//         "install apk ${res['isSuccess'] == true ? 'success' : 'fail:${res['errorMessage'] ?? ''}'}");
  // }
}
