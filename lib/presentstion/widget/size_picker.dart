import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker(
      {super.key,
      required this.sizes,
      required this.onSizeSelected,
      required this.selectedSizeIndex});

  final List<String> sizes;
  final Function(int selectIndex) onSizeSelected;
  final int selectedSizeIndex;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  

  

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            widget.onSizeSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: widget.selectedSizeIndex == index
                    ? AppColors.primaryColor
                    : null),
            alignment: Alignment.center,
            child: Text(widget.sizes[index]),
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
