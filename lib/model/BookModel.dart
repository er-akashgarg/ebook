import 'package:ebook/model/items.dart';

class BookModel {

  String kind;
  int totalItems;
  List<Items> items;

	BookModel.fromJsonMap(Map<String, dynamic> map): 
		kind = map["kind"],
		totalItems = map["totalItems"],
		items = List<Items>.from(map["items"].map((it) => Items.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kind'] = kind;
		data['totalItems'] = totalItems;
		data['items'] = items != null ? 
			this.items.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
