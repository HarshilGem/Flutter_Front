import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Diamond {
  final int id;
  final String name;

  Diamond({
    required this.id,
    required this.name,
  });
}

class Skills extends StatefulWidget {
  Skills({ Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  static List<Diamond> _animals = [
    Diamond(id: 1, name: "Manual Marker"),
    Diamond(id: 2, name: "Galaxy Planner"),
    Diamond(id: 3, name: "Semi-asort"),
    Diamond(id: 4, name: "Full-asort"),
    Diamond(id: 5, name: "Sarin-operator"),
    Diamond(id: 6, name: "Rekert"),
    Diamond(id: 7, name: "Vajan"),
    Diamond(id: 8, name: "Data entery"),
    Diamond(id: 9, name: "Boil"),
    Diamond(id: 10, name: "Manager"),
    Diamond(id: 11, name: "Taliya"),
    Diamond(id: 12, name: "Russian"),
    Diamond(id: 13, name: "Table"),
    Diamond(id: 14, name: "Taliya pel"),
    Diamond(id: 15, name: "Blocking-chapka"),
    Diamond(id: 16, name: "Mathala"),
    Diamond(id: 17, name: "Diy-Fixening"),
    Diamond(id: 18, name: "Dori"),
    // Diamond(id: 19, name:  ""),
    // Diamond(id: 20, name: "Moose"),
    // Diamond(id: 21, name: "Gecko"),
    // Diamond(id: 22, name: "Kangaroo"),
    // Diamond(id: 23, name: "Shark"),
    // Diamond(id: 24, name: "Crocodile"),
    // Diamond(id: 25, name: "Owl"),
    // Diamond(id: 26, name: "Dragonfly"),
    // Diamond(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Diamond>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Diamond> _selectedAnimals2 = [];
  List<Diamond> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Diamond> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              // MultiSelectDialogField(
              //   items: _items,
              //   title: Text("Animals"),
              //   selectedColor: Colors.blue,
              //   decoration: BoxDecoration(
              //     color: Colors.blue.withOpacity(0.1),
              //     borderRadius: BorderRadius.all(Radius.circular(40)),
              //     border: Border.all(
              //       color: Colors.blue,
              //       width: 2,
              //     ),
              //   ),
              //   buttonIcon: Icon(
              //     Icons.pets,
              //     color: Colors.blue,
              //   ),
              //   buttonText: Text(
              //     "Favorite Animals",
              //     style: TextStyle(
              //       color: Colors.blue[800],
              //       fontSize: 16,
              //     ),
              //   ),
              //   onConfirm: (results) {
              //     //_selectedAnimals = results;
              //   },
              // ),
              SizedBox(height: 50),
              //################################################################################################
              // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
              // decoration applied. This allows the ChipDisplay to render inside the same Container.
              //################################################################################################
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.4),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonText: Text("Diamond Fields"),
                      title: Text("Diamond"),
                      items: _items,
                      onConfirm: (values) {
                        _selectedAnimals2 = _animals;
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          setState(() {
                            _selectedAnimals2.remove(value);
                          });
                        },
                      ),
                    ),
                    if (_selectedAnimals2.isEmpty) Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "None selected",
                          style: TextStyle(color: Colors.black54),
                        )) else Container(),
                  ],
                ),
              ),
              SizedBox(height: 40),
              //################################################################################################
              // MultiSelectBottomSheetField with validators
              //################################################################################################
              // MultiSelectBottomSheetField<Animal>(
              //   key: _multiSelectKey,
              //   initialChildSize: 0.7,
              //   maxChildSize: 0.95,
              //   title: Text("Animals"),
              //   buttonText: Text("Favorite Animals"),
              //   items: _items,
              //   searchable: true,
              //   validator: (values) {
              //     if (values == null || values.isEmpty) {
              //       return "Required";
              //     }
              //     List<String> names = values.map((e) => e.name).toList();
              //     if (names.contains("Frog")) {
              //       return "Frogs are weird!";
              //     }
              //     return null;
              //   },
              //   onConfirm: (values) {
              //     setState(() {
              //       _selectedAnimals3 = values;
              //     });
              //     _multiSelectKey.currentState!.validate();
              //   },
              //   chipDisplay: MultiSelectChipDisplay(
              //     onTap: (item) {
              //       setState(() {
              //         _selectedAnimals3.remove(item);
              //       });
              //       _multiSelectKey.currentState!.validate();
              //     },
              //   ),
              // ),
              // SizedBox(height: 40),
              //################################################################################################
              // MultiSelectChipField
              //################################################################################################
              // MultiSelectChipField(
              //   items: _items,
              //   initialValue: [_animals[4], _animals[7], _animals[9]],
              //   title: Text("Animals"),
              //   headerColor: Colors.blue.withOpacity(0.5),
              //   decoration: BoxDecoration(
              //     border: Border.all(color:Colors.blue, width: 1.8),
              //   ),
              //   selectedChipColor: Colors.blue.withOpacity(0.5),
              //   selectedTextStyle: TextStyle(color: Colors.blue[800]),
              //   onTap: (values) {
              //     //_selectedAnimals4 = values;
              //   },
              // ),
              // SizedBox(height: 40),
              //################################################################################################
              // MultiSelectDialogField with initial values
              //################################################################################################
              // MultiSelectDialogField(
              //   onConfirm: (val) {
              //     _selectedAnimals5 = val;
              //   },
              //   dialogWidth: MediaQuery.of(context).size.width * 0.7,
              //   items: _items,
              //   initialValue:
              //   _selectedAnimals5, // setting the value of this in initState() to pre-select values.
              // ),
            ],
          ),
        ),
      ),
    );
  }
}