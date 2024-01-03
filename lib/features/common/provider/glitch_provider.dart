import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fragmentProgramsProvider = FutureProvider((ref) async {
  return await _loadFragmentProgram(uiShader);
});

const String _shaders = 'assets/shaders';
const String uiShader = '$_shaders/ui_glitch.frag';
const String asciiShader = '$_shaders/ui_ascii.frag';
const String ascii2Shader = '$_shaders/ui_ascii_2.frag';
const String ascii3Shader = '$_shaders/ui_ascii_3.frag';

Future<FragmentProgram> _loadFragmentProgram(String path) async {
  return (await FragmentProgram.fromAsset(path));
}
