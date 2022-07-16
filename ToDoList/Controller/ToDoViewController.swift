import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var toDoItemText: UITextField!

    @IBOutlet weak var prioritySegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.shared.getToDo()
    }

    @IBAction func addToDoItem(_ sender: Any) {
    }
}
