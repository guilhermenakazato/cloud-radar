import 'package:cloud_radar/presentation/components/cloud_appbar.dart';
import 'package:cloud_radar/presentation/components/cloud_autocomplete.dart';
import 'package:cloud_radar/presentation/components/list_item.dart';
import 'package:cloud_radar/data/models/city.dart';
import 'package:cloud_radar/presentation/theme/application_colors.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.appContext});
  final BuildContext appContext;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static final List<City> _cityOptions = <City>[
    City(cityName: "Água Clara", cityState: "Mato Grosso do Sul"),
    City(cityName: "Alcinópolis", cityState: "Mato Grosso do Sul"),
    City(cityName: "Amambai", cityState: "Mato Grosso do Sul"),
    City(cityName: "Anastácio", cityState: "Mato Grosso do Sul"),
    City(cityName: "Aquidauana", cityState: "Mato Grosso do Sul"),
    City(cityName: "Brasilândia", cityState: "Mato Grosso do Sul"),
  ];

  final _inputFocus = FocusNode();
  final controller = TextEditingController();

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
            CloudAutocomplete<City>(
              inputFocus: _inputFocus,
              controller: controller,
              displayTextWhenOptionTapped: (city) => city.cityName,
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text == "") {
                  return _cityOptions;
                }

                return _cityOptions.where((City option) {
                  return option.cityName
                      .toLowerCase()
                      .startsWith(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, options) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    City currentCity = options.elementAt(index);

                    return ListItem(
                      trailing: const Icon(CloudRadarIcons.world),
                      titleText: currentCity.cityName,
                      subtitleText: currentCity.cityState,
                      onTap: () {
                        onSelected(currentCity);
                      },
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
