import 'package:farm/model/fruits.dart';

List<FruitsModel> getFruits(){
  List<FruitsModel> fruits=[];
  FruitsModel fruitsModel = new FruitsModel();


  fruitsModel.name = "Avocado";
  fruitsModel.image = "assets/avocado.png";
  fruitsModel.price = "\$2";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();

  fruitsModel.name = "Mango";
  fruitsModel.image = "assets/mango.png";
  fruitsModel.price = "\$3";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();

  fruitsModel.name = "Pineapple";
  fruitsModel.image = "assets/pineapple.png";
  fruitsModel.price = "\$4";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();

  fruitsModel.name = "Coconut";
  fruitsModel.image = "assets/coconut.png";
  fruitsModel.price = "\$3";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();

  fruitsModel.name = "Blueberry";
  fruitsModel.image = "assets/blueberry.png";
  fruitsModel.price = "\$13";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();

  fruitsModel.name = "Papaya";
  fruitsModel.image = "assets/papaya.png";
  fruitsModel.price = "\$5";
  fruits.add(fruitsModel);
  fruitsModel=new FruitsModel();


  return fruits;
}