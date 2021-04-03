import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pagination/category/model/category_response.dart';
import 'package:pagination/category/services/repository.dart';
import 'package:pagination/category/bloc/bloc.dart';






class CategoryBloc extends Bloc<CategoryEvent,CategoryState> {
  final RepositoryCategory repository;
  CategoryBloc(this.repository) : super(null);

  @override
 CategoryState get initialState => InitialCategoryState();

  @override
  Stream<CategoryState> mapEventToState(
     CategoryEvent event,
      ) async* {
    try{
      if(event is  CategoryButtonClickEvent){
        yield CategoryLoading();

        CategoryResponse response = await repository.category(event.id, event.device, event.model, event.token, event.page);

        yield CategoryDone(response);
      }
    }catch(error){
      yield CategoryError(error.toString());
    }
  }
}