import 'package:scoped_model/scoped_model.dart';

class PartyModel extends Model{
 List<String> selectedItemname=[];
 List<String> selectedItemurl=[];
 removeitem(index){
  selectedItemname.removeAt(index);
  selectedItemurl.removeAt(index);

 }

}

