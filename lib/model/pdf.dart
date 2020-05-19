
class Pdf {

  bool isAvailable;
  String acsTokenLink;

	Pdf.fromJsonMap(Map<String, dynamic> map): 
		isAvailable = map["isAvailable"],
		acsTokenLink = map["acsTokenLink"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isAvailable'] = isAvailable;
		data['acsTokenLink'] = acsTokenLink;
		return data;
	}
}
