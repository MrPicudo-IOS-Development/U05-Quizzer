import UIKit

class ViewController: UIViewController {
    
    // Variables conectadas a la interfaz
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Arreglo de preguntas para nuestra aplicación
    let quiz = ["4 + 2 = 6", "5 - 3 = 1", "3 + 8 = 10",
                "7 x 12 = 84", "9 x 21 = 188", "3 x 17 = 51",
                "91 ÷ 7 = 13", "198 ÷ 9 = 23", "121 ÷ 11 = 12"]

    // Variable que controla la pregunta en la que nos encontramos.
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // questionLabel.text = quiz[Int.random(in: 0...5)]
        updateUI()
    }

    // Función para los botones de true y false
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // print(sender.currentTitle!)
        // Si el número de pregunta todavía no llega al número de preguntas totales menos 1...
        if(questionNumber < quiz.count-1) {
            questionNumber += 1
        }
        else {
            questionNumber = 0
        }
        updateUI()
    }
    
    // Función para cambiar la pregunta mostrada en la interfaz
    func updateUI() {
        questionLabel.text = quiz[questionNumber]
    }
    
    

}

