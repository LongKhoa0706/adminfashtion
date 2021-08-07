import 'dart:convert';

import 'package:adminfashtion/src/core/model/categories.dart';
import 'package:adminfashtion/src/core/model/subcategory.dart';
import 'package:adminfashtion/src/core/repositories/categories/categories_repositories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CategoryRepositoryImpl implements CategoriesRepository {
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  // String? keyCategoryId;

  @override
  Future addCategory(Category category) async {
    try {
       String keyCategoryId = firebaseDatabase.reference().push().key;
      await firebaseDatabase
          .reference()
          .child("Category")
          .child(keyCategoryId)
          .set(category.copyWith(key: keyCategoryId).toJson());

    } on FirebaseException catch (e) {
      print(e.code);
      throw e.message!;
    }
  }

  Future<List<Category>> getCategory(String type) async {
    List<Category> listCategory = [];
    try {
      await firebaseDatabase
          .reference()
          .child('Category')

          .once()
          .then((DataSnapshot dataSnapshot) {
        if (dataSnapshot.value != null) {
          final cleanup = jsonDecode(jsonEncode(dataSnapshot.value));
          Map<String, dynamic> da = cleanup;
          da.forEach((key, value) {
            listCategory.add(Category.fromJson(value));
          });
        } else {

        }
        return listCategory;
      });
    } on FirebaseException catch (e) {
      throw e.message!;
    }
    print(listCategory.length);
    return listCategory;
  }

  @override
  void getAll() {}

  @override
  Future addSubCategory(SubCategory subCategory,String idCategory) async {
    try {
      String keySubCategoryId = firebaseDatabase.reference().push().key;
      await firebaseDatabase
          .reference()
          .child("SubCategory1")
          .child(idCategory)
          .child(keySubCategoryId)
          .set(subCategory.copyWith(key: keySubCategoryId,keyCategoryId: keySubCategoryId).toJson());

    } on FirebaseException catch (e) {
      print(e.code);
      throw e.message!;
    }
  }
}
