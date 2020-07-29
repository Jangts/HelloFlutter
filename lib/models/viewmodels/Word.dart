class Word {
  final String name;
  bool mute = false;
  static final Map<String, Word> _cache = <String, Word>{}; // 缓存保存对象
  factory Word(String chars) {
    if (_cache.containsKey(chars)) {
      return _cache[chars];
    } else {
      final logger = new Word._internal(chars);
      _cache[chars] = logger;
      return logger;
    }
  }

  Word._internal(this.name); // 命名构造函数
}
