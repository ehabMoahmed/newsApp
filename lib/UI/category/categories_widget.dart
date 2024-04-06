import 'package:flutter/material.dart';
import 'package:newsapp/Shared/app_colors.dart';

  import '../../data_layer/Model/category-model.dart';
import 'one-category.dart';

typedef OnCategoryClick=void Function(CategoryModel categoryModel);
class CategoriesWidget extends StatelessWidget {
  OnCategoryClick CategoryClick;
  CategoriesWidget({required this.CategoryClick});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel>Allcategory=CategoryModel.AllCategory();
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick your category\n of interest",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.PickCategoryColor,
              fontSize: 22
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 25

                ),

              itemCount: Allcategory.length,
              itemBuilder: (context, index) =>
                  InkWell(
                onTap: (){
                  CategoryClick( Allcategory[index]);
                },
                child: CategoryWidget(
                  title:Allcategory[index].title ,
                  index: index,
                  background: Allcategory[index].backgroundColor,
                  image: Allcategory[index].imagePath,
                ),
              ) ,
            ),
          ),


        ],
      ),
    );
  }
}
