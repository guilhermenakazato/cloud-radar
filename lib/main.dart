import 'package:cloud_radar/logic/cubit/config_cubit.dart';
import 'package:cloud_radar/presentation/router/app_router.dart';
import 'package:cloud_radar/presentation/theme/application_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  runApp(const CloudRadar());
}

class CloudRadar extends StatefulWidget {
  const CloudRadar({super.key});

  @override
  State<CloudRadar> createState() => _CloudRadarState();
}

class _CloudRadarState extends State<CloudRadar> {
  final List<String> _imagesToPreload = [
    "assets/presentation1.png",
    "assets/presentation2-1.png",
    "assets/presentation3-1.png",
    "assets/presentation4.png",
  ];

  final _appRouter = AppRouter();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _precacheImages();
    FlutterNativeSplash.remove();
  }

  Future<void> _precacheImages() async {
    for (var image in _imagesToPreload) {
      await precacheImage(AssetImage(image), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfigCubit>(
      create: (context) => ConfigCubit(),
      child: MaterialApp(
        theme: ApplicationThemes.defaultTheme,
        title: 'Cloud Radar',
        themeMode: ThemeMode.dark,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
