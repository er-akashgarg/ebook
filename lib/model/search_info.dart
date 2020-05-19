
class SearchInfo {

  String textSnippet;

	SearchInfo.fromJsonMap(Map<String, dynamic> map): 
		textSnippet = map["textSnippet"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['textSnippet'] = textSnippet;
		return data;
	}
}
