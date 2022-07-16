import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var toDoItemText: UITextField!

    @IBOutlet weak var prioritySegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.shared.getToDos { (todos) in
            debugPrint(todos)
        }
    }

    @IBAction func addToDoItem(_ sender: Any) {
    }
}
