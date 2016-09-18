// Copyright (c) 2016, xe52360. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:args/args.dart';
import 'package:dartCLIExample/dartCLIExample.dart' as dartCLIExample;

ArgResults argResults;

void main(List<String> arguments) {
  final ArgParser argParser = new ArgParser()
    ..addOption('name', abbr: 'n', defaultsTo: 'World',
        help: "Who would you like to greet?")
    ..addFlag('help', abbr: 'h', negatable: false,
        help: "Displays this help information.");

  argResults = argParser.parse(arguments);

  final String name = argResults['name'];
  if (argResults['help']) {
    print("""
** HELP **
${argParser.usage}
    """);
  }
  print("Hello, $name!, is  ${dartCLIExample.calculate()}");
}