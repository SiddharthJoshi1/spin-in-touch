import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:spin_in_touch/Domain/Entities/spinner_list.dart';

const String localQuestionJSONPath = 'questions.json';

abstract class LocalFileJSONParser {
  FutureOr<SpinnerList> loadSpinnerContents();
}

class LocalFileJSONParserImpl implements LocalFileJSONParser {
  @override
  FutureOr<SpinnerList> loadSpinnerContents() async {
    try {
      String jsonFileStringContents = "";
      if (kIsWeb) {
        jsonFileStringContents = await rootBundle
            .loadString('lib/Data/StoredData/spinner_items.json');
      } else {
        File jsonFile = File('lib/Data/StoredData/spinner_items.json');
        jsonFileStringContents = await jsonFile.readAsString();
      }
      var decodedJSON = jsonDecode(jsonFileStringContents);
      SpinnerList spinnerList = SpinnerList.fromJson(decodedJSON);
      return spinnerList;
    } catch (exception) {
      print(exception);
      return SpinnerList([]);
    }
  }
}
