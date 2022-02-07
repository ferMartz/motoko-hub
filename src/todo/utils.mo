import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Buffer  "mo:base/Buffer";

import Types "./types";

module Utils {
    type ToDo = Types.ToDo;

    // Add ToDo item utility
    public func add(todos : [ToDo], desc : Text, nextId : Nat ) : [ToDo] {
        let todo : ToDo = {
            id = nextId;
            description = desc;
            completed = false;
        };

        Buffer.append<ToDo>([todo], todos);
    };


    // Show to-do item utility
    public func show(todos : [ToDo]) : Text {
        var output : Text = "\n__TO-DOs__";
        for (todo : ToDo in todos.vals()) {
            output #= "\n(" # Nat.toText(todo.id) # ") " # todo.description;
            if (todo.completed) { output #= " ✔"; };
        };
        output
    };

};