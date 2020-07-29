class Article {
  final String name;
  bool mute = false;
  static final Map<String, Article> _cache = <String, Article>{}; // 缓存保存对象
  factory Article(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id];
    } else {
      final logger = new Article._internal(id);
      _cache[id] = logger;
      return logger;
    }
  }

  Article._internal(this.name); // 命名构造函数
}
