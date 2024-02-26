import 'package:checkbox/Components/Custome_Button.dart';
import 'package:checkbox/Components/ListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listData = ["khalid", "Khan", "ali", "330"];
  Map<String, bool> checkedState = {};
  Map<String, Color> itemColors = {};

  @override
  void initState() {
    super.initState();
    // Initialize checkedState map with all items initially unchecked
    for (String item in listData) {
      checkedState[item] = false;
      itemColors[item] = Colors.black; // Initialize text color to black
    }
  }

  void updateItemColors(String item, bool isChecked) {
    setState(() {
      if (isChecked) {
        itemColors[item] = Colors.blue; // Change text color to blue if checked
      } else {
        itemColors[item] = Colors.black; // Otherwise, keep text color black
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          Expanded(
            //flex adject listTile
            flex: 5,
            child: ListView.builder(
            //  shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                String item = listData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(
                        color: checkedState[item]!
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item,
                        style: TextStyle(color: itemColors[item]),
                      ),
                      leading: CustomCheckbox(
                        value: checkedState[item] ?? false,
                        onChanged: (value) {
                          setState(() {
                            // Update checked state of the item
                            checkedState[item] = value!;
                            // Update text color and trailing icon color
                            updateItemColors(item, value);
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                      trailing: IconButton(
                        icon:
                            Icon(Icons.chevron_left, color: itemColors[item]),
                        onPressed: () {
                          print(checkedState);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.01),

          Expanded(
            //flex adject button portion
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //ElevatedButton(onPressed: (){}, child: Text("sdf")),
                  //ElevatedButton(onPressed: (){}, child: Text("sdf")),
                  Expanded(
                    flex: 5,
                    child: CustomButton(
                      icon: FaIcon(FontAwesomeIcons.repeat,color: Colors.white,),
                      text: "Reset",
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.white,
                      buttonHeight: height * 0.08,
                      buttonWidth: width * 0.07,
                      iconBeforeText: true, // Icon before text
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    flex: 6,

                    child: CustomButton(
                      text: "Continue",
                      backgroundColor: Colors.blueAccent,
                      textColor: Colors.white,
                      icon: FaIcon(FontAwesomeIcons.chevronRight,color: Colors.white,),
                      buttonHeight: height * 0.08,
                      buttonWidth: width * 0.02,
                      iconBeforeText: false, // Icon after text
                    ),
                  ),

                  //Expanded(child: CustomButton(text: "ggjdf", backgroundColor: Colors.red, textColor: Colors.white, icon: Icon(Icons.account_box_outlined)))


                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
