

import 'package:farm/model/vegetables.dart';

List<VegetablesModel> getVegetables(){
  List<VegetablesModel> vegetables=[];
  VegetablesModel vegetablesModel = new VegetablesModel();


  vegetablesModel.name = "Spinach";
  vegetablesModel.image = "assets/spinach.png";
  vegetablesModel.price = "\$5";
  vegetables.add(vegetablesModel);
  vegetablesModel=new VegetablesModel();

  vegetablesModel.name = "Eggplant";
  vegetablesModel.image = "assets/eggplant.png";
  vegetablesModel.price = "\$3";
  vegetables.add(vegetablesModel);
  vegetablesModel=new VegetablesModel();

  vegetablesModel.name = "Potato";
  vegetablesModel.image = "assets/potato.png";
  vegetablesModel.price = "\$4";
  vegetables.add(vegetablesModel);
  vegetablesModel=new VegetablesModel();




  return vegetables;
}