import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadFile extends StatefulWidget {
  final Function(String url) onFileUploaded; // Add this parameter

  const UploadFile({Key? key, required this.onFileUploaded}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> with SingleTickerProviderStateMixin {
  late AnimationController loadingController;

  File? _file;
  PlatformFile? _platformFile;

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
      setState(() {});
    });

    super.initState();
  }

  Future<void> selectFile() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path!);
        _platformFile = file.files.first;
      });

      loadingController.forward();

      // Simulate file upload and get the file URL
      String uploadedFileUrl = await uploadFile(_file!);
      widget.onFileUploaded(uploadedFileUrl); // Call the callback with the URL
    }
  }

  Future<String> uploadFile(File file) async {
    // Replace with your actual file upload logic using Dio or any other HTTP client
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    return 'https://example.com/uploaded_file.pdf'; // Return a simulated file URL
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Text(
          'Upload your Resume',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'File should be pdf, docx',
          style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: selectFile,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              dashPattern: [10, 4],
              strokeCap: StrokeCap.round,
              color: Colors.blue.shade400,
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, color: Colors.blue, size: 40),
                    SizedBox(height: 15),
                    Text(
                      'Select your file',
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _platformFile != null
            ? Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected File',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _platformFile!.name,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${(_platformFile!.size / 1024).ceil()} KB',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 5,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.shade50,
                            ),
                            child: LinearProgressIndicator(
                              value: loadingController.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Uncomment the MaterialButton if needed
              // MaterialButton(
              //   minWidth: double.infinity,
              //   height: 45,
              //   onPressed: () {},
              //   color: Colors.black,
              //   child: Text('Upload', style: TextStyle(color: Colors.white)),
              // )
            ],
          ),
        )
            : Container(),
      ],
    );
  }
}
