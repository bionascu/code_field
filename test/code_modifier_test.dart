import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:code_text_field/src/code_modifier.dart';
import 'package:code_text_field/src/code_controller.dart';

void main() {
  group("TabModifier", () {
    test(
        'TabModifier should insert tabSpaces space characters at the start of the selected text',
        () {
      final tabModifier = TabModifier();
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 0);
      final editorParams = EditorParams(tabSpaces: 2);

      final result = tabModifier.updateString(text, selection, editorParams);

      expect(result?.text, '  Lorem ipsum dolor sit amet');
      print(result?.selection.baseOffset);
      print('\n');
      print(result?.selection.extentOffset);
    });

    test(
        'TabModifier should insert tabSpaces space characters inside the selected text, based on the offset',
        () {
      final tabModifier = TabModifier();
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 7);
      final editorParams = EditorParams(tabSpaces: 3);

      final result = tabModifier.updateString(text, selection, editorParams);

      expect(result?.text, 'Lorem i   psum dolor sit amet');
    });

    test(
        'TabModifier should insert tabSpaces space characters at the end of the selected text',
        () {
      final tabModifier = TabModifier();
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 26);
      final editorParams = EditorParams(tabSpaces: 2);

      final result = tabModifier.updateString(text, selection, editorParams);

      expect(result?.text, 'Lorem ipsum dolor sit amet  ');
    });
  });
}
