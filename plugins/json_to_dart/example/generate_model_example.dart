import 'dart:io';
import "package:path/path.dart" show dirname, join, normalize;
import '../lib/json_to_dart.dart';

String _scriptPath() {
  var script = Platform.script.toString();
  if (script.startsWith("file:///")) {
    script = script.substring(8);

    return script;
  }

  if (script.startsWith("file://")) {
    script = script.substring(7);
    return script;
  }

  final idx = script.indexOf("file:/");
  script = script.substring(idx + 5);
  return script;
}

main() {
  final classGenerator = new ModelGenerator('Sample');
  final currentDirectory = dirname(_scriptPath());
  final filePath = normalize(join(currentDirectory, 'sample.json'));
  final jsonRawData = new File(filePath).readAsStringSync();
  String dartClassesStr = classGenerator.generateDartClasses(jsonRawData);
  print(dartClassesStr);
}
