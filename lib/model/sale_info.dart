import 'package:ebook/model/list_price.dart';
import 'package:ebook/model/retail_price.dart';
import 'package:ebook/model/offers.dart';

class SaleInfo {

  String country;
  String saleability;
  bool isEbook;
  ListPrice listPrice;
  RetailPrice retailPrice;
  String buyLink;
  List<Offers> offers;

	SaleInfo.fromJsonMap(Map<String, dynamic> map): 
		country = map["country"],
		saleability = map["saleability"],
		isEbook = map["isEbook"],
		listPrice = ListPrice.fromJsonMap(map["listPrice"]),
		retailPrice = RetailPrice.fromJsonMap(map["retailPrice"]),
		buyLink = map["buyLink"],
		offers = List<Offers>.from(map["offers"].map((it) => Offers.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['country'] = country;
		data['saleability'] = saleability;
		data['isEbook'] = isEbook;
		data['listPrice'] = listPrice == null ? null : listPrice.toJson();
		data['retailPrice'] = retailPrice == null ? null : retailPrice.toJson();
		data['buyLink'] = buyLink;
		data['offers'] = offers != null ? 
			this.offers.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
