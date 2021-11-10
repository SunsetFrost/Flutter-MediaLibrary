class BookInfo {
  BookInfo({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  });
  late final String kind;
  late final String id;
  late final String etag;
  late final String selfLink;
  late final VolumeInfo volumeInfo;
  late final SaleInfo saleInfo;
  late final AccessInfo accessInfo;

  BookInfo.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = VolumeInfo.fromJson(json['volumeInfo']);
    saleInfo = SaleInfo.fromJson(json['saleInfo']);
    accessInfo = AccessInfo.fromJson(json['accessInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['kind'] = kind;
    _data['id'] = id;
    _data['etag'] = etag;
    _data['selfLink'] = selfLink;
    _data['volumeInfo'] = volumeInfo.toJson();
    _data['saleInfo'] = saleInfo.toJson();
    _data['accessInfo'] = accessInfo.toJson();
    return _data;
  }
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printedPageCount,
    required this.dimensions,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });
  late final String title;
  late final List<String> authors;
  late final String publisher;
  late final String publishedDate;
  late final String description;
  late final List<IndustryIdentifiers> industryIdentifiers;
  late final ReadingModes readingModes;
  late final int pageCount;
  late final int printedPageCount;
  late final Dimensions dimensions;
  late final String printType;
  late final List<String> categories;
  late final double averageRating;
  late final int ratingsCount;
  late final String maturityRating;
  late final bool allowAnonLogging;
  late final String contentVersion;
  late final PanelizationSummary panelizationSummary;
  late final ImageLinks imageLinks;
  late final String language;
  late final String previewLink;
  late final String infoLink;
  late final String canonicalVolumeLink;

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors = List.castFrom<dynamic, String>(json['authors']);
    publisher = json['publisher'] ?? '';
    publishedDate = json['publishedDate'];
    description = json['description'];
    industryIdentifiers = List.from(json['industryIdentifiers'])
        .map((e) => IndustryIdentifiers.fromJson(e))
        .toList();
    readingModes = ReadingModes.fromJson(json['readingModes']);
    printedPageCount = json['printedPageCount'] ?? 0;
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : Dimensions(height: '', width: '', thickness: '');
    Dimensions(height: '0', width: '0', thickness: '0');
    printType = json['printType'];
    categories = List.castFrom<dynamic, String>(json['categories']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['authors'] = authors;
    _data['publisher'] = publisher;
    _data['publishedDate'] = publishedDate;
    _data['description'] = description;
    _data['industryIdentifiers'] =
        industryIdentifiers.map((e) => e.toJson()).toList();
    _data['readingModes'] = readingModes.toJson();
    _data['pageCount'] = pageCount;
    _data['printedPageCount'] = printedPageCount;
    _data['dimensions'] = dimensions.toJson();
    _data['printType'] = printType;
    _data['categories'] = categories;
    _data['averageRating'] = averageRating;
    _data['ratingsCount'] = ratingsCount;
    _data['maturityRating'] = maturityRating;
    _data['allowAnonLogging'] = allowAnonLogging;
    _data['contentVersion'] = contentVersion;
    _data['panelizationSummary'] = panelizationSummary.toJson();
    _data['imageLinks'] = imageLinks.toJson();
    _data['language'] = language;
    _data['previewLink'] = previewLink;
    _data['infoLink'] = infoLink;
    _data['canonicalVolumeLink'] = canonicalVolumeLink;
    return _data;
  }
}

class IndustryIdentifiers {
  IndustryIdentifiers({
    required this.type,
    required this.identifier,
  });
  late final String type;
  late final String identifier;

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['identifier'] = identifier;
    return _data;
  }
}

class ReadingModes {
  ReadingModes({
    required this.text,
    required this.image,
  });
  late final bool text;
  late final bool image;

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['image'] = image;
    return _data;
  }
}

class Dimensions {
  Dimensions({
    required this.height,
    required this.width,
    required this.thickness,
  });
  late final String height;
  late final String width;
  late final String thickness;

  Dimensions.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    thickness = json['thickness'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['height'] = height;
    _data['width'] = width;
    _data['thickness'] = thickness;
    return _data;
  }
}

class PanelizationSummary {
  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });
  late final bool containsEpubBubbles;
  late final bool containsImageBubbles;

  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['containsEpubBubbles'] = containsEpubBubbles;
    _data['containsImageBubbles'] = containsImageBubbles;
    return _data;
  }
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });
  late final String smallThumbnail;
  late final String thumbnail;

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['smallThumbnail'] = smallThumbnail;
    _data['thumbnail'] = thumbnail;
    return _data;
  }
}

class SaleInfo {
  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });
  late final String country;
  late final String saleability;
  late final bool isEbook;

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['saleability'] = saleability;
    _data['isEbook'] = isEbook;
    return _data;
  }
}

class AccessInfo {
  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });
  late final String country;
  late final String viewability;
  late final bool embeddable;
  late final bool publicDomain;
  late final String textToSpeechPermission;
  late final Epub epub;
  late final Pdf pdf;
  late final String webReaderLink;
  late final String accessViewStatus;
  late final bool quoteSharingAllowed;

  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = Epub.fromJson(json['epub']);
    pdf = Pdf.fromJson(json['pdf']);
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country'] = country;
    _data['viewability'] = viewability;
    _data['embeddable'] = embeddable;
    _data['publicDomain'] = publicDomain;
    _data['textToSpeechPermission'] = textToSpeechPermission;
    _data['epub'] = epub.toJson();
    _data['pdf'] = pdf.toJson();
    _data['webReaderLink'] = webReaderLink;
    _data['accessViewStatus'] = accessViewStatus;
    _data['quoteSharingAllowed'] = quoteSharingAllowed;
    return _data;
  }
}

class Epub {
  Epub({
    required this.isAvailable,
  });
  late final bool isAvailable;

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAvailable'] = isAvailable;
    return _data;
  }
}

class Pdf {
  Pdf({
    required this.isAvailable,
  });
  late final bool isAvailable;

  Pdf.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isAvailable'] = isAvailable;
    return _data;
  }
}
