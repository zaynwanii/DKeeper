import Text "mo:base/Text";
import List "mo:base/List";
import Debug "mo:base/Debug";



actor DKeeper{

  public type Note={
    title:Text;
    content:Text;
  };

  stable var notes:List.List<Note> = List.nil<Note>();

  public func createNote(titleText :Text, contentText: Text){

    let newNote={
      title=titleText;
      content=contentText;
    };

    notes:=List.push(newNote,notes);
    Debug.print(debug_show(newNote));
  };

  public query func readNote():async [Note]{
    return List.toArray(notes);
  };

  public func removeNote(id:Nat){
    var listFront=List.take(notes,id);
    var listBack=List.drop(notes,id+1);
    notes:=List.append(listFront,listBack);
  }

}