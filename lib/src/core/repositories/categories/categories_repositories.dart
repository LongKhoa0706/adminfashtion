import 'package:adminfashtion/src/core/model/categories.dart';
import 'package:adminfashtion/src/core/model/subcategory.dart';

abstract class CategoriesRepository {
  Future addCategory(Category category);

  Future<List<Category>> getCategory(String type);

  void getAll();

  Future addSubCategory(SubCategory subCategory,String idCategory );


}
