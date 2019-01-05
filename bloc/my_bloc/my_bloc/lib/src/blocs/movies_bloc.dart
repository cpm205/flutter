import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

//reactive programming - whenever there is new data coming from server，
// we have to update the UI screen.
// To make this updating task simple we are telling the UI screen to keep observing
// any change coming from the MoviesBloc class and accordingly update your content.
// This “observing” of new data can be doing using RxDart.

//Movie List Bloc: This is the bridge which will get data from the repository on
// demand and pass it to the Movie List Screen(I will explain about Single Instance in a while).
class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

//This way we are giving access to a single instance of the MoviesBloc class to the UI screen.
final bloc = MoviesBloc();