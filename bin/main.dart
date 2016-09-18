// Copyright (c) 2016, xe52360. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:io';
import 'package:args/args.dart';
import 'package:dartCLIExample/dartCLIExample.dart' as dartCLIExample;

ArgResults argResults;

void main(List<String> arguments) {
  final ArgParser argParser = new ArgParser()
    ..addOption('title', abbr: 't',
        help: "The title will be inserted into the <title> tag.")
    ..addOption('filename', abbr: 'f', defaultsTo: 'index.html',
        help: "Optional. Output file name. (Default: index.html)");

  argResults = argParser.parse(arguments);

  final String title = argResults['title'];

  if (title == null) {
    handleError("Missing required argument: title");
  }
  else {
    final String filename = argResults['filename'];
    final String output = """<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>$title</title>
</head>
<body>

</body>
</html>
    """;

    new File(filename).writeAsStringSync(output);
    stdout.writeln("File saved: $filename");
  }
}

void handleError(String msg) {
  stderr.writeln(msg);
  exitCode = 2;
}