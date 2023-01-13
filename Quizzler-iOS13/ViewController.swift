import UIKit

class ViewController: UIViewController {
    
    // Variables conectadas a la interfaz
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    // Arreglo de objetos tipo Question para la aplicación, creados por Angela.
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
]

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
        let correctAnswer = quiz[questionNumber].answer
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
        // El siguiente método hace que el programa espere 0.5 segundos para realizar lo que tenga en su bloque de código.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI() // Actualizamos la etiqueta a la siguiente pregunta.
        }
    }
    
    // Función para cambiar la pregunta mostrada en la interfaz
    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
    }
    
}

/* Código creado para practicar:
 
 // Primero habíamos creado las preguntas y sus respuestas con un arreglo bidimensional:
 // Arreglo bidimensional de preguntas para nuestra aplicación
 let quiz = [   ["4 + 2 = 6", "True"], ["5 - 3 = 1", "False"], ["3 + 8 = 10", "False"],
                ["7 x 12 = 84", "True"], ["9 x 21 = 188", "False"], ["3 x 17 = 51", "True"],
                ["91 ÷ 7 = 13", "True"], ["198 ÷ 9 = 23", "False"], ["121 ÷ 11 = 12", "False"] ]
 // Accedíamos a las preguntas y sus respuestas así:
 let correctAnswer = quiz[questionNumber][1]
 func updateUI() {
     questionLabel.text = quiz[questionNumber][0]
 }
 
 // Arreglo de objetos de tipo Question que sirve como "base de datos" de las preguntas que aparecerán en nuestra aplicación.
 let quiz = [Question(text: "4 + 2 = 6", answer: "True"), Question(text: "5 - 3 = 1", answer: "False"), Question(text: "3 + 8 = 10", answer: "False"),
             Question(text: "7 x 12 = 84", answer: "True"), Question(text: "9 x 21 = 188", answer: "False"), Question(text: "3 x 17 = 51", answer: "True"),
             Question(text: "91 ÷ 7 = 13", answer: "True"), Question(text: "198 ÷ 9 = 23", answer: "False"), Question(text: "121 ÷ 11 = 12", answer: "False")]
 
 */
