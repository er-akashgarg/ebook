
class IndustryIdentifiers {

  String type;
  String identifier;

	IndustryIdentifiers.fromJsonMap(Map<String, dynamic> map): 
		type = map["type"],
		identifier = map["identifier"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = type;
		data['identifier'] = identifier;
		return data;
	}
}
