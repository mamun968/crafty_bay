import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class SizePicker extends StatefulWidget {
  final List<String> sizes;
  final int selectedSizeIndex;

  const SizePicker({
    super.key,
    required this.sizes,
    required this.selectedSizeIndex,
  });

  @override
  State<SizePicker> createState() => _SizeSelectionListState();
}

class _SizeSelectionListState extends State<SizePicker> {
  int _selectedSizeIndex = 2;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _selectedSizeIndex = index;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2),
              color:
                  _selectedSizeIndex == index ? AppColors.primaryColor : null,
            ),
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
