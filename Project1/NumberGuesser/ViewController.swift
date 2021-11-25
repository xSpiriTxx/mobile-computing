
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var textView: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var versucheLabel: UILabel!
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.newGame()
        print(self.model.target)
    }
    
    
    
    @IBAction func onEditingChanged(_ sender: Any) {
        if self.inputField.hasText {
            self.button.isEnabled = true
        }else{
            self.button.isEnabled = false
        }
            
    }
    @IBAction func onRestartButtonClicked(_ sender: Any) {
        self.model.newGame()
    }
    
    @IBAction func onCheckButtonClicked(_ sender: Any) {
        print(self.inputField.text!)
        
        var response: String!
        
        if Int(self.inputField.text!) != nil {
            switch compareTo() {
                case -1:
                    response = "kleiner"
                case 1:
                    response = "größer"
                default:
                    response = ""
            }
        }
        textView.text = response
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return compareTo() == 0
    }
    
    func compareTo () -> Int! {
        let inputInt = Int(inputField.text!) ?? -1
        return model.compare(guess: inputInt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as? ResultViewController
        
        if let vc = resultViewController {
            vc.model = model
        }
    }
    
}
