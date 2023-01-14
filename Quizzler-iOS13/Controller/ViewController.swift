import UIKit

class ViewController: UIViewController {
    
    // Variables conectadas a la interfaz
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // questionLabel.text = quiz[Int.random(in: 0...5)]
        updateUI()
    }

    // Función para los botones de true y false
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // Hacemos ligeramente transparente el botón presionado y modificamos la fuente del botón presionado.
        sender.alpha = 0.5
        sender.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27.0)
        
        // Mandamos a llamar a la función para revisar la respuesta del usuario en una estructura condicional para retroalimentar sobre la respuesta seleccionada.
        if (quizBrain.checkAnswer(sender.currentTitle!)) { // La respuesta que ha seleccionado el usuario está en "sender.currentTitle!"
            questionLabel.text = "Correct!" // Actualizamos el texto de la etiqueta con el resultado de la respuesta elegida.
            sender.backgroundColor = UIColor.green
        }
        else {
            questionLabel.text = "Try again!"
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        // El siguiente método hace que el programa espere 0.4 segundos para realizar lo que tenga en su bloque de código.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.updateUI() // Actualizamos la etiqueta a la siguiente pregunta.
        }
    }
    
    // Función para cambiar la pregunta mostrada en la interfaz, reiniciar las características de los botones y actualizar la barra de progreso
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        trueButton.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        trueButton.alpha = 1.0
        falseButton.backgroundColor = UIColor.clear
        falseButton.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        falseButton.alpha = 1.0
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
 
 NOTA: Para que la progress bar funcione, además de estar posicionada bien, debe de tener constraints que la alargen sobre todo el contenedor.
 
 */
