import 'package:flutter/material.dart';
import 'movie_detail_bloc.dart';
export 'movie_detail_bloc.dart';


//Scoped Instance BLoC class - its only accessible to the screen its associated with or exposed to.
//The bloc is only accessible to the screen widget and other custom widgets below the Screen.
// We are using the InheritedWidget which will hold the BLoC inside it.
// InheritedWidget will wrap the Screen widget and let the Screen widget along with
// widgets below it have access to the BLoC.
// No parent widgets of the Screen Widget will have access to the BLoC.
class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key key, Widget child})
      : bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  //This class extends the InheritedWidget and provide access to the bloc through the of(context) method.
  //As you can see the of(context) is expecting a context as parameter.
  // This context belongs to the screen which InheritedWidget has wrapped.
  // In our case it is the movie detail screen.
  static MovieDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieDetailBlocProvider)
    as MovieDetailBlocProvider)
        .bloc;
  }
}