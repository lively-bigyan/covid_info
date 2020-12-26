import 'package:corona_nepal/blocs/affected_bloc.dart';
import 'package:corona_nepal/blocs/countries_bloc.dart';
import 'package:corona_nepal/blocs/faq_bloc.dart';
import 'package:corona_nepal/blocs/hospital_bloc.dart';
import 'package:corona_nepal/blocs/myth_bloc.dart';
import 'package:corona_nepal/blocs/nepal_bloc.dart';
import 'package:corona_nepal/blocs/news_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
setupLocators() {
  locator.registerSingleton<CountriesBloc>(CountriesBloc());
  locator.registerSingleton<HospitalsBloc>(HospitalsBloc());
  locator.registerSingleton<FAQBloc>(FAQBloc());
  locator.registerSingleton<NewsBloc>(NewsBloc());
  locator.registerSingleton<MythBloc>(MythBloc());
  locator.registerSingleton<StatsBloc>(StatsBloc());
  locator.registerSingleton<AffectedBloc>(AffectedBloc());
}
