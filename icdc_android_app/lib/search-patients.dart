import 'package:flutter/material.dart';
import 'package:icdc_android_app/search-patients.dart';
import 'package:icdc_android_app/resources/global_variables.dart';
import 'package:icdc_android_app/resources/custom-widgets.dart';

var dropdownValue;

class SearchPatients extends StatefulWidget {
  const SearchPatients({Key? key}) : super(key: key);

  @override
  SearchPatientsPage createState() => SearchPatientsPage();
}

class SearchPatientsPage extends State<SearchPatients> {
  @override
  void initState() {
    super.initState();
    dropdownValue = "  Name";
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff4b39ef),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Search Patients",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                  ),),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: 
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo_1.png',
                        width: 40,
                        height: 40,
                        ),
                      const Text("ICDC - IMUS",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),),
                    ],
                  ))
                ]
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff4b39ef),
            toolbarHeight: 80.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              searchPatientPageWidgets(context, searchBar)
            ],
          ),
        ));
  }

  Widget searchBar() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                      child: TextFormField(
                          controller: nameController,
                          autofocus: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4b39ef),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4b39ef),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14)))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Container(
                    width: 98,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff4b39ef)),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: const Color(0xff4b39ef),
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      alignment: Alignment.center,
                      isExpanded: true,
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: <String>['  Name', '  Treatment', '  Date']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                  child: iconButton(
                      iconName: Icons.search_sharp,
                      function: placeholder,
                      size: 20,
                      iconSize: 28,
                      navFunction: navPlaceholder))
            ]));
  }
}

Widget searchPatientPageWidgets(BuildContext context, Function function) {
  return Expanded(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          function(),
          searchContents()
        ]),
  );
}

Widget searchContents() {
  return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: const Color(0xFFEEEEEE),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              Expanded(
                flex: 2,
                child: Text('Patient Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff4b39ef))),
              ),
              Expanded(
                flex: 3,
                child: Text('Treatment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff4b39ef))),
              ),
              Expanded(
                flex: 1,
                child: Text('Date',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff4b39ef))),
              ),
              Expanded(
                flex: 1,
                child: Text('View',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff4b39ef))),
              ),
              Divider(
                  thickness: 1,
                  indent: 8,
                  endIndent: 8,
                  color: Color(0xff4b39ef)),
            ],
          ),
        ),
      ));
}