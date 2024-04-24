class CharactersListInfo {
  final int count;
  final int pages;
  final String? next;

  CharactersListInfo({required this.count, required this.pages, this.next});

  factory CharactersListInfo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'count': int count, 'pages': int pages, 'next': String? next} =>
        CharactersListInfo(count: count, pages: pages, next: next),
      _ =>
        throw const FormatException("Failed to download characters list info!")
    };
  }
}
