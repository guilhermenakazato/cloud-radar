import 'package:cloud_radar/components/cloud_appbar.dart';
import 'package:cloud_radar/components/search_input.dart';
import 'package:cloud_radar/components/search_result.dart';
import 'package:cloud_radar/models/city.dart';
import 'package:cloud_radar/theme/application_colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.appContext});
  final BuildContext appContext;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// TODO: arrumar opacity..................
class _SearchScreenState extends State<SearchScreen> {
  static final List<City> _kOptions = <City>[
    City(cityName: "Água Clara", cityState: "Mato Grosso do Sul"),
    City(cityName: "Alcinópolis", cityState: "Mato Grosso do Sul"),
    City(cityName: "Amambai", cityState: "Mato Grosso do Sul"),
  ];

  final FocusNode _inputFocus = FocusNode();
  double _iconOpacity = 0.25;

  @override
  void initState() {
    super.initState();
    _inputFocus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _inputFocus.removeListener(_onFocusChange);
    _inputFocus.dispose();
  }

  void _onFocusChange() {
    double newOpacity = _inputFocus.hasFocus ? 1 : 0.25;

    setState(() {
      _iconOpacity = newOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.black800,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(
            widget.appContext,
          ).top,
        ),
        child: Column(
          children: [
            const CloudAppbar(
              titleText: "Escolha a cidade",
            ),
            Autocomplete<City>(
              fieldViewBuilder: (
                context,
                textEditingController,
                focusNode,
                onFieldSubmitted,
              ) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SearchInput(
                    iconOpacity: _iconOpacity,
                    controller: textEditingController,
                    inputFocus: focusNode,
                  ),
                );
              },
              optionsBuilder: (
                TextEditingValue textEditingValue,
              ) {
                debugPrint(textEditingValue.text);
                if (textEditingValue.text == '') {
                  return _kOptions;
                }
                return _kOptions.where(
                  (
                    City option,
                  ) {
                    return option.cityName
                        .toLowerCase()
                        .startsWith(textEditingValue.text.toLowerCase());
                  },
                );
              },
              optionsViewBuilder: (context, onSelected, options) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    City currentCity = options.elementAt(index);
                    return SearchResult(
                      titleText: currentCity.cityName,
                      subtitleText: currentCity.cityState,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
