import 'package:adminfashtion/src/core/enum/viewstate.dart';
import 'package:adminfashtion/src/core/model/categories.dart';
import 'package:adminfashtion/src/core/model/subcategory.dart';
import 'package:adminfashtion/src/core/repositories/categories/categories_repo_impl.dart';
import 'package:adminfashtion/src/core/viewmodel/baseviewmodel.dart';

class CategoryViewModel extends BaseViewModel{
  CategoryRepositoryImpl categoryRepositoryImpl = CategoryRepositoryImpl();
  List<Category> listCategory = [];
  bool isLoading = false;


  // CategoryViewModel(){
  //   getAllCategory("");
  // }

  Future add(Category category) async {
    setState(ViewState.Busy);
    // isLoading = true;
    notifyListeners();

    await categoryRepositoryImpl.addCategory(category);
    await getAllCategory("type");

    setState(ViewState.Idle);

    // isLoading = false;
    notifyListeners();
  }

  Future<List<Category>> getAllCategory(String type) async{
    // setState(ViewState.Busy);/
    isLoading = true;
    notifyListeners();

    listCategory =  await categoryRepositoryImpl.getCategory(type);
    // print(listCategory.length);
    // setState(ViewState.Idle);
    isLoading = false;
    notifyListeners();
    return listCategory;
  }

  Future addSubCategory(SubCategory subCategory,String idCategory ) async {
    setState(ViewState.Busy);
    await categoryRepositoryImpl.addSubCategory(subCategory,idCategory);
    setState(ViewState.Idle);

  }


  void loadding(){
    setState(ViewState.Busy);
  }
  void complete(){
    setState(ViewState.Idle);
  }

}