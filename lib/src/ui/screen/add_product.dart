import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<TextEditingController>? controllers = [];
  List<String> lista = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          lista == null ? SizedBox() : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: lista.map((e) => Column(
                  children: [
                    Text(e),
                  ],
                )).toList(),
              ),
            ),
          ),
          // controllers == null ? SizedBox() : Column(
          //   children: controllers!.map((e) => Container(
          //     child: TextField(),
          //   )).toList(),
          // ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  for(int i = 0 ; i <3 ; i ++){
                    // controllers!.add(TextEditingController());
                    lista.add("v");
                  }
                });
              },
              child: Text("ADD "),
            ),
          )
        ],
      ),
    );
  }
}
