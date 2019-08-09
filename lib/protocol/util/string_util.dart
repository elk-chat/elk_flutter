abstract class StringUtilInterface {
  Map<String, String> _caches;
  int _count;
  /// 可以将 'justSomeSampleText' 转化为  'JUST_SOME_SAMPLE_TEXT'
  String getConstantCase({String text, String separator = '_'});

  void clear();
}

class StringUtil extends StringUtilInterface {
  Map<String, String> _caches = {};
  Map<String, String> get caches => _caches;

  int _count = 0;
  int get count => _count;

  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  final RegExp _lowerAlphaRegex = RegExp('[a-z]');
  final RegExp _symbolRegex = RegExp(r'[ ./_\-]');

  void clear() {
    _count = 0;
    _caches.clear();
  }

  String getConstantCase({String text, String separator = '_'}) {
    String textKey = 'c-$text$separator';

    if (_caches[textKey] != null) {
      return _caches[textKey];
    }

    StringBuffer sb = new StringBuffer();
    List<String> words = [];
    bool isAllCaps = !text.contains(_lowerAlphaRegex);

    for (int i = 0; i < text.length; i++) {
      String char = new String.fromCharCode(text.codeUnitAt(i));
      String nextChar = (i + 1 == text.length
          ? null
          : new String.fromCharCode(text.codeUnitAt(i + 1)));

      if (_symbolRegex.hasMatch(char)) {
        continue;
      }

      sb.write(char);

      bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          _symbolRegex.hasMatch(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }
    String result =
        words.map((word) => word.toUpperCase()).toList().join(separator);
    _caches[textKey] = result;
    _count++;
    return result;
  }
}
