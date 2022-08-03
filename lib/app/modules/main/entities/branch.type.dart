
class Branch {

Branch({
 required this.id,
 required this.name,
 required  this.phone,
 required this.active

});

 int id;
 String name;
 String phone;
 bool active;

 factory Branch.fromVoid()=>Branch(
  id: 0, 
  name: '', 
  phone: '', 
  active: false
  );

factory Branch.fromJson(Map<String,dynamic>json)=> Branch(
  
  id:json["id"], 
  name:json["name"], 
  phone:json["phone"], 
  active:json["active"]
  
  );

  Map<String,dynamic>toJson()=>{

  "id":id, 
  "name":name, 
  "phone":phone, 
  "active":active
  };










}