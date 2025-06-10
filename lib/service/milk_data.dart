import 'package:farm/model/milk_model.dart';

List<MilkModel> getMilk(){
  List<MilkModel> milk=[];
  MilkModel milkModel = new MilkModel();

  milkModel.name = "Cow’s Milk";
  milkModel.image = "assets/cow.png";
  milkModel.price = "\$3";
  milk.add(milkModel);
  milkModel=new MilkModel();

  milkModel.name = "Goat’s Milk";
  milkModel.image = "assets/goat.png";
  milkModel.price = "\$8";
  milk.add(milkModel);
  milkModel=new MilkModel();

  milkModel.name = "Sheep’s Milk";
  milkModel.image = "assets/sheep.png";
  milkModel.price = "\$10";
  milk.add(milkModel);
  milkModel=new MilkModel();

  milkModel.name = "Buffalo Milk";
  milkModel.image = "assets/buffalo.png";
  milkModel.price = "\$15";
  milk.add(milkModel);
  milkModel=new MilkModel();

  milkModel.name = "Camel Milk";
  milkModel.image = "assets/camel.png";
  milkModel.price = "\$25";
  milk.add(milkModel);
  milkModel=new MilkModel();

  return milk;
}