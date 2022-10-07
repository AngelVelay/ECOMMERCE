import 'package:get/get.dart';
import 'package:jexpoints/app/core/data/services/file-manager.service.dart';
import 'package:jexpoints/app/modules/home/entities/posters.type.dart';
import 'package:jexpoints/app/shared/values/globals.dart';
import 'package:share_plus/share_plus.dart';

class PosterController extends GetxController {
  final postersImage$ = ''.obs;
  Posters? item;
  String formattedBeginDate = '';
  String formattedEndDate = '';

  @override
  void onInit() async {
    item = Get.arguments[0];

    if (item != null) {
      if (item!.title.length > 25) {
        item?.title = item!.title.substring(0, 25);
      }
      formattedBeginDate = Globals.dateFormat.format(item!.beginDate);
      formattedEndDate = Globals.dateFormat.format(item!.endDate);
    }
    postersImage$.value = await imagePoster();
    super.onInit();
  }

  Future imagePoster() async {
    if (item?.appFileManagerId == null) return;
    var file = await FileManagerService().getById(item?.appFileManagerId ?? '');
    return file.fileLink;
  }

  shareData() async {
    var item = Get.arguments;
    await Share.share(item.toString(), subject: 'Compartir Publicidad');
  }
}
