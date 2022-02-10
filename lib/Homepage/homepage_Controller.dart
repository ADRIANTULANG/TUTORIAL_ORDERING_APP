import 'package:flutterbasics/Homepage/homepage_api.dart';
import 'package:flutterbasics/Homepage/homepage_model.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  @override
  void onInit() {
    get_top_three_Stores();
    get_popular_Stores();
    get_all_Stores();
    super.onInit();
  }

  RxList<TopthreeStore> storesTopThree = <TopthreeStore>[].obs;
  RxList<PopularStores> storesPopular = <PopularStores>[].obs;
  RxList<AllStores> storesAll = <AllStores>[].obs;

  get_top_three_Stores() async {
    var result = await HomepageApi.getStores_Top_Three();
    storesTopThree.assignAll(result);
  }

  get_popular_Stores() async {
    var result = await HomepageApi.getStores_Popular_Stores();
    storesPopular.assignAll(result);
  }

  get_all_Stores() async {
    var result = await HomepageApi.getStores_all_stores();
    storesAll.assignAll(result.reversed);
  }
}
