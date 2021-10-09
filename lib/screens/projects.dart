import 'package:droplez/widgets/uploader.dart';
import 'package:flutter/material.dart';
import 'package:drop_zone/drop_zone.dart';
import 'dart:html' as html;

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // Helpers

  List<ProjectModel> mockedDrafts = [
    ProjectModel(name: "song 1", description: "the best one"),
    ProjectModel(name: "song 2", description: "the worst one"),
  ];

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Upload a new project",
        onPressed: () =>
            showDialog(context: context, builder: (_) => uploadDialog()),
        // Add your onPressed code here!
        child: const Icon(Icons.upload_file),
        backgroundColor: Colors.cyan,
      ),
      body: Container(),
    );
  }

  Widget draftsDrawer() {
    return Drawer(
      backgroundColor: Colors.amber,
      child: ListView(
        children: mockedDrafts
            .map((e) => ListTile(
                  enabled: true,
                  title: Text(e.name),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }

  Widget uploadDialog() {
    return StatefulBuilder(builder: (context, setState) {
      /*
      * TODO: Update dialog title dynamically
      */
      String title = "Init project";
      return AlertDialog(
          actions: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.ac_unit_sharp)),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.ac_unit_sharp)),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.ac_unit_sharp)),
          ],
          title: Text(title),
          content: Column(
            children: [
              projectMetainfo(),
            ],
          ));
    });
  }

  final _formKey = GlobalKey<FormState>();
  late String? _name;
  bool isSwitched = false;
  String dropzoneState = '';
  String dropzoneState2 = '';
  File_Data_Model? file;
  Widget projectMetainfo() {
    return Container(
      height: 500,
      width: 1700,
      child: Row(children: [
        // Main Information
        Flexible(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                // Project name
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Project Name",
                      helperText:
                          "Leave empty and it will ba parsed from uploaded project"),
                  onSaved: (value) => _name = value,
                ),
                // Project description
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Project Description",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5.0),
                    ),
                  ),
                  minLines: 5,
                  maxLines: 5,
                  onSaved: (value) => _name = value,
                ),
                // TODO: add dropdown with collections
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Project Collection",
                  ),
                  onSaved: (value) => _name = value,
                ),
                // TODO: add tag input
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Project Tags",
                  ),
                  onSaved: (value) => _name = value,
                ),
              ],
            ),
          ),
        )),
        // Uploads
        Expanded(
          child: Uploader(
              onDroppedFile: (File_Data_Model file) => {print(file.name)}),
        )
      ]),
    );
  }

  late String? _currentSelectedValue = '';

  FormField<String> sexyText() {
    var _currencies = [
      "Food",
    ];

    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              hintText: 'Please select expense',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String? newValue) => setState(() {
                _currentSelectedValue = newValue;
                state.didChange(newValue);
              }),
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ProjectModel {
  ProjectModel({required this.name, required this.description});
  final String name;
  final String description;
}
