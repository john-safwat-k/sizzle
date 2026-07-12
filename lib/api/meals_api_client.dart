import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sizzle/models/categories_response.dart';

part 'meals_api_client.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class MealsApiClient {
  factory MealsApiClient(Dio dio) = _MealsApiClient;





  @GET("/categories.php")
  Future<CategoriesResponse> getCategories();

}
