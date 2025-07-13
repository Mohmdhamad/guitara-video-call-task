class BookModel {
  final String id;
  final String title;
  final List<String> authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final String? thumbnail;
  final String? previewLink;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.thumbnail,
    this.previewLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
    final imageLinks = volumeInfo['imageLinks'] ?? {};

    return BookModel(
      id: json['id'] ?? '',
      title: volumeInfo['title'] ?? 'No title',
      authors: List<String>.from(volumeInfo['authors'] ?? []),
      publisher: volumeInfo['publisher'],
      publishedDate: volumeInfo['publishedDate'],
      description: volumeInfo['description'],
      thumbnail: imageLinks['thumbnail'],
      previewLink: volumeInfo['previewLink'],
    );
  }
}
