// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:encrypt/encrypt.dart' as encrypt;

String encryptData(String plainText) {
  final key =
      encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1'); // 32 bytes key
  final iv = encrypt.IV.fromLength(16); // Initialization vector
  // final iv = encrypt.IV.fromUtf8('my16bytesivforae'); // 16 bytes IV

  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  //final encrypter =
  //    encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
  //final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}
