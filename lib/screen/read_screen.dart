import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../data/source/local/book_pref.dart';

class ReadScreen extends StatefulWidget {
  final String path;

  const ReadScreen({super.key, required this.path});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final pref = BookPRef();
  final controller = PdfViewerController();
  var title = "PDF";
  late final file = File(widget.path);
  var offset = -1.0;

  @override
  void initState() {
    loadPosition();
    controller.addListener(() {
      title = "${controller.pageNumber}/${controller.pageCount}";
      try {
        setState(() {});
      } catch (_) {}
    });
    super.initState();
  }

  Future<void> loadPosition() async {
    offset = await pref.getPosition(widget.path);
    setState(() {});
  }

  @override
  void dispose() {
    pref.setPosition(widget.path, controller.scrollOffset.dy);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          child: Text(title),
        ),
      ),
      body: offset == -1
          ? const Center(child: CircularProgressIndicator())
          : SfPdfViewer.file(
              file,
              initialScrollOffset: Offset(0, offset),
              controller: controller,
            ),
    );
  }
}
