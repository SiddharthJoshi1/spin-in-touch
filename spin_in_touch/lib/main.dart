import 'package:flutter/material.dart';
import 'package:spin_in_touch/Data/sources/local_file.dart';
import 'package:spin_in_touch/Data/spinner_repository_impl.dart';
import 'package:spin_in_touch/app.dart';

void main() {
  LocalFileJSONParserImpl localFileJSONParserImpl = LocalFileJSONParserImpl();

  runApp(MyApp(
    spinnerRepository:
        SpinnerRepositoryImpl(localFileJSONParser: localFileJSONParserImpl),
  ));
}
