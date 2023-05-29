import 'dart:io';

typedef StringCallback = void Function(String);
typedef FileCallback = void Function(File);
typedef ValidatorCallback = String? Function(String? value);