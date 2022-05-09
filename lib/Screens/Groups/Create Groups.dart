import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split/shared/constants.dart';
import 'package:split/Screens/wrapper.dart';


class Create_Group extends StatefulWidget {
  @override
  State<Create_Group> createState() => _Create_GroupState();
}

class _Create_GroupState extends State<Create_Group> {
  final fieldText = TextEditingController();
  //variables
  final List<String> memberNames = [];
  String add_check = '';
  String groupName = '';
  String leaderName = '';
  String memberName = '';
  String payment = '';
  var paymentDate = '';
  var groupCreation = '';

  double calculate(double payment, int members) {
    double split = 0.00;
    split = payment / members;
    return split;
  }

  void addnames(String memberName) {
    String name = memberName;
    if (name == '') {
      print("empty");
    } else {
      memberNames.add(memberName);
      print(memberName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Text(
                "Group Creation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0), //Group Name stuff
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Group Name'),
                  textInputAction: TextInputAction.next,
                  validator: (
                      String?val) { //making sure the Group Name is filled
                    if (val != null && val.isEmpty) {
                      return "Group Name can't be empty";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => groupName = val.trim());
                  }
              ),
              const SizedBox(height: 20.0), //Group Leader Name stuff
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Leader Name'),
                  textInputAction: TextInputAction.next,
                  validator: (
                      String?val) { //making sure the Leader Name is filled
                    if (val != null && val.isEmpty) {
                      return "Leader Name can't be empty";
                    }
                    return null;
                  },
<<<<<<< HEAD
                  onChanged: (val){setState(() => leaderName = val.trim());}
              ),

              const SizedBox(height: 20.0),//Member Name stuff


              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Member Email'),
                  textInputAction: TextInputAction.next,
                  validator: (String?val){//making sure the email form is filled
                    bool result = doesUserExist(val!) as bool;
                    if(val.isEmpty){
                      return "Member Name can't be empty";
                    } else if (result == false) {
                      return "member does not exist";
                    }
                    return null;
                  },
                  onChanged: (val) async {
                    setState(() => memberName = val.trim());
                    //addnames(memberName);
=======
                  onChanged: (val) {
                    setState(() => leaderName = val.trim());
>>>>>>> d6256f75d083931bb48aef1d4ec0fdb043517551
                  }
              ),


              const SizedBox(height: 20.0), //Member Name stuff
              Column(
                children: [
                  Container(
                    child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Member Name'),
                        textInputAction: TextInputAction.next,
                        validator: (
                            String?val) { //making sure the email form is filled
                          if (val != null && val.isEmpty) {
                            return "Member Name can't be empty";
                          }
                          return null;
                        },
                        onChanged: (val) async {
                          setState(() => memberName = val.trim());
                          //addnames(memberName);
                        },
                      controller: fieldText,
                    ),

                  ),
                  SizedBox(height: 15,),
                  RaisedButton(
                    onPressed: () async {
                        clearText(memberName);
                    },
                    color: Colors.green,
                    child: Text('add'),
                    textColor: Colors.white,

                  ),
                  Text(
                    add_check,
                    style: const TextStyle(color: Colors.indigoAccent, fontSize: 14.0),
                  ),
                ],


              ),


              const SizedBox(height: 20.0), //Payment Date stuff
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Payment Date'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  validator: (
                      String?val) { //making sure the email form is filled
                    if (val != null && val.isEmpty) {
                      return "Payment Date can't be empty";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => paymentDate = val.trim());
                  }
              ),
              const SizedBox(height: 20.0), //Payment Amount stuff
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '\$ Payment Amount'),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: (
                      String?val) { //making sure the email form is filled
                    if (val != null && val.isEmpty) {
                      return "Payment Amount can't be empty";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => payment = val.trim());
                  }
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime now = DateTime.now();
                  var payment1 = double.parse(payment);
                  print(now);
                  print(groupName);
                  print(leaderName);
                  print(memberNames);
                  print(paymentDate);
                  print(payment1);
                  double total = calculate(payment1, memberNames.length);
                  print(total);
                  var docid;
                  FirebaseFirestore.instance.collection('Groups').add(
                      {
                        "groupName": groupName,
<<<<<<< HEAD
                        "leaderName" : leaderName,
                        "members" : memberNames,
                        "paymentDate" : paymentDate,
                        "totalPayment" : payment1,
                        "splitPayment" : total,
                      }).then((value){
                        print("value"+ value.id.toString());
                        docid = value.id;
=======
                        "leaderName": leaderName,
                        "members": memberNames,
                        "paymentDate": paymentDate,
                        "totalPayment": payment1,
                        "splitPayment": total,
                      }).then((value) {
                    print(value.id);
>>>>>>> d6256f75d083931bb48aef1d4ec0fdb043517551
                  });
                  await FirebaseFirestore.instance.collection('Groups').where(
                    FieldPath.documentId,
                        isEqualTo: docid
                  ).get().then((event) {
                    if (event.docs.isNotEmpty) {
                      Map<String, dynamic> documentData = event.docs.single as Map<String, dynamic>;
                    print(documentData['groupName']);
                    }
                  }).catchError((e) => print(e));

                  Navigator.defaultRouteName;
                  Navigator.pop(context);
                },
                child: const Text(
                    "Create Group"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearText(String _m) {
    addnames(_m);
    add_check = "added";
    fieldText.clear();

  }

}

