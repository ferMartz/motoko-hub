import Int "mo:base/Int";
import Utils "./utils";

actor {
    // Immutable variable - you can't reassign the value
    // x will always equal 0
    let x : Int = 0;
    
    // Mutable variable - you can change the value later
    var y : Int = 0;

    // Reassign value y := 1;

    var counter : Int = 0;
    
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
    public func multiplication (n : Int) : async Int {
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

}