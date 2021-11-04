import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_clean/bloc/catalog/catalog_bloc.dart';
import 'package:poc_clean/bloc/catalog/catalog_event.dart';
import 'package:poc_clean/bloc/details/details_bloc.dart';

import 'package:poc_clean/views/catalog_view.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc()
            ..add(
              CatalogLoadEvent(),
            ),
        ),
        BlocProvider(create: (_) => DetailBloc()),
      ],
      child: const CatalogViewState(),
    ),
  );
}
