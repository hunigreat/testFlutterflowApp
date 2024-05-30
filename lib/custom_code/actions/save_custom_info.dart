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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> addUserToFirestore(String name, String phone, String email) async {

  // .env 파일 로드
  await dotenv.load(fileName: ".env");
  
  // Firestore 인스턴스 가져오기
  FirebaseFirestore firestore = FirebaseFirestore.instance;

   String encryptKey = dotenv.env['FIREBASE_ENCRYPT_KEY']
     
  // 암호화 키 설정 (고유의 키를 사용해야 합니다)
  // final key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
  final key = encrypt.Key.fromUtf8(encryptKey);   
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  // 데이터 암호화
  final encryptedName = encrypter.encrypt(name, iv: iv);
  final encryptedPhone = encrypter.encrypt(phone, iv: iv);
  final encryptedEmail = encrypter.encrypt(email, iv: iv);

  print("encryptedName = $encryptedName");
  print("encryptedPhone = $encryptedPhone");
  print("encryptedEmail = $encryptedEmail");

  // Firestore 컬렉션 참조
  CollectionReference customer = firestore.collection('customer');

  // 암호화된 데이터 추가
  await customer.doc().set({
    'name': encryptedName.base64,
    'phone_number': encryptedPhone.base64,
    'email': encryptedEmail.base64,
    'created_at': FieldValue.serverTimestamp(),
  });
}

// Custom Action에 이 함수를 호출하는 코드를 추가합니다.
// 파라미터로 userId, name, age를 전달받아야 합니다.
Future<void> saveCustomInfo(String name, String phone, String email) async {
  print("name = $name");
  print("phone = $phone");
  print("email = $email");
  await addUserToFirestore(name, phone, email);
}
