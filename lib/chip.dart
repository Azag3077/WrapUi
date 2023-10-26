import 'package:flutter/material.dart';

class DotLabel extends StatelessWidget {
  const DotLabel({
    Key? key,
    required this.label,
    this.first = false,
  }) : super(key: key);
  final String label;
  final bool first;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: first ? null : SizedBox.square(
            dimension: 5.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4.0)
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: first ? 0.0 : 4.0),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13
            ),
          ),
        ),
      ],
    );
  }
}

class SpecChip extends StatelessWidget {
  const SpecChip({
    Key? key,
    required this.name,
    required this.value,
    this.margin = const EdgeInsets.all(3.0)
  }) : super(key: key);
  final String name;
  final String value;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
              color: Theme.of(context).primaryColor
          )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontFamily: 'Poppins'
              )
          ),
          SizedBox(
            height: 15,
            child: VerticalDivider(thickness: 2, color: Theme.of(context).primaryColor,),
          ),
          Text(
            value,
            style: const TextStyle(
                fontFamily: 'Poppins'
            ),
          )
        ],
      ),
    );
  }
}