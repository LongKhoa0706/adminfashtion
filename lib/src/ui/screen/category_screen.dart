import 'package:adminfashtion/src/core/enum/viewstate.dart';
import 'package:adminfashtion/src/core/model/categories.dart';
import 'package:adminfashtion/src/core/model/subcategory.dart';
import 'package:adminfashtion/src/core/viewmodel/category_viewmodel.dart';
import 'package:adminfashtion/src/ui/util/dialog_load.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryViewModel? categoryViewModel;
  TextEditingController titleController1 = TextEditingController();
  TextEditingController titleController2 = TextEditingController();
  TextEditingController titleController3 = TextEditingController();
  String? keyIdCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // categoryViewModel = CategoryViewModel()..getAllCategory("a");
    categoryViewModel = Provider.of<CategoryViewModel>(context,listen: false);
    categoryViewModel!.getAllCategory("a");

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,size: 18,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Category",style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Column(
        children: [
          Autocomplete<Category>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              return categoryViewModel!.listCategory
                  .where((Category continent) => continent.title!.toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase())
              )
                  .toList();
            },
            displayStringForOption: (Category option) => option.title!,
            fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted
                ) {
              titleController1 = fieldTextEditingController;
              return TextField(
                controller: titleController1,
                focusNode: fieldFocusNode,
                style: const TextStyle(fontWeight: FontWeight.bold),
              );
            },
            onSelected: (Category selection) {
              keyIdCategory = selection.key;
            },
            optionsViewBuilder: (
                BuildContext context,
                AutocompleteOnSelected<Category> onSelected,
                Iterable<Category> options
                ) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1,1),
                          )
                        ]
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Category option = options.elementAt(index);


                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(option.title!, style: const TextStyle(color: Colors.black)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),

          TextFormField(
            controller: titleController2,
            decoration: InputDecoration(
              hintText: "Category level 2",
            ),
          ),

          TextFormField(
            controller: titleController3,
            decoration: InputDecoration(
              hintText: "Category level 3",
            ),
          ),

          Consumer<CategoryViewModel>(
            builder: (_, value, Widget? child) {
              return value.state == ViewState.Busy ? Center(child: showProgress(context),) : RaisedButton(
                onPressed: (){
                  var index =categoryViewModel!.listCategory.indexWhere((element) => element.title == titleController1.text);

                  if(index == -1 ){
                    value.add(Category(
                      title: titleController1.text,
                      createAt: DateTime.now().toString(),
                    ));

                  }else{
                    if (titleController2.text.isNotEmpty) {
                      categoryViewModel!.addSubCategory(SubCategory(
                        title: titleController2.text,
                        createAt: DateTime.now().toString(),
                      ),keyIdCategory!);
                    }
                  }



                },
                child:  Text("Thêm"),
              );
            },
          ),


          // categoryViewModel.isLoading


          // ChangeNotifierProvider.value(
          //   value: categoryViewModel,
          //   child: categoryViewModel!.isLoading ? CircularProgressIndicator() : Column(
          //     children: categoryViewModel!.listCategory.map((e) => Texsst(e.title!)).toList(),
          //   ),
          // ),

          // ChangeNotifierProvider(
          //   // create: categoryViewModel!..getAllCategory("a"),
          //   create: (context)=>CategoryViewModel()..getAllCategory("a"),
          //   child: Builder(builder: (BuildContext context) {
          //     final model = Provider.of<CategoryViewModel>(context);
          //     return  model.isLoading ? CircularProgressIndicator() : Column(
          //         children: model.listCategory.map((e) => Text(e.title!)).toList());
          //   },),
          // )

          // categoryViewModel?.state == ViewState.Busy ? CircularProgressIndicator() :
          // Row(
          //   children: [
          //     categoryViewModel!.listCategory.length != 0 ? DropdownButtonHideUnderline(
          //       child: DropdownButton<Category>(
          //         hint: Text('Status'),
          //         onChanged: ( category){
          //           setState(() {
          //             selectCategory = category;
          //           });
          //         },
          //         // value: selectCategory,
          //         items: categoryViewModel?.listCategory.map((e){
          //           return DropdownMenuItem<Category>(
          //             value: e,
          //             child: Text(e.title!,style: TextStyle(
          //               color: Theme.of(context).primaryColor,
          //             ),),
          //           );
          //         }).toList(),
          //       ),
          //     ) : Text("NOT FOUNT"),
          //
          //
          //   ],
          // ),
        ],
      ),
    );
  }
}

