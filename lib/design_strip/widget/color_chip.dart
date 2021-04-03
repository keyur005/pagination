import 'package:flutter/material.dart';
import 'package:pagination/design_strip/model/tab_model.dart';

class ColorSelectChip extends StatefulWidget {
  final List<Tabs> colorList;
  String selectedColor;
  String selectedId;
  final Function onSelectionChanged;

  ColorSelectChip(this.colorList,
      {this.selectedColor, this.selectedId, this.onSelectionChanged} // +added
      );

  @override
  _ColorSelectChipState createState() => _ColorSelectChipState();
}

class _ColorSelectChipState extends State<ColorSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.colorList.forEach((item) {
      choices.add(
        GestureDetector(
          onTap: () {
            setState(() {
              widget.selectedColor = item.color.toString();
              widget.selectedId = item.id.toString();
              widget.onSelectionChanged(
                  widget.selectedColor, widget.selectedId); // +added
            });
          },
          child: Column(
            children: [
              Container(
                child: Center(
                    child: Center(
                        child: widget.selectedColor.contains(item.color)
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Container())),
                margin: EdgeInsets.all(5),
                height: 28,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.black),
                  color: Color(int.parse(item.color)),
                ),
              ),
              Text(item.id.toString()),
            ],
          ),
        ),
      );
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
