/// 'justSomeSampleText' 转化为  'JUST_SOME_SAMPLE_TEXT'
import 'package:flutter_test/flutter_test.dart';
import 'package:elk_chat/protocol/util/string_util.dart';

void main() {
  group('getConstantCase', () {
    StringUtil stringUtil = StringUtil();
    test('justSomeSampleText 等于 JUST_SOME_SAMPLE_TEXT', () {
      expect(stringUtil.getConstantCase(text: 'justSomeSampleText'),
          'JUST_SOME_SAMPLE_TEXT');
    });
    test('justSomeSample_Text 等于 JUST-SOME-SAMPLE-TEXT', () {
      expect(
          stringUtil.getConstantCase(
              text: 'justSomeSample_Text', separator: '-'),
          'JUST-SOME-SAMPLE-TEXT');
    });

    test('justSomeSample_Text again, the count should be 2', () {
      expect(
          stringUtil.getConstantCase(
              text: 'justSomeSample_Text', separator: '-'),
          'JUST-SOME-SAMPLE-TEXT');
      expect(stringUtil.count, 2);
    });

    test('justSomeSample_Text again, the count should still be  2', () {
      expect(stringUtil.getConstantCase(text: 'justSomeSampleText'),
          'JUST_SOME_SAMPLE_TEXT');
      expect(stringUtil.count, 2);
    });
    test('caches should be 2', () {
      expect(stringUtil.caches.length, 2);
    });

    test('caches should be clear', () {
      stringUtil.clear();
      expect(stringUtil.count, 0);
      expect(stringUtil.caches.length, 0);
    });
  }, skip: false);
}
