import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/blocs/currentw_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWeatherBloc(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageView> {
  final unfocusNode = FocusNode();

  TextEditingController? _textController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 244, 155, 0),
          automaticallyImplyLeading: false,
          title: const Text(
            'My Weather App',
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: IconButton(
                            // borderColor: Colors.black,
                            // borderRadius: 10,
                            // borderWidth: 1,
                            // buttonSize: 40,
                            icon: const Icon(
                              Icons.my_location_outlined,
                              color: Color.fromARGB(255, 244, 155, 0),
                              size: 24,
                            ),
                            onPressed: () async {
                              if (await Permission.contacts
                                  .request()
                                  .isGranted) {
                                // Either the permission was already granted before or the user just granted it.
                              }

                              // You can request multiple permissions at once.
                              Map<Permission, PermissionStatus> statuses =
                                  await [
                                Permission.location,
                              ].request();

                              //if granted, get location
                              if (statuses[Permission.location] ==
                                  PermissionStatus.granted) {
                                //get location
                                Position _position =
                                    await Geolocator.getCurrentPosition(
                                        desiredAccuracy: LocationAccuracy.high);
                                print(_position);
                                //add FetchByLocation event
                                context.read<CurrentWeatherBloc>().add(
                                      FectchByLocation(_position.latitude,
                                          _position.longitude),
                                    );
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: const AlignmentDirectional(0, 0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 8, 0),
                                child: TextFormField(
                                  onEditingComplete: () {
                                    context.read<CurrentWeatherBloc>().add(
                                          FectchByName(
                                              cityname: _textController?.text),
                                        );
                                  },
                                  controller: _textController,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    // labelText: 'City Name?',
                                    hintText: 'City ,Country',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 244, 155, 0),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      // print(_textController?.text);
                                      //TODO: catch error
                                      //TODO: update page state,data
                                      // 1. update the CurrentWeather Bloc
                                      context.read<CurrentWeatherBloc>().add(
                                            FectchByName(
                                                cityname:
                                                    _textController?.text),
                                          );
                                    },
                                    child: const Icon(
                                      Icons.search,
                                      color: Color(0xFFEC6E4C),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: BlocConsumer<CurrentWeatherBloc, WeatherState>(
                    listener: (context, state) {
                      if (state.status.isFailure || state.status.isSuccess) {
                        //clean up the textfield
                        _textController?.clear();
                        //unfocus the textfield
                        FocusScope.of(context).requestFocus(unfocusNode);
                      }
                    },
                    builder: (context, state) {
                      if (state.status.isInitial) {
                        //TODO: Require Location Message:
                        return const Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('🏙️', style: TextStyle(fontSize: 64)),
                            Text(
                              'Please provide a City/ your location!',
                            ),
                          ],
                        );
                      }
                      if (state.status.isFailure) {
                        //TODO: Show SomeTime Went Wrong
                        return const Center(
                          child: Text('Something Went Wrong'),
                        );
                      }
                      if (state.status.isLoading) {
                        //show loading indicator
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      DateTime _dt =
                          DateTime.fromMillisecondsSinceEpoch(state.updateat);

                      return RefreshIndicator(
                        onRefresh: () async {
                          context
                              .read<CurrentWeatherBloc>()
                              .add(RefreshCurrent());
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          clipBehavior: Clip.none,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl:
                                        'https://openweathermap.org/img/wn/${state.icon}@4x.png',
                                    width: double.infinity,
                                    height: 220,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              //TODO style it
                              Text(
                                '${state.city} ,${state.country}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${state.description}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${state.temperature} °C',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${state.humidity}%',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //TODO convert to text
                              //yyyy-MM-dd HH:mm
                              Text(
                                'Updated: ${_dt.year}-${_dt.month}-${_dt.day} ${_dt.hour}:${_dt.minute}',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
