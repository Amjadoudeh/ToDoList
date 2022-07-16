import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var toDoItemText: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var toDoTable: UITableView!
    
    var todos = Array<ToDo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTable.delegate = self
        toDoTable.dataSource = self
        getToDos()
       
    }
    func getToDos() {
        NetworkService.shared.getToDos { (todos) in
            self.todos = todos.items
            self.toDoTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    @IBAction func addToDoItem(_ sender: Any) {
    }
}
