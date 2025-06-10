import 'package:farm/model/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category=[];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.name = "Milk";
  categoryModel.image = "assets/milk.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Yogurt";
  categoryModel.image = "assets/yogurt.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Vegetables";
  categoryModel.image = "assets/vegetables.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.name = "Fruits";
  categoryModel.image = "assets/fruits.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}