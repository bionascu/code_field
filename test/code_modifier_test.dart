import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:code_text_field/src/code_modifier.dart';
import 'package:code_text_field/src/code_controller.dart';

void main() {
  group('TabModifier', () {
    TabModifier tabModifier = TabModifier();

    test(
        'TabModifier should insert tabSpaces space characters at the start of the selected text',
        () {
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 0);
      final editorParams = EditorParams(tabSpaces: 2);
      final result = tabModifier.updateString(text, selection, editorParams);
      expect(result?.text, '  Lorem ipsum dolor sit amet');
      expect(result?.selection.baseOffset, 2);
      expect(result?.selection.extentOffset, 2);
    });

    test(
        'TabModifier should insert tabSpaces space characters inside the selected text, based on the offset',
        () {
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 7);
      final editorParams = EditorParams(tabSpaces: 3);
      final result = tabModifier.updateString(text, selection, editorParams);
      expect(result?.text, 'Lorem i   psum dolor sit amet');
      expect(result?.selection.baseOffset, 10);
      expect(result?.selection.extentOffset, 10);
    });

    test(
        'TabModifier should insert tabSpaces space characters at the end of the selected text',
        () {
      final text = 'Lorem ipsum dolor sit amet';
      final selection = TextSelection.collapsed(offset: 26);
      final editorParams = EditorParams(tabSpaces: 2);
      final result = tabModifier.updateString(text, selection, editorParams);
      expect(result?.text, 'Lorem ipsum dolor sit amet  ');
      expect(result?.selection.baseOffset, 28);
      expect(result?.selection.extentOffset, 28);
    });
  });

  group('DoubleOpenQuoteModifier tests', () {
    DoubleOpenQuoteModifier modifier = DoubleOpenQuoteModifier();
    EditorParams params = EditorParams();

    test('Insert double quote at the start of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 0);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, '"Hello world');
      expect(result?.selection.start, 1);
      expect(result?.selection.end, 1);
    });

    test('Insert double quote inside the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 6);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, 'Hello "world');
      expect(result?.selection.start, 7);
      expect(result?.selection.end, 7);
    });

    test('Insert double quote at the end of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 11);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, 'Hello world"');
      expect(result?.selection.start, 12);
      expect(result?.selection.end, 12);
    });
  });

  group('DoubleCloseQuoteModifier tests', () {
    DoubleCloseQuoteModifier modifier = DoubleCloseQuoteModifier();
    EditorParams params = EditorParams();

    test('Insert double quote at the start of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 0);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, '"Hello world');
      expect(result?.selection.start, 1);
      expect(result?.selection.end, 1);
    });

    test('Insert double quote inside the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 6);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, 'Hello "world');
      expect(result?.selection.start, 7);
      expect(result?.selection.end, 7);
    });

    test('Insert double quote at the end of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 11);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, 'Hello world"');
      expect(result?.selection.start, 12);
      expect(result?.selection.end, 12);
    });
  });

  group('SingleOpenQuoteModifier tests', () {
    SingleOpenQuoteModifier modifier = SingleOpenQuoteModifier();
    EditorParams params = EditorParams();

    test('Insert single quote at the start of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 0);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "'Hello world");
      expect(result?.selection.start, 1);
      expect(result?.selection.end, 1);
    });

    test('Insert single quote inside the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 6);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "Hello 'world");
      expect(result?.selection.start, 7);
      expect(result?.selection.end, 7);
    });

    test('Insert single quote at the end of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 11);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "Hello world'");
      expect(result?.selection.start, 12);
      expect(result?.selection.end, 12);
    });
  });

  group('SingleCloseQuoteModifier tests', () {
    SingleCloseQuoteModifier modifier = SingleCloseQuoteModifier();
    EditorParams params = EditorParams();

    test('Insert single close quote at the start of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 0);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "'Hello world");
      expect(result?.selection.start, 1);
      expect(result?.selection.end, 1);
    });

    test('Insert single close quote inside the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 6);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "Hello 'world");
      expect(result?.selection.start, 7);
      expect(result?.selection.end, 7);
    });

    test('Insert single close quote at the end of the selected text', () {
      final text = 'Hello world';
      final sel = TextSelection.collapsed(offset: 11);
      final result = modifier.updateString(text, sel, params);
      expect(result?.text, "Hello world'");
      expect(result?.selection.start, 12);
      expect(result?.selection.end, 12);
    });
  });
}
