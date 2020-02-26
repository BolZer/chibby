import 'package:flutter/material.dart';

class FormDropdownSelectionField extends StatefulWidget {
  final List<DropdownMenuItem> items;
  final dynamic value;
  final Function(dynamic value) onChanged;
  final InputDecoration inputDecoration;

  FormDropdownSelectionField({Key key, @required this.items, @required this.onChanged, @required this.value, @required this.inputDecoration}) : super(key: key);

  @override
  _FormDropdownSelectionFieldState createState() => _FormDropdownSelectionFieldState();
}

class _FormDropdownSelectionFieldState extends State<FormDropdownSelectionField> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return DropdownButtonHideUnderline(
          child: Column(
            children: <Widget>[
              InputDecorator(
                decoration: widget.inputDecoration,
                child: DropdownButton(
                  isDense: true,
                  value: widget.value,
                  onChanged: widget.onChanged,
                  items: widget.items,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
