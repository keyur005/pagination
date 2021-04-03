import 'package:equatable/equatable.dart';
import 'package:pagination/category/model/category_response.dart';



abstract class  CategoryState extends Equatable {
   const CategoryState();
  @override
  List<Object> get props => [];
}

class InitialCategoryState   extends  CategoryState {
  @override
  List<Object> get props => [];

}

class  CategoryLoading extends  CategoryState{

  @override
  List<Object> get props => [];

}

class   CategoryDone extends  CategoryState{
  final CategoryResponse response;
  CategoryDone(this.response);


  @override
  List<Object> get props => [response];
}

class  CategoryError extends  CategoryState{
  final String error;
  CategoryError(this.error);

  @override
  List<Object> get props => [error];
}