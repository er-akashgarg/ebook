import 'package:ebook/model/industry_identifiers.dart';
import 'package:ebook/model/reading_modes.dart';
import 'package:ebook/model/panelization_summary.dart';
import 'package:ebook/model/image_links.dart';

class VolumeInfo {

  String title;
  List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  List<IndustryIdentifiers> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  int averageRating;
  int ratingsCount;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

	VolumeInfo.fromJsonMap(Map<String, dynamic> map): 
		title = map["title"],
		authors = List<String>.from(map["authors"]),
		publisher = map["publisher"],
		publishedDate = map["publishedDate"],
		description = map["description"],
		industryIdentifiers = List<IndustryIdentifiers>.from(map["industryIdentifiers"].map((it) => IndustryIdentifiers.fromJsonMap(it))),
		readingModes = ReadingModes.fromJsonMap(map["readingModes"]),
		pageCount = map["pageCount"],
		printType = map["printType"],
		categories = List<String>.from(map["categories"]),
		averageRating = map["averageRating"],
		ratingsCount = map["ratingsCount"],
		maturityRating = map["maturityRating"],
		allowAnonLogging = map["allowAnonLogging"],
		contentVersion = map["contentVersion"],
		panelizationSummary = PanelizationSummary.fromJsonMap(map["panelizationSummary"]),
		imageLinks = ImageLinks.fromJsonMap(map["imageLinks"]),
		language = map["language"],
		previewLink = map["previewLink"],
		infoLink = map["infoLink"],
		canonicalVolumeLink = map["canonicalVolumeLink"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = title;
		data['authors'] = authors;
		data['publisher'] = publisher;
		data['publishedDate'] = publishedDate;
		data['description'] = description;
		data['industryIdentifiers'] = industryIdentifiers != null ? 
			this.industryIdentifiers.map((v) => v.toJson()).toList()
			: null;
		data['readingModes'] = readingModes == null ? null : readingModes.toJson();
		data['pageCount'] = pageCount;
		data['printType'] = printType;
		data['categories'] = categories;
		data['averageRating'] = averageRating;
		data['ratingsCount'] = ratingsCount;
		data['maturityRating'] = maturityRating;
		data['allowAnonLogging'] = allowAnonLogging;
		data['contentVersion'] = contentVersion;
		data['panelizationSummary'] = panelizationSummary == null ? null : panelizationSummary.toJson();
		data['imageLinks'] = imageLinks == null ? null : imageLinks.toJson();
		data['language'] = language;
		data['previewLink'] = previewLink;
		data['infoLink'] = infoLink;
		data['canonicalVolumeLink'] = canonicalVolumeLink;
		return data;
	}
}
