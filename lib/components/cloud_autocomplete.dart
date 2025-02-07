import 'dart:async';

import 'package:cloud_radar/components/list_item.dart';
import 'package:cloud_radar/components/search_input.dart';
import 'package:cloud_radar/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class CloudAutocomplete<T extends Object> extends StatelessWidget {
  const CloudAutocomplete({
    super.key,
    required this.inputFocus,
    required this.controller,
    required this.iconOpacity,
    required this.displayTextWhenOptionTapped,
    required this.optionsBuilder,
    required this.optionsViewBuilder,
  });

  final FocusNode inputFocus;
  final TextEditingController controller;
  final double iconOpacity;
  final String Function(T) displayTextWhenOptionTapped;
  final FutureOr<Iterable<T>> Function(TextEditingValue) optionsBuilder;
  final Widget Function(BuildContext, void Function(T), Iterable<T>) optionsViewBuilder;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
      focusNode: inputFocus,
      textEditingController: controller,
      displayStringForOption: displayTextWhenOptionTapped,
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SearchInput(
            iconOpacity: iconOpacity,
            controller: textEditingController,
            inputFocus: focusNode,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          ),
        );
      },
      optionsBuilder: optionsBuilder,
      optionsViewBuilder: optionsViewBuilder,
    );
  }
}
