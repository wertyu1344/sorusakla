import 'package:flutter/material.dart';

class SwitchCard extends StatefulWidget {
  SwitchCard(
      {required this.value,
      required this.title,
      required this.subtitle,
      Key? key})
      : super(key: key);
  String title;
  String subtitle;
  bool value;
  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: SizedBox(
        height: 80,
        child: Card(
          color: const Color.fromARGB(255, 246, 250, 255),
          child: ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.subtitle,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
            ),
            trailing: Switch(
                onChanged: (val) {
                  setState(() {
                    widget.value = val;
                  });
                },
                value: widget.value,
                activeTrackColor: const Color.fromARGB(255, 200, 255, 239),
                activeColor: const Color.fromARGB(255, 27, 227, 171)),
          ),
        ),
      ),
    );
  }
}
