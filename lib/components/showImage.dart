import 'dart:io';
import 'package:flutter/material.dart';
import '../components/customAlertDialog.dart';

class ShowImage extends StatelessWidget {
  ShowImage({
    @required this.imageFile,
    @required this.onSelectDelete,
    @required this.onSelectCrop,
  });

  final File imageFile;
  final Function(File) onSelectDelete;
  final Function(File) onSelectCrop;

  @override
  Widget build(BuildContext context) {
    final Image image = Image.file(imageFile);

    return Dialog(
      child: Container(
        width: image.width,
        height: image.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.file(imageFile, fit: BoxFit.cover),
            Container(
              color: Colors.white30,
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.crop_free),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          title: 'Confirmation',
                          content: 'Are you sure you want to Clear Image?',
                          onPressedYes: () => onSelectCrop(null),
                          onPressedNo: () => Navigator.pop(context),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline_outlined),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          title: 'Confirmation',
                          content: 'Are you sure you want to Clear Image?',
                          onPressedYes: () => onSelectDelete(null),
                          onPressedNo: () => Navigator.pop(context),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
