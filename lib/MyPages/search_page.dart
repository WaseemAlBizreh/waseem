import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:waseem/Variables.dart';

import 'ShowProduct.dart';

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApiProvider>(builder: (context, data, child){
      return LayoutBuilder(
        builder: (context, constraints){
          return Scaffold(
         body: Stack(
           children :[
           Column(
             children: [
               Container(
                 color: c1,
                 height: constraints.maxHeight * 0.3,
                 width: double.infinity ,
                 child: TextFormField(
                 ),
                ),
               Container(
                 height: constraints.maxHeight * 0.7,
                 width: double.infinity ,
                 color: c3,
                 child: ListView.builder(
               itemCount: data.product.length,
                 itemBuilder: (context, index) {
                   return InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(
                           builder: (_)=> ShowProduct(
                             product: data.product[index],)));
                     },
                     child: Container(
                       margin: EdgeInsets.fromLTRB(
                         constraints.maxWidth * 0.03,
                         constraints.maxHeight * 0.01,
                         constraints.maxWidth * 0.03,
                         constraints.maxHeight * 0.01,
                       ),
                       decoration: BoxDecoration(
                         color: c3,
                         borderRadius: BorderRadius.circular(15),
                       ),
                       child: Row(
                         children: [
                           Stack(
                             children:[
                               Container(
                                 width: constraints.maxWidth * 0.5,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(8.0),
                                   child: Image.network(
                                     data.product[index].image,
                                     fit: BoxFit.fitWidth,
                                   ),
                                 ),
                               ),
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(8.0),
                                 child: Container(
                                   padding: EdgeInsets.all(
                                       constraints.maxWidth * 0.01),
                                   color: c3,
                                   child: RotationTransition(
                                     turns: AlwaysStoppedAnimation(-35/360),
                                     child: Text(
                                       '${data.product[index].quantity}',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(
                             width: constraints.maxWidth * 0.02,
                           ),
                           Container(
                             margin: EdgeInsets.all(
                               constraints.maxWidth *0.01,
                             ),
                             height: constraints.maxHeight * 0.15,
                             child: Column(
                               crossAxisAlignment:
                               CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   height: constraints.maxHeight *0.01,
                                 ),
                                 Text(
                                   data.product[index].name,
                                   style: TextStyle(
                                     fontSize: constraints.maxWidth * 0.04,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 Text(
                                   data.product[index].category,
                                   style: TextStyle(
                                     fontSize: constraints.maxWidth * 0.04,
                                     fontWeight: FontWeight.w300,
                                     color: c4,
                                   ),
                                 ),
                                 SizedBox(
                                   height: constraints.maxHeight *0.01,
                                 ),
                                 Text(
                                     '\$${data.product[index].init_price}',
                                     style: TextStyle(
                                       decoration:
                                       TextDecoration.lineThrough,
                                       fontWeight: FontWeight.w400,
                                       color: c5,
                                     )),
                                 Text(
                                   '\$${data.product[index].main_price}',
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Color(0xff8e0000),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 },
               ),
               )
             ],
           ),
          ],
         ),
         );
        }
       );
      }
     );
  }
}