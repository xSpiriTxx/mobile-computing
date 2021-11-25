import Foundation

class Model {
    
    public var target = 0
    //var guesses = Set<Int>()
    var guesses = [Int]()
    
    func newGame() {
        self.target = Int.random(in: 0...100)
    }
    
    func isCorrect(guess: Int!) -> Bool {
        return guess == self.target
    }
    
    func versuche() -> Int {
        return self.guesses.count;
    }
    
    func compare (guess: Int!) -> Int {
        //guesses.insert(guess)
        guesses.append(guess)
        var compareResult = 0
        
        if guess > self.target {
            compareResult = -1
        } else if guess < self.target {
            compareResult = 1
        } else {
            compareResult = 0
        }
        
        return compareResult
        
    }
    
}
