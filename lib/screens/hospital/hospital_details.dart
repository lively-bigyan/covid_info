import 'package:corona_nepal/models/hospitals.dart';
import 'package:corona_nepal/screens/hospital/map.dart';
import 'package:corona_nepal/utils/widgets/table_rows.dart';
import 'package:flutter/material.dart';

class HospitalDetails extends StatefulWidget {
  final Data hospital;
  HospitalDetails({@required this.hospital});
  @override
  _HospitalDetailsState createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (widget.hospital.imageUrl == "")
                        ? AssetImage('assets/hospital.jpg')
                        : NetworkImage(widget.hospital.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black12, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              ),
            ),
            floating: true,
            pinned: true,
            elevation: 0,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: widget.hospital.name,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      widget.hospital.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text("Address: ",
                        style: Theme.of(context).textTheme.subhead),
                    Text((widget.hospital.address == "")
                        ? "Not available"
                        : widget.hospital.address),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      widget.hospital.phone.replaceAll(",", ", "),
                      style: Theme.of(context).textTheme.headline,
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text("Province: ",
                        style: Theme.of(context).textTheme.subhead),
                    Text(
                      widget.hospital.state,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Government Approved: ',
                        style: Theme.of(context).textTheme.subhead),
                    widget.hospital.governmentApproved
                        ? Icon(Icons.check, color: Colors.green)
                        : Icon(Icons.clear, color: Colors.red)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                (widget.hospital.contactPerson != "")
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Contact Person',
                              style: Theme.of(context).textTheme.subhead),
                          Text('Name: ' + widget.hospital.contactPerson),
                          Text('Contact number: ' +
                              widget.hospital.contactPersonNumber),
                          SizedBox(height: 20)
                        ],
                      )
                    : Container(),
                Text(
                  'Capacity',
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: <Widget>[
                      CustomTableRow(
                        left: "Beds",
                        right: widget.hospital.capacity.beds,
                      ),
                      Divider(
                        height: 0,
                      ),
                      CustomTableRow(
                        left: "Ventilators",
                        right: widget.hospital.capacity.ventilators,
                      ),
                      Divider(
                        height: 0,
                      ),
                      CustomTableRow(
                        left: "Isolation Beds",
                        right: widget.hospital.capacity.isolationBeds,
                      ),
                      Divider(
                        height: 0,
                      ),
                      CustomTableRow(
                        left: "Occupied Beds",
                        right: widget.hospital.capacity.occupiedBeds,
                      ),
                      Divider(
                        height: 0,
                      ),
                      CustomTableRow(
                        left: "Doctors",
                        right: widget.hospital.capacity.doctors,
                      ),
                      Divider(
                        height: 0,
                      ),
                      CustomTableRow(
                        left: "Nurses",
                        right: widget.hospital.capacity.nurses,
                      ),
                    ],
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
