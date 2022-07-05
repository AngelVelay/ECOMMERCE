import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EvidenceOption {
  String name;
  Function action;

  EvidenceOption(this.name, this.action);
}

class FileManager {}

class ImagePickerUtils {
  static final List<EvidenceOption> _evidenceOptions = <EvidenceOption>[
    EvidenceOption('Capturar foto', _takePhoto),
    EvidenceOption('Seleccionar imagen', _pickImage),
  ];

  static pick(BuildContext context, Function onComplete) async {
    showCupertinoModalPopup<FileManager>(
      context: context,
      builder: (BuildContext context) => _actionSheet(context),
    );
  }

  static Widget _actionSheet(BuildContext context) {
    return CupertinoActionSheet(
        title: const Text('Selecciona una opción'),
        actions: _evidenceOptions.map((e) {
          return CupertinoActionSheetAction(
              child: Text(e.name), onPressed: () => e.action(context));
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  static _takePhoto(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
  }

  static _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
  }
}
