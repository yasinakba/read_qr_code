import 'package:flutter/material.dart';
import 'package:qrcode_reader_web/qrcode_reader_web.dart';

class ReadQrCodeScreen extends StatefulWidget {
  final List<QRCodeCapture> list = [];
  @override
  State<ReadQrCodeScreen> createState() => _ReadQrCodeScreenState();
}

class _ReadQrCodeScreenState extends State<ReadQrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Center(
          child: Container(
            color: Colors.tealAccent,
            width: size.width*.2,
            height: size.width*.2,
            child: Column(
              children: [
                QRCodeReaderSquareWidget(
                  onDetect: (QRCodeCapture capture) => setState(() => widget.list.add(capture)),
                  size: 250,
                ),
                QRCodeReaderTransparentWidget(
                  onDetect: (QRCodeCapture capture) => setState(() => widget.list.add(capture)),
                  targetSize: 250,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.list.length,
                    itemBuilder: (_, index) {
                      return ListTile(title: Text(widget.list[index].raw));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
