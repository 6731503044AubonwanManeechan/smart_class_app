import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {

  String result = "Scan a QR Code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: Column(
        children: [

          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (barcode, args) {
                final String? code = barcode.rawValue;

                if (code != null) {
                  setState(() {
                    result = code;
                  });
                }
              },
            ),
          ),

          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                result,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),

        ],
      ),
    );
  }
}