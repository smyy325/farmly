import 'package:farm/model/yogurt.dart';

List<YogurtModel> getYogurt(){
  List<YogurtModel> yogurt=[];
  YogurtModel yogurtModel = new YogurtModel();



  yogurtModel.name = "Cow's Yogurt";
  yogurtModel.image = "assets/cow.png";
  yogurtModel.price = "\$10";
  yogurt.add(yogurtModel);
  yogurtModel=new YogurtModel();

  yogurtModel.name = "Goat's Yogurt";
  yogurtModel.image = "assets/goat.png";
  yogurtModel.price = "\$25";
  yogurt.add(yogurtModel);
  yogurtModel=new YogurtModel();

  yogurtModel.name = "Sheep's Yogurt";
  yogurtModel.image = "assets/sheep.png";
  yogurtModel.price = "\$34";
  yogurt.add(yogurtModel);
  yogurtModel=new YogurtModel();


  return yogurt;
}