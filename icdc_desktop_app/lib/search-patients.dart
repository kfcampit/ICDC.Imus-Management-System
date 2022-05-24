import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';

class SearchPatients extends StatelessWidget {
  const SearchPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff4b39ef),
        ),
        home: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [sidebarWidget(context)],
          ),
        ));
  }
}
