import 'package:cloud_radar/data/models/weather.dart';
import 'package:cloud_radar/logic/cubit/forecast_cubit.dart';
import 'package:cloud_radar/logic/cubit/temperature_scale_cubit.dart';
import 'package:cloud_radar/presentation/components/prediction.dart';
import 'package:cloud_radar/presentation/theme/cloud_radar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastList extends StatelessWidget {
  final List<Weather> predictions;

  const ForecastList({super.key, required this.predictions});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemperatureScaleCubit, TemperatureScaleState>(
      builder: (context, temperatureState) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.11,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Weather weatherPrediction = predictions[index];
              bool forecastIsSelected =
                  context.read<ForecastCubit>().state.selectedForecastIndex ==
                      index;
    
              return Prediction(
                day: weatherPrediction.numberDate,
                minTemperature: weatherPrediction.minTemperature,
                maxTemperature: weatherPrediction.maxTemperature,
                icon: CloudRadarIcons.rain,
                selected: forecastIsSelected,
                onTap: () {
                  context.read<ForecastCubit>().changeSelectedForecast(index);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 2,
              );
            },
          ),
        );
      },
    );
  }
}
