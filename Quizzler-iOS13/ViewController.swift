import UIKit

class ViewController: UIViewController {
    
    // Variables conectadas a la interfaz
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Arreglo bidimensional de preguntas para nuestra aplicación
    let quiz = [ ["4 + 2 = 6", "True"], ["5 - 3 = 1", "False"], ["3 + 8 = 10", "False"],
                 ["7 x 12 = 84", "True"], ["9 x 21 = 188", "False"], ["3 x 17 = 51", "True"],
                ["91 ÷ 7 = 13", "True"], ["198 ÷ 9 = 23", "False"], ["121 ÷ 11 = 12", "False"] ]

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
        let userAnswer = sender.currentTitle! // Puede ser "True" o "False"
        let correctAnswer = quiz[questionNumber][1]
        if (userAnswer == correctAnswer) {
            questionLabel.text = "Correct!" // Actualizamos el texto de la etiqueta con el resultado de la respuesta elegida.
        }
        else {
            questionLabel.text = "Try again!"
            questionNumber -= 1
        }
        // Si el número de pregunta todavía no llega al número de preguntas totales menos 1...
        if(questionNumber < quiz.count-1) {
            questionNumber += 1
        }
        else {
            questionNumber = 0
        }
        // El siguiente método hace que el programa espere 1.5 segundos para realizar lo que tenga en su bloque de código.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.updateUI() // Actualizamos la etiqueta a la siguiente pregunta.
        }
    }
    
    // Función para cambiar la pregunta mostrada en la interfaz
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

/* Código creado para practicar:
 
 // Primero habíamos creado las preguntas y sus respuestas con un arreglo bidimensional:
 
 */
