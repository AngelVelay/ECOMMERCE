
class Cfdi {

Cfdi({
 required this.id,
 required this.name,
 required this.active

});

 int id;
 String name;
 bool active;

 factory Cfdi.fromVoid()=>Cfdi(
    id: 0, 
    name: '', 
    active: false
  );

factory Cfdi.fromJson(Map<String,dynamic>json)=> Cfdi(
  
    id:json["id"], 
    name:json["name"], 
    active:json["active"]
  
  );

  Map<String,dynamic>toJson()=>{
    "id":id, 
    "name":name, 
    "active":active
  };










}