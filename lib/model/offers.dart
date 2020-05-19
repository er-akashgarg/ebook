import 'package:ebook/model/list_price.dart';
import 'package:ebook/model/retail_price.dart';

class Offers {

  int finskyOfferType;
  ListPrice listPrice;
  RetailPrice retailPrice;

	Offers.fromJsonMap(Map<String, dynamic> map): 
		finskyOfferType = map["finskyOfferType"],
		listPrice = ListPrice.fromJsonMap(map["listPrice"]),
		retailPrice = RetailPrice.fromJsonMap(map["retailPrice"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['finskyOfferType'] = finskyOfferType;
		data['listPrice'] = listPrice == null ? null : listPrice.toJson();
		data['retailPrice'] = retailPrice == null ? null : retailPrice.toJson();
		return data;
	}
}
