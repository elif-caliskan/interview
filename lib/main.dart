import 'package:flutter/material.dart';
import 'package:interview/ticket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  String departure;
  String destination;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buy Ticket"),
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              color: Colors.teal.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      MyText(text: "Departure"),
                      MyText(text: "Destination"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: TextField(
                        onChanged: (newValue) {
                          departure = newValue;
                        },
                      )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: TextField(
                        onChanged: (newValue) {
                          destination = newValue;
                        },
                      )),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text("Buy"),
                  ),
                ],
              ),
            ),
          ),
          TicketList(),
        ]),
      ),
    );
  }
}

class TicketList extends StatefulWidget {
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  Ticket ticket = Ticket(departure: "moosach", destination: "isartor");
  List<TicketWidget> tickets = List();

  @override
  Widget build(BuildContext context) {
    tickets.add(TicketWidget(
      ticket: ticket,
    ));
    return Expanded(
      child: Container(
        color: Colors.teal.shade100,
        child: ListView(
          children: tickets,
        ),
      ),
    );
  }
}

class TicketWidget extends StatelessWidget {
  final Ticket ticket;

  TicketWidget({this.ticket});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("From: ${ticket.departure}"),
          Text("To: ${ticket.destination}"),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String text;
  MyText({this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
    );
  }
}
