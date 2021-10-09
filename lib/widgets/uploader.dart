import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:io';

/*
 * * * * * * * * * * * * * * * * * * * * * * * * * * 
 * There are two types of uploaders
 * - File is being sent to backend 
 * - And then is being sent to Minio 
 * * * * * * * * * * * * * * * * * * * * * * * * * * 
*/

class Uploader extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;

  const Uploader({Key? key, required this.onDroppedFile}) : super(key: key);

  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
// var syncPath = await path;
// for a file
// io.File(syncPath).exists();
// for a directory
// io.Directory(syncPath).exists();

  late DropzoneViewController controller;
  bool highlight = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onDrop: UploadedFile,
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
        ),
      ],
    );
  }

  Future UploadedFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);
    final aname = await controller.getFilename(event);
    final data = controller.getFileData(event).toString();

    data.

    print('Name : $name');
    print('Name : $aname');
    print('Mime: $mime');
    print('Mime: $data');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }
}

class File_Data_Model {
  final String name;
  final String mime;
  final int bytes;
  final String url;

  File_Data_Model(
      {required this.name,
      required this.mime,
      required this.bytes,
      required this.url});

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }
}
