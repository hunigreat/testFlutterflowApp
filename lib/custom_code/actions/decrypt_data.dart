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

String decryptData(String encryptedText) {
  final key =
      encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1'); // 32 bytes key
  final iv = encrypt.IV.fromLength(16); // 16 bytes IV
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
  return decrypted;
}
