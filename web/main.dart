import 'package:droplez/DropZoneWidget.dart';
import 'package:droplez/DroppedFileWidget.dart';
import 'package:droplez/model/FileDataModel.dart';
import 'package:droplez/rpc/uploader/uploader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File_Data_Model? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("drag drop flutter Web"),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: DropZoneWidget(
                    onDroppedFile: (file) => setState(() => this.file = file),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DroppedFileWidget(file: file),
              ],
            )),
      ),
    );
  }
}

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          withReadStream: true,
          onFileLoading: (p0) => print(p0),
        );
        if (picked != null) {
          PlatformFile file = picked.files.first;
          print(file.size);
          UploaderService uploader = UploaderService();
          // uploader.stub().upload(uploader.upload(file.bytes));
          // uploader.upl(uploader.chunkReq(file.bytes));
          var resp;
          try {
            resp = await uploader.uplStr(uploader.upload(file.bytes));
            print(resp.uUID);
          } catch (err) {
            print(err);
          }
        }
      },
    );
  }
}
