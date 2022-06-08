import 'package:flutter/material.dart';
import 'package:icdc_desktop_app/main.dart';
import 'package:icdc_desktop_app/resources/custom-widgets.dart';
import 'package:icdc_desktop_app/resources/item_object.dart';
import 'dart:core';
import 'global-variables.dart';

class CheckInventory extends StatefulWidget {
  const CheckInventory({Key? key}) : super(key: key);

  @override
  CheckInventoryPage createState() => CheckInventoryPage();
}

class CheckInventoryPage extends State<CheckInventory>{
  @override
  void initState(){
    super.initState();
  }

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
            children: [
              sidebarWidget(context),
              checkInventoryPageWidgets(context),
              ],
          ),
        ));
  }
}

Widget checkInventoryPageWidgets(BuildContext context) {
  return Expanded(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 20),
            child: Text('Clinic Inventory',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff4b39ef))),
          ),
          categories(context)
        ]),
  );
}

Widget categories(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: const Color(0xFFEEEEEE),
      ),
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Expanded(
                            flex: 6,
                            child: Text('Item Name',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Quantity',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('Edit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff4b39ef))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                        thickness: 1,
                        indent: 8,
                        endIndent: 8,
                        color: Color(0xff4b39ef)),
                    itemRows(context),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: roundedButtons(
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white),
                        height: 36,
                        width: 90,
                        color: const Color(0xff4b39ef),
                        text: "Add Item",
                        function: addItem,
                        navFunction: navigate,
                        context: context,
                        page: const CheckInventory(),
                      ),
                    ),
                  ]))),
    ),
  );
}

Widget itemRows(BuildContext context) {
  List<Widget> widgetList = [];
  int n = inventoryItems.length;
  
  if(editPressed){
    for (int i = 0; i < n; i++) {
      if(i==editNumber) widgetList.add(inputItems(context));
      else widgetList.add(listItems(i, context));
    }
  }
  else{
    for (int i = 0; i < n; i++) {
      widgetList.add(listItems(i, context));
    }
    widgetList.add(inputItems(context));
  }

  return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgetList);
}

Widget listItems(int i, BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 35, 0),
              child: Text(
                inventoryItems[i].name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 90, 0),
              child: Text(
                inventoryItems[i].quantity.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
          child: roundedButtons(
            textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white),
            height: 36,
            width: 110,
            color: const Color(0xff4b39ef),
            text: "Edit",
            function: () {
              editItem(i);
            },
            navFunction: navigate,
            context: context,
            page: const CheckInventory(),
          ),
        ),    
      ],
    ),
  );
}

Widget inputItems(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [ 
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromARGB(255, 252, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
              iconSize: 20,
              onPressed: () {
                removeItem();
              },            
            ),
          ),
        ),
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(34, 0, 0, 0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: itemController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Item Name",
                  border: UnderlineInputBorder(),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(200, 0, 0, 0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: const Color(0xff4b39ef),
            child: IconButton(
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 15,
              ),
              iconSize: 15,
              onPressed: () {
                decreaseQuantity();
              },            
            ),
          ),          
        ),
        Expanded(
          flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: quantityController,
                cursorHeight: 24,
                decoration: const InputDecoration(
                  hintText: "Quantity",
                  border: UnderlineInputBorder(),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 140, 0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: const Color(0xff4b39ef),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              iconSize: 15,
              onPressed: () {
                increaseQuantity();
              },            
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
          child: roundedButtons(
            textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white),
            height: 36,
            width: 110,
            color: const Color(0xff4b39ef),
            text: "Edit",
            function: placeholder,
            navFunction: navigate,
            context: context,
            page: const CheckInventory(),
          ),
        ),
      ],
    ),
  );
}

void decreaseQuantity(){
  int qty = int.parse(quantityController.text);
  qty--;
  quantityController.text = qty.toString();
}

void increaseQuantity(){
  int qty = int.parse(quantityController.text);
  qty++;
  quantityController.text = qty.toString();
}

void removeItem(){
  itemController.clear();
  quantityController.clear();
}

void editItem(int itemNumber){
  editPressed = true;
  editNumber = itemNumber;

  itemController.text = inventoryItems[itemNumber].name;
  quantityController.text = inventoryItems[itemNumber].quantity.toString();

  print("Name: " + inventoryItems[itemNumber].name);
  print("Quantity: " + inventoryItems[itemNumber].quantity.toString());
}

void addItem(){
  if(editPressed){
    inventoryItems[editNumber].name = itemController.text;
    inventoryItems[editNumber].quantity = int.parse(quantityController.text);
  }
  else{
    editNumber = inventoryItems.length;
  
    ItemObject item = ItemObject(itemController.text, int.parse(quantityController.text));
    inventoryItems.add(item);
  }

  editPressed = false;
  
  // Dito ipapasok yung list of item objects sa database
  for(var object in inventoryItems){
    print("---------------------------------------------");
    print("Item: " + object.name);
    print("Quantity: " + object.quantity.toString());
  }

  itemController.clear();
  quantityController.clear();
  
}