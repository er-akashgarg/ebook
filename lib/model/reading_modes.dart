
class ReadingModes {

  bool text;
  bool image;

	ReadingModes.fromJsonMap(Map<String, dynamic> map): 
		text = map["text"],
		image = map["image"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = text;
		data['image'] = image;
		return data;
	}
}
