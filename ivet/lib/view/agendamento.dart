import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ivet/view/agendar.dart';

class Agendamento extends StatefulWidget{

    final String selectedClinic;
    const Agendamento({Key? key, required this.selectedClinic}) : super(key: key);

  @override
  State<Agendamento> createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {

  var selectedPet;
  var selectedVet;
  var SelectedType;

  late String selectedClinic = widget.selectedClinic;

  DateTime date = DateTime(2020,31,12);
  TimeOfDay time = TimeOfDay(hour: 0, minute: 33);

  @override
  Widget build(BuildContext context) {
  
  FirebaseFirestore fdb = FirebaseFirestore.instance;

  String userAuthUID = FirebaseAuth.instance.currentUser!.uid;
  String userID = userAuthUID.toString();

  CollectionReference vets = fdb.collection('Vets');
  CollectionReference pets = fdb.collection('Pets');

  Stream<QuerySnapshot> _petsStream = pets.where('userID', isEqualTo: userID).snapshots();
  Stream<QuerySnapshot> _vetsStream = vets.where('clinicID', isEqualTo: selectedClinic).snapshots();

  Future<bool> visitRegister (String clinicID, String clinicName, bool closedVisit, String petID, String petName, String type, String userID, String userName, String vetId, String vetName, Timestamp visitDate) async{

  final visitRegister = <String, dynamic>{
    'clinicID': clinicID,
    'clinicName': clinicName,
    'closedVisit': closedVisit,
    'petID': petID,
    'petName': petName,
    'type': type,
    'userID': userID,
    'userName': userName,
    'vetId': vetId,
    'vetName': vetName,
    'visitDate': visitDate,
};

try{
  FirebaseFirestore.instance.collection("Visits").doc().set(visitRegister);
  return true;
} on FirebaseException catch(e){
  return false;
} catch(e){
  print(e.toString());
  return false;
}

};

  Future pickDate(BuildContext context) async {

    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025)
      );

    if(newDate == null) return;

    setState(() => date = newDate);

  }

    Future pickTime(BuildContext context) async {

    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      );

    if(newTime == null) return;

    setState(() => time = newTime);

  }

    String getDateText(){
    DateFormat formatterDate = DateFormat('dd-MM-yyyy');
    String formatedDate = formatterDate.format(date);
    if (date == DateTime(2020,31,12)){
      return 'Escolha uma data';
    } else{
      return formatedDate;
    }
  }

    String getTimeText(){

    String tiraFirst = '${time}'.substring(10);
    String tiraLast = tiraFirst.substring(0,tiraFirst.length-1);

    if (time == TimeOfDay(hour: 0, minute: 33)){
      return 'Escolha um horário';
    } else{
      return tiraLast ;
    }
  }

  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  List<String> _visitType=<String>[

    'Consulta Geral',
    'Castração',
    'Vacinação',
    'Cirugia',
    'Exames',

  ];



    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 65),
          Row(
            children: <Widget>[
              new InkWell(
                onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (_) => Agendar(selectedClinic:widget.selectedClinic),
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.chevron_left_outlined),
                    new Text(
                      'Voltar',
                      style: TextStyle(
                      fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Form(
            key: _formKeyValue,
            child: Column(
              children: <Widget>[
                Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Agendamento de Consulta',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 65),
              Padding(
                padding: EdgeInsets.only(),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _petsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if(!snapshot.hasData) {
                      return Center(child: Text('Loading...'));
                    } else {
                      List<DropdownMenuItem> userPets = [];
                      for(int i=0; i<snapshot.data!.docs.length;i++ ){
                        DocumentSnapshot snap = snapshot.data!.docs[i];
                        userPets.add(
                          DropdownMenuItem(
                            child: Text(
                              snap['name'],
                              style: TextStyle(color: Colors.indigo),
                            ),
                            value: '${snap['name']}',
                          )
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 35),
                          Text(
                            'Pet',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 90),
                          Icon(Icons.pets, color: Colors.indigo,),
                          SizedBox(width: 20),

                          DropdownButton<dynamic>(
                            items: userPets,
                            onChanged: (petValue){
                              final snackbar = SnackBar(
                                content: Text('Você selecionou ${petValue}', style: TextStyle(color: Color.fromARGB(255, 245, 247, 245)),),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              setState((){
                                selectedPet = petValue;
                              });
                            },
                            value: selectedPet,
                            isExpanded: false,
                            hint: new Text(
                              'Selecione um pet',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      );
                    }            
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _vetsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if(!snapshot.hasData) {
                      return Center(child: Text('Loading...'));
                    } else {
                      List<DropdownMenuItem> clinicVets = [];
                      for(int i=0; i<snapshot.data!.docs.length;i++ ){
                        DocumentSnapshot snap = snapshot.data!.docs[i];
                        clinicVets.add(
                          DropdownMenuItem(
                            child: Text(
                              snap['name'],
                              style: TextStyle(color: Colors.indigo),
                            ),
                            value: '${snap['name']}',
                          )
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 35),
                          Text(
                            'Veterinário ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.medical_information, color: Colors.indigo,),
                          SizedBox(width: 20),

                          DropdownButton<dynamic>(
                            items: clinicVets,
                            onChanged: (vetValue){
                              final snackbar = SnackBar(
                                content: Text('Você selecionou ${vetValue}', style: TextStyle(color: Color.fromARGB(255, 245, 247, 245)),),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              setState((){
                                selectedVet = vetValue;
                              });
                            },
                            value: selectedVet,
                            isExpanded: false,
                            hint: new Text(
                              'Selecione um Veterinário',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ],
                      );
                    }            
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child : Text(
                        'Tipo',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child:Icon(Icons.medical_services, color: Colors.indigo,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: DropdownButton(
                          items: _visitType.map((value)=>DropdownMenuItem(
                          child: Text(
                              value,
                              style: TextStyle(color: Colors.indigo),
                          ),
                          value: value,
                          )).toList(),
                          onChanged: (selectedVisitType){
                          setState(() {
                            SelectedType = selectedVisitType; 
                          });
                          },
                          value: SelectedType,
                          isExpanded: false,
                          hint: Text('Escolha um tipo de consulta',
                          style: TextStyle(color: Colors.indigo),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        'Data da Consulta',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.edit_calendar, color: Colors.indigo,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(150,38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            
                          ),
                        ),
                        onPressed: () => pickDate(context),
                        child: Text(getDateText(),style: TextStyle(fontSize: 14, color: Colors.indigo),),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        'Hora da Consulta',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.lock_clock, color: Colors.indigo,),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(150,38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () => pickTime(context),
                        child: Text(getTimeText(),style: TextStyle(fontSize: 14, color: Colors.indigo),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed:
                () async {
                    if (_formKeyValue.currentState!.validate()) {
                       
                    DateFormat formatterDate = DateFormat('yyyy-MM-dd');
                    String visitDay = formatterDate.format(date);
                    String hora = getTimeText();
                    String dataTempo = visitDay+' '+hora+':00';
                    DateTime dt = DateTime.parse(dataTempo);
                    Timestamp dataHoraConsulta = dateConverter(dt);

                    bool shouldNavigate = await visitRegister(
                      selectedClinic,
                      'Nome da Clinica',
                      false,
                      'petID',
                      selectedPet,
                      SelectedType,
                      userID,
                      'userName',
                      'vetID',
                      selectedVet,
                      dataHoraConsulta
                    );

                    if(shouldNavigate){
                      Navigator.pushNamed(context, '/home');
                    }
                  }            
                      },
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 21,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 40, 93, 216)),
                        fixedSize: MaterialStateProperty.all(Size(300.0 ,50.0)),
                        shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Timestamp dateConverter(DateTime datetime){
  Timestamp tStamp = Timestamp.fromDate(datetime);
  return tStamp;
}
