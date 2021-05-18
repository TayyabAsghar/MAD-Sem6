import 'dart:io';
import 'dart:convert';
import '../utils/constants.dart';
import '../components/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/customAlertDialog.dart';
import '../components/showImage.dart';
import 'package:image_picker/image_picker.dart';

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  File imageFile;
  final imagePicker = ImagePicker();
  bool uploadStatus = false;

  pickImage(BuildContext context, ImageSource source) async {
    Navigator.of(context).pop();

    final image = await imagePicker.getImage(
      source: source,
      imageQuality: 50,
    );

    // If you press back button without taking picture.
    if (image == null) return;

    final file = File(image.path);

    if (imageConstraint(file)) this.setState(() => imageFile = file);
  }

  bool imageConstraint(File image) {
    if (!['bmp', 'jpg', 'jpeg']
        .contains(image.path.split('.').last.toString())) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Image format should be jpg/jpeg/bmp.',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
      return false;
    }

    final imageSize = image.readAsBytesSync().lengthInBytes / 1024;

    if (imageSize > 2048) {
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Image Size should be less than 2MB. Current size is ' +
                imageSize.toStringAsFixed(2) +
                ' KB',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
      return false;
    }
    return true;
  }

  uploadImage() async {
    setState(() => uploadStatus = true);

    var response = await http.post(uploadURI, body: {
      'image': imageFile.readAsBytes().toString(),
      'name': imageFile.path.split('/').last.toString(),
    });

    print('response');

    if (response.statusCode != 200)
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Error Uploading!',
            content: 'Server Side Error.',
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
    else {
      var result = jsonDecode(response.body);

      print(result);
      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog.ok(
            okTitle: 'Image Sent!',
            content: result['message'],
            onPressedOk: () => Navigator.pop(context),
          );
        },
      );
    }
    setState(() => uploadStatus = false);
  }

  selection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 24.0,
          title: Text('Make a Choice!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt_rounded),
                  title: Text('Camera'),
                  onTap: () => pickImage(context, ImageSource.camera),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.collections),
                  title: Text('Gallery'),
                  onTap: () => pickImage(context, ImageSource.gallery),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: uploadStatus
              ? Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 7,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async => imageFile == null
                            ? selection(context)
                            : showDialog(
                                context: context,
                                builder: (_) => ShowImage(
                                  imageFile: imageFile,
                                  onSelectDelete: (image) {
                                    setState(() => imageFile = image);
                                    Navigator.popUntil(
                                      context,
                                      ModalRoute.withName('/picture'),
                                    );
                                  },
                                  onSelectCrop: (image) {
                                    setState(() => imageFile = image);
                                  },
                                ),
                              ),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 5,
                          backgroundColor: Colors.grey,
                          backgroundImage: imageFile != null
                              ? FileImage(imageFile)
                              : AssetImage('assets/images/camera.png'),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextButton.icon(
                        icon: Icon(
                          imageFile == null
                              ? Icons.add_a_photo
                              : Icons.file_upload,
                          color: Colors.white,
                        ),
                        label: Text(
                          imageFile == null ? 'Select Image' : 'Upload Image',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          elevation: MaterialStateProperty.all(12),
                        ),
                        onPressed: () async => imageFile == null
                            ? selection(context)
                            : uploadImage(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
