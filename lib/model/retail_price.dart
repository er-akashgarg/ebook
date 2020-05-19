
class RetailPrice {

  double amount;
  String currencyCode;

	RetailPrice.fromJsonMap(Map<String, dynamic> map): 
		amount = map["amount"],
		currencyCode = map["currencyCode"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['amount'] = amount;
		data['currencyCode'] = currencyCode;
		return data;
	}
}
