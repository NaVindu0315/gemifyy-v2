import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'dashboard.dart';

late BuildContext dialogcontext;

late User loggedinuser;
late String client;

class AddGemPage extends StatefulWidget {
  late User loggedinuser;
  late String client;

  void main() {
    runApp(AddGemPage());
  }

  @override
  State<AddGemPage> createState() => _AddGemPageState();
}

class _AddGemPageState extends State<AddGemPage> {
  static String id = 'addgempage';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        client = loggedinuser.email!;

        ///i have to call the getdatafrm the function here and parse client as a parameter

        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  //final _firestore = FirebaseFirestore.instance;
  var gemController = TextEditingController();
  late String? gemName;
  late String? gemCode;
  late String? gemVariety;

  late String? gemHolder;
  late String? previousOwner;
  late String? purchaseDate;
  late double? roughWeight;
  late double? weightAfterPerform;
  late double? weightAfterCutNPolish;
  late double? afterHeight;
  late double? afterWidth;
  late double? purchasePrice;
  late double? performingCharges;
  late double? cuttingCharges;
  late double? totalCost;
  late String gemurl;

  File? _image;
  Image myIcon = Image.asset('assets/ad.png');

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      ///meke tyyna hamahuttama kapapan
      final ref = storage.ref().child('images/${DateTime.now().toString()}');
      final uploadTask = ref.putFile(File(pickedImage.path));
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      gemurl = imageUrl;
      _image = File(pickedImage.path);

      setState(() {
        myIcon = Image.asset('pickedImage');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      radius: 50.0,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: /*Image(
                            image: AssetImage('images/ad.png'),
                          ),*/
                          _image == null
                              ? Image.asset('images/adgem1.png')
                              : Image.file(_image!),

                      /*IconButton(
                              icon: myIcon,
                              onPressed: null,
                            ),*/
                    ),
                  ),
                  /*ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.purple,
                    ),
                    label: const Text(
                      'Add New Gem',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      elevation: const MaterialStatePropertyAll(5.0),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),*/
                  TextFormField(
                    onChanged: (value) {
                      gemName = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.diamond,
                      ),
                      labelText: 'Gem Name',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///gemCode
                  TextFormField(
                    onChanged: (value) {
                      gemCode = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.numbers,
                      ),
                      labelText: 'Gem Code',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///gemvariety
                  TextFormField(
                    onChanged: (value) {
                      gemVariety = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.type_specimen,
                      ),
                      labelText: 'Gem Variety',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  //gem holder
                  TextFormField(
                    onChanged: (value) {
                      gemHolder = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      labelText: 'Gem Holder',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///previous owner
                  TextFormField(
                    onChanged: (value) {
                      previousOwner = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2,
                      ),
                      labelText: 'Previous Owner',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///purchased date
                  TextFormField(
                    onChanged: (value) {
                      purchaseDate = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_month,
                      ),
                      labelText: 'Purchased Date',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///rought weight
                  TextFormField(
                    onChanged: (value) {
                      roughWeight = double.parse(value!);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.monitor_weight,
                      ),
                      labelText: 'Rough Weight',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ///weight after perform

                  TextFormField(
                    onChanged: (value) {
                      weightAfterPerform = double.parse(value!);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.line_weight,
                      ),
                      labelText: 'weight after perfom',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      weightAfterCutNPolish = double.parse(value!);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.monitor_weight,
                      ),
                      labelText: 'weight after cut and polish',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Measurements After Cut & Polish',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            afterHeight = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Height',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            afterWidth = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Width',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Rs.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          onChanged: (value) {
                            purchasePrice = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'purchased price',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Rs.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          onChanged: (value) {
                            performingCharges = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'performing charges',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Rs.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          onChanged: (value) {
                            cuttingCharges = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'cutting charges',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Rs.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                          onChanged: (value) {
                            totalCost = double.parse(value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'total cost',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BottomButton(
                          label: 'Back',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: BottomButton(
                          label: 'Submit',
                          onPressed: () {
                            final gemsRef =
                                _firestore.collection(client).doc(gemCode);
                            gemsRef.set({
                              'gemurl': gemurl,
                              'gem name': gemName,
                              'gem code': gemCode,
                              'gem variety': gemVariety,
                              'gem holder': gemHolder,
                              'previous owner': previousOwner,
                              'purchase date': purchaseDate,
                              'rough weight': roughWeight,
                              'weight after perform': weightAfterPerform,
                              'weight after cut & polish':
                                  weightAfterCutNPolish,
                              'after height': afterHeight,
                              'after width': afterWidth,
                              'purchase price': purchasePrice,
                              'performing charges': performingCharges,
                              'cutting charges': cuttingCharges,
                              'total cost': totalCost,
                            });

                            AlertDialog alert = AlertDialog(
                              title: Text("New Gem Added"),
                              content: Text(
                                  "New Gem : $gemName added to your gem collection under\nGemCode :$gemCode"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                dialogcontext = context;
                                return alert;
                              },
                            );
                            Navigator.of(dialogcontext).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.purple),
        elevation: const MaterialStatePropertyAll(5.0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: Text(
        label,
      ),
    );
  }
}

class UserInputs extends StatelessWidget {
  const UserInputs(
      {super.key,
      this.hintText,
      this.errorMessage,
      this.onSaved,
      this.controller});

  final String? hintText;
  final String? errorMessage;
  final void Function(String? value)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
