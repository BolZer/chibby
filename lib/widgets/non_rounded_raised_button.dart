import 'package:chibby/widgets/game_selection_dialog.dart';
import 'package:flutter/material.dart';

class NonRoundedRaisedButton extends StatefulWidget {
  final Widget child;

  NonRoundedRaisedButton({Key key, @required this.child}) : super(key: key);

  @override
  _NonRoundedRaisedButtonState createState() => _NonRoundedRaisedButtonState();
}

class _NonRoundedRaisedButtonState extends State<NonRoundedRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(0.0)
      ),
      child: widget.child,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GameSelectionDialog();
            });
      },
    );
  }
}
