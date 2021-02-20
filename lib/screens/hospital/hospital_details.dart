import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/hospitals.dart';
import '../../utils/widgets/table_rows.dart';

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
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Details', style: TextStyle(color: Colors.white)),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (widget.hospital.imageUrl == '')
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            .headline6
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.addressBook),
                      Text('Address: ',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text(
                        (widget.hospital.address == '')
                            ? 'Not available'
                            : widget.hospital.address,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('Contacts: ',
                      style: Theme.of(context).textTheme.subtitle1),
                  Row(
                    children: <Widget>[
                      Icon(Icons.phone, color: Colors.grey),
                      const SizedBox(height: 10),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(
                              widget.hospital.phone.replaceAll(',', ', '),
                              style: Theme.of(context).textTheme.headline6)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Province: ',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text(
                        widget.hospital.state,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Government Approved: ',
                          style: Theme.of(context).textTheme.subtitle1),
                      widget.hospital.governmentApproved
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.clear, color: Colors.red)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  (widget.hospital.contactPerson != '')
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Contact Person',
                                style: Theme.of(context).textTheme.subtitle1),
                            Text('Name: ' + widget.hospital.contactPerson),
                            Text('Contact number: ' +
                                widget.hospital.contactPersonNumber),
                            const SizedBox(height: 20)
                          ],
                        )
                      : Container(),
                  Text(
                    'Capacity',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: <Widget>[
                        CustomTableRow(
                          left: 'Beds',
                          right: widget.hospital.capacity.beds,
                        ),
                        Divider(
                          height: 4,
                        ),
                        CustomTableRow(
                          left: 'Ventilators',
                          right: widget.hospital.capacity.ventilators,
                        ),
                        Divider(
                          height: 4,
                        ),
                        CustomTableRow(
                          left: 'Isolation Beds',
                          right: widget.hospital.capacity.isolationBeds,
                        ),
                        Divider(
                          height: 4,
                        ),
                        CustomTableRow(
                          left: 'Occupied Beds',
                          right: widget.hospital.capacity.occupiedBeds,
                        ),
                        Divider(height: 4),
                        CustomTableRow(
                            left: 'Doctors',
                            right: widget.hospital.capacity.doctors),
                        Divider(height: 4),
                        CustomTableRow(
                            left: 'Nurses',
                            right: widget.hospital.capacity.nurses),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
