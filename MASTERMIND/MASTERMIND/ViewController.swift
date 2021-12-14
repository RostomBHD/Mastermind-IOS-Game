
// Rostom Benhamada 201531997 CW1.1


import UIKit


var wongames = 0


class ViewController: UIViewController {

    @IBOutlet weak var wongamestext: UITextField!
    
    
    
    @IBAction func Start(_ sender: Any) {
        performSegue(withIdentifier: "start", sender: nil)
        }
        
    
    override func viewDidLoad() {
        wongamestext.text = String(wongames)
        super.viewDidLoad()
        print(wongames)
    }
}


