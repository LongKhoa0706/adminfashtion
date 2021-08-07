import 'package:adminfashtion/src/core/viewmodel/category_viewmodel.dart';
import 'package:adminfashtion/src/ui/router/router_path.dart';
import 'package:adminfashtion/src/ui/router/routerr.dart';
import 'package:adminfashtion/src/ui/screen/add_product.dart';
import 'package:adminfashtion/src/ui/screen/category_screen.dart';
import 'package:adminfashtion/src/ui/screen/dash_board.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CategoryViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Routerr.onGenerateRouter,
        initialRoute: DashBoardScreens,
      ),
    );
  }
}
