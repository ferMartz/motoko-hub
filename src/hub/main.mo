import Int "mo:base/Int";
import Utils "./utils";
import Principal "mo:base/Principal";

actor {
    // Immutable variable - you can't reassign the value
    // x will always equal 0
    let x : Int = 0;
    
    // Mutable variable - you can change the value later
    var y : Int = 0;

    // Reassign value y := 1;
    
    // Stable variable maintains the state
    stable var counter : Int = 0;

    // Function simple hello world
    public query func hello () : async Text {
        return "Hello world from motoko!";
    };

    // Function simple greet
    public query func greet (txt : Text) : async Text {
        return "Hello there " # txt # "!";
    };
    
    // Function to add a number
    public func add (n : Int) : async Int {
        counter := counter + n;
        return counter;
    };

    // Function to substract a number
    public func sub (n : Int) : async Int {
        counter := counter - n;
        return counter;
    };

    // Function to multiply from - using Int base library
    public func multiply (n : Int) : async Int {
        counter := Int.mul(counter, n);
        return counter;

    };

    // Function to query the value of counter
    public query func showValue () : async Int {
        return counter;
    };

    // Function using utils module
    public func toText(n : Int) : async Text {
        let t = Utils.intToText(n);
        return t;
    };

    public shared (msg) func whoamiToText() : async Text {
        let caller = msg.caller;
        let identity = Principal.toText(caller);
        return "Mi identity is : " # identity # "!";
    };

    public shared (message) func whoami() : async Principal {
        return message.caller;
    };

}