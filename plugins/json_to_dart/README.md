# JSON to Dart

[![Build Status](https://travis-ci.org/javiercbk/json_to_dart.svg?branch=master)](https://travis-ci.org/javiercbk/json_to_dart)

Given a JSON string, this library will generate all the necesary Dart classes to parse and generate JSON.

This library is designed to generate Flutter friendly model classes following the [flutter's doc recommendation](https://flutter.io/json/#serializing-json-manually-using-dartconvert).
## Caveats 
- In an array of objects, it is assumed that the first object is representative of the rest of them.
- When an empty array is given, it will create a List<Null>. Such weird behaviour should warn the user that there is no data to extract.
- Equal structures are not detected yet (Equal classes are going to be created over and over).
- Dart automatically casts doubles without decimals (like 10.0) to int. Use doubles with at least one decimal number.
- Properties named with funky names (like "!breaks", "|breaks", etc) or keyword (like "this", "break", "class", etc) will produce syntax errors.

