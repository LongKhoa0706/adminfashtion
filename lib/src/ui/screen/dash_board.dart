import 'package:adminfashtion/src/core/enum/viewstate.dart';
import 'package:adminfashtion/src/core/model/categories.dart';
import 'package:adminfashtion/src/core/viewmodel/category_viewmodel.dart';
import 'package:adminfashtion/src/ui/router/router_path.dart';
import 'package:adminfashtion/src/ui/screen/add_product.dart';
import 'package:adminfashtion/src/ui/screen/baseview.dart';
import 'package:adminfashtion/src/ui/screen/category_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final titleCategoriesController = TextEditingController();

  final titleProductController = TextEditingController();

  final descripController = TextEditingController();

  final priceController = TextEditingController();

  final amountProduct = TextEditingController();

  final colorController = TextEditingController();

  final sizeController = TextEditingController();

  final stockQuantityController = TextEditingController();

  CategoryViewModel? categoryViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    categoryViewModel = Provider.of<CategoryViewModel>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            // TextFormField(
            //   controller: titleCategoriesController,
            // ),
            // RaisedButton(
            //   onPressed: () {
            //     Provider.of<CategoryViewModel>(context, listen: false)
            //       ..add(
            //         Category(
            //             urlImage: "d",
            //             title: titleCategoriesController.text,
            //             createAt: dateTime.toString()),
            //       );
            //   },
            //   child: Text("ad1d"),
            // ),
            // RaisedButton(
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProduct()));
            //   },
            //   child: Text("11"),
            // ),
            // Container(
            //   width: 50,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color: Colors.redAccent,
            //   ),
            // ),
            // TextFormField(
            //   controller: titleCategoriesController,
            // ),
            //
            // TextFormField(
            //   controller: titleCategoriesController,
            // ),
            // TextFormField(
            //   controller: titleCategoriesController,
            // ),
            // ExpansionTile(
            //   title: Text('Nam'),
            //   onExpansionChanged: (value ){
            //     if(value){
            //       categoryViewModel!.getAllCategory('men');
            //     }
            //   },
            //   children: [
            //     categoryViewModel!.state == ViewState.Busy ? CircularProgressIndicator() : Column(
            //       children: categoryViewModel!.listCategory.map((e){
            //         return InkWell(
            //           onTap: (){
            //             print(e.title!);
            //           },
            //           child: Text(e.title!),
            //         );
            //       }).toList(),
            //     )
            //   ]
            // ),
            // ExpansionTile(
            //     title: Text('Nữ'),
            //     onExpansionChanged: (value ){
            //       if(value){
            //         categoryViewModel!.getAllCategory('women');
            //       }
            //     },
            //     children: [
            //       categoryViewModel!.state == ViewState.Busy ? CircularProgressIndicator() : Column(
            //         children: categoryViewModel!.listCategory.map((e){
            //           return Text(e.title!);
            //         }).toList(),
            //       )
            //     ]
            // ),
            // Row(
            //   children: [
            //     Expanded(child: TextFormField()),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(child: TextFormField()),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(child: TextFormField()),
            //   ],
            // )
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, CategoryScreens);
                      },
                      child: buildBox(
                          title: "Category", icon: Icons.ac_unit, value: "300"),
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: buildBox(
                        title: "Customer",
                        icon: Icons.person_outline,
                        value: "200")),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: buildBox(
                        title: "Product",
                        icon: FontAwesomeIcons.box,
                        value: "a")),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: buildBox(
                        title: "Order",
                        icon: FontAwesomeIcons.cartPlus,
                        value: "a")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBox(
      {required String title, required IconData icon, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.1),
              offset: Offset(2, 2),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
