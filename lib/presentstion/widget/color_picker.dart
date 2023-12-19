import 'package:flutter/material.dart';

import '../utility/color_extension.dart';

class ColorPicker extends StatefulWidget {
  final List<String> colors;
  final int selectedColorIndex;
  final Function(int) onColorSelected;

  const ColorPicker({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  ColorPickerState createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
 

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            widget.onColorSelected(index);
            
          },
          child: CircleAvatar(
            radius: 18,
            backgroundColor: HexColor.fromHex(widget.colors[index]),
            child: widget.selectedColorIndex == index
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : null,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}
