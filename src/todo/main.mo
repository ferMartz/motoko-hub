
import Map "mo:base/HashMap";
import Trie "mo:base/Trie";
import Nat32 "mo:base/Nat32";
import Iter "mo:base/Iter";


actor Assistant {

    public type TodoId = Nat32;
   
    public type ToDo = {
        description: Text;
    };
    private stable var nextId : TodoId = 0;
    private stable var todos : Trie.Trie<TodoId, ToDo> = Trie.empty();
    
    
    public func create (todo : ToDo) : async TodoId {
        let next = nextId;
        nextId += 1;
        todos := Trie.replace(
            todos,
            key(next),
            Nat32.equal,
            ?todo,
        ).0;
        return next;
    };
    public query func showTodos () : async [ToDo] {
        let result = Trie.toArray<TodoId, ToDo, ToDo>(todos, transform);
        return result;
    };

    // Create a trie key from a todo identifier.
    private func key(x : TodoId) : Trie.Key<TodoId> {
        return { hash = x; key = x };
    };
    private func transform(id: TodoId, todo: ToDo): ToDo {
        return todo;
    };
};