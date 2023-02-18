
class ServicesCreateModel {

  var name = "";
  String description = "";
  String duration = "";
  String cost ;
  bool editMode = false;
  int id = -1;

  ServicesCreateModel({
    this.name = "",
    this.description = "",
    this.duration = "",
    this.cost = "",
  });

  setId(int id){
    this.id = id;
    return this;
  }

  setName(String value) {
    this.name = value;
    return this;
  }

  setDescription(String value) {
    this.description = value;
    return this;
  }

  setDuration(String value) {
    this.duration = value;
    return this;
  }

  setEditMode(){
    this.editMode = true;
    return this;
  }

  setCreateMode(){
    this.editMode = false;
    return this;
  }

  setCost(String value) {
    this.cost = value;
    return this;
  }

  reset(){
    this.cost = "";
    this.description = "";
    this.duration = "";
    this.name = "";
    this.editMode = false;
    this.id = -1;
    return this;
  }


}