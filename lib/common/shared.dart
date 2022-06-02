import 'dart:io';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class Shared {
  static Future<HttpClient> customHttpClient() async {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    try {
      List<int> bytes = [];
      bytes = (await rootBundle.load('certificates/certificates.cer'))
          .buffer
          .asUint8List();
      context.setTrustedCertificatesBytes(bytes);
      log('createHttpClient() - cart ditambahkan!');
    } on TlsException catch (e) {
      if (e.osError?.message != null &&
          e.osError!.message.contains('CERT_ALREADY_IN_HASH_TABLE')) {
        log('createHttpClient() - cart sudah diverifikasi! Skip');
      } else {
        log('createHttpClient().setTrustedCertificateByte Exception : $e');
        rethrow;
      }
    } catch (e) {
      log('unexpected error $e');
      rethrow;
    }

    HttpClient httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
    return httpClient;
  }

  static Future<http.Client> createLEClient() async {
    IOClient client = IOClient(await Shared.customHttpClient());
    return client;
  }
}
