import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class BookInfo {
  BookInfo(
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  );
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;

  factory BookInfo.fromJson(Map<String, dynamic> json) =>
      _$BookInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookInfoToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  VolumeInfo(
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.readingModes,
    this.pageCount,
    this.printedPageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    ImageLinks? imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  ) : imageLinks = imageLinks ?? ImageLinks(thumbnail: '', proxyThumbnail: '');

  final String title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final ReadingModes? readingModes;
  final int? pageCount;
  final int? printedPageCount;
  final String? printType;
  final List<String>? categories;
  final double? averageRating;
  final int? ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final ImageLinks imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class ReadingModes {
  ReadingModes({
    required this.text,
    required this.image,
  });
  final bool text;
  final bool image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ImageLinks {
  ImageLinks({
    required this.thumbnail,
    required this.proxyThumbnail,
  });
  final String thumbnail;

  @JsonKey(name: 'smallThumbnail', fromJson: imageToProxyImagePath)
  final String proxyThumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);

  static String imageToProxyImagePath(String imagePath) {
    final id = Uri.parse(imagePath).queryParameters['id'] ?? '';
    return '/book/image/' + id;
  }
}

@JsonSerializable()
class SaleInfo {
  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });
  final String country;
  final String saleability;
  final bool isEbook;

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}

@JsonSerializable()
class Epub {
  Epub({
    required this.isAvailable,
    this.acsTokenLink = '',
  });
  final bool isAvailable;
  String acsTokenLink;

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}

@JsonSerializable()
class Pdf {
  Pdf({
    required this.isAvailable,
  });
  final bool isAvailable;

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);
}
