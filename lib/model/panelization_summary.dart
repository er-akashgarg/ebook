
class PanelizationSummary {

  bool containsEpubBubbles;
  bool containsImageBubbles;

	PanelizationSummary.fromJsonMap(Map<String, dynamic> map): 
		containsEpubBubbles = map["containsEpubBubbles"],
		containsImageBubbles = map["containsImageBubbles"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['containsEpubBubbles'] = containsEpubBubbles;
		data['containsImageBubbles'] = containsImageBubbles;
		return data;
	}
}
