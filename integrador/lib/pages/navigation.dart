import 'package:flutter/material.dart';
import 'package:integrador/model/item.dart';
import 'package:integrador/pages/detail_page.dart';

class Navigation{
  static const String routeBookPage = 'book-page';

  static void  bookPage(BuildContext context, Item reservable){
    Navigator.of(context).pushNamed(routeBookPage, arguments: reservable);
  }

  static Map<String, WidgetBuilder> routingTable(){
    return{
      routeBookPage: (context) => DetailPage()
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    final pageBuilder= Navigation.routingTable()[settings.name];
    if(pageBuilder!=null){
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context,__,___) => pageBuilder(context),
        transitionsBuilder: (context,animation,secondaryAnimation,child)=>FadeTransition(opacity: animation,child: child,)
      );
    }
    else{
      return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('not found'),),));
    }
  }

}