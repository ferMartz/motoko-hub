
import Map "mo:base/HashMap";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";
import Iter "mo:base/Iter";


actor Assistant {

    type Id = Nat32;
   
    type ToDo = {
        
        description: Text;
    };

    let todos = Map.HashMap<Id, ToDo>(0, Nat32.equal, func (a : Nat32) : Nat32 {a});
    var nextId : Id = 0;
    
    public func insert (todo : ToDo): async () {
        todos.put(nextId, todo);
        nextId += 1;
    };
    public query func showTodos () : async [(Id, ToDo)] {
        Iter.toArray(todos.entries());
    };
};