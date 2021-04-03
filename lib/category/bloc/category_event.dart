import 'package:equatable/equatable.dart';


abstract class  CategoryEvent extends Equatable {
  const CategoryEvent();

}
class CategoryButtonClickEvent extends  CategoryEvent{

  final String id;
  final String device;
  final String model;
  final String token;
  final int page;



  CategoryButtonClickEvent(this.id, this.device, this.model, this.token, this.page);


  @override
  List<Object> get props => [id,device,model,token,page];
}