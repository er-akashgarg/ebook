
class ImageLinks {

  String smallThumbnail;
  String thumbnail;

	ImageLinks.fromJsonMap(Map<String, dynamic> map): 
		smallThumbnail = map["smallThumbnail"],
		thumbnail = map["thumbnail"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['smallThumbnail'] = smallThumbnail;
		data['thumbnail'] = thumbnail;
		return data;
	}
}
