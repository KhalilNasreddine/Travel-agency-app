import 'package:flutter/material.dart';
import 'country.dart';
import 'ticket.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Buy extends StatefulWidget {
  const Buy({super.key, this.restorationId, required this.cPosition, required this.hPosition, required this.username});
  final String? restorationId;
  final int cPosition;
  final int hPosition;
  final String username;
  @override
  State<Buy> createState() => _BuyState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _BuyState extends State<Buy>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  bool _loading=false;
  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2023),
          lastDate: DateTime(2026),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    int c=widget.cPosition;
    int h=widget.hPosition;
    String u=widget.username;
    return Scaffold(
        body: SingleChildScrollView(

            child: Container(
              width: double.infinity,
              color: Colors.white,
              child:Column(
                  children: [
                    Image.asset('images/logo.png',height: 250,width: 250,),
                    Text('What is your preferred date to travel?'),
                    OutlinedButton(
                      onPressed: () {
                        _restorableDatePickerRouteFuture.present();

                      },
                      child: const Text('Select Date'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(countries[c].flag, width: 250, height: 250,),
                        SizedBox(width: 15,),
                        Image.asset(countries[c].hotels[h].image, width: 250,height: 250,)
                      ],),
                    // ignore: prefer_interpolation_to_compose_strings
                    Text('the ticket costs: '+'${countries[c].updatePrice(c, h)}'),
                    ElevatedButton.icon(
                      onPressed: (){
                        addTicket(update, countries[c].name, countries[c].updatePrice(c, h),u).then((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Ticket(cPosition: c, hPosition: h, date: _selectedDate.value.toString())),
                          );
                        }).catchError((error) {
                          update("Connection Error");
                          setState(() {
                            Navigator.of(context).pop();
                            _loading = false; // Reset the loading state
                          });
                        });



                      },
                      label: Text('Confirm'),
                      icon: Icon(Icons.airplane_ticket_outlined),
                    ),

                  ]),

            )));
  }
}
String _baseURL='https://travelagencyapplication.000webhostapp.com/';

Future<void> addTicket(Function(String text) update, String country, double price , String Username)async{
  try{
    final response = await http.post(
        Uri.parse('$_baseURL/addTicket.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, // convert the cid, name and key to a JSON object
        body: convert.jsonEncode(<String, String>{
          'Country': country, 'Price': '$price', 'Username': Username
        })).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      // if successful, call the update function
      update(response.body);
    }
  }
  catch(e){
    update("Connection Error");
  }
}