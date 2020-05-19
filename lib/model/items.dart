import 'package:ebook/model/access_info.dart';
import 'package:ebook/model/sale_info.dart';
import 'package:ebook/model/search_info.dart';
import 'package:ebook/model/volume_info.dart';

class Items {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo searchInfo;

  Items(this.volumeInfo);

  Items.fromJsonMap(Map<String, dynamic> map)
      : kind = map["kind"],
        id = map["id"],
        etag = map["etag"],
        selfLink = map["selfLink"],
        volumeInfo = VolumeInfo.fromJsonMap(map["volumeInfo"]),
        saleInfo = SaleInfo.fromJsonMap(map["saleInfo"]),
        accessInfo = AccessInfo.fromJsonMap(map["accessInfo"]),
        searchInfo = SearchInfo.fromJsonMap(map["searchInfo"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = kind;
    data['id'] = id;
    data['etag'] = etag;
    data['selfLink'] = selfLink;
    data['volumeInfo'] = volumeInfo == null ? null : volumeInfo.toJson();
    data['saleInfo'] = saleInfo == null ? null : saleInfo.toJson();
    data['accessInfo'] = accessInfo == null ? null : accessInfo.toJson();
    data['searchInfo'] = searchInfo == null ? null : searchInfo.toJson();
    return data;
  }
}
