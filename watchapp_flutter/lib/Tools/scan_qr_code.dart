import 'dart:async';
import 'package:qrcode_reader/QRCodeReader.dart';

typedef ScanQRCodeResult(String value);

class ScanQRCode{

  static Future<String> showQRCodeReader(ScanQRCodeResult result){

    Future<String> _barcodeString = new QRCodeReader()
        .setAutoFocusIntervalInMs(200)
        .setForceAutoFocus(true)
        .setTorchEnabled(true)
        .setHandlePermissions(true)
        .setExecuteAfterPermissionGranted(true)
        .scan().then((String value){
      result(value);
    });

    return  _barcodeString;
  }

}

