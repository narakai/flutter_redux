import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inkino/redux/app/app_state.dart';
import 'package:inkino/redux/common_actions.dart';
import 'package:inkino/redux/store.dart';
import 'package:inkino/ui/main_page.dart';
import 'package:redux/redux.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  //App State is an immutable Object that lives at the top of your Widget hierarchy within a Store
  var store = await createStore();
  runApp(new InKinoApp(store));
}

class InKinoApp extends StatefulWidget {
  InKinoApp(this.store);

  final Store<AppState> store;

  @override
  _InKinoAppState createState() => new _InKinoAppState();
}

class _InKinoAppState extends State<InKinoApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(new InitAction());
  }

  @override
  Widget build(BuildContext context) {
    //  The Store is passed down to all ancestors via an InheritedWidget called a StoreProvider
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'inKino',
        theme: new ThemeData(
          primaryColor: const Color(0xFF1C306D),
          accentColor: const Color(0xFFFFAD32),
        ),
        home: const MainPage(),
      ),
    );
  }
}
