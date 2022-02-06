import Nat "mo:base/Bool";
import Int "mo:base/Int";

module {
    public func intToText (n : Int) : Text {
        let t : Text = Int.toText(n);
       
        return t;
    } ;
}