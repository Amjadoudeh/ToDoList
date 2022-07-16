import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    
    func updateCell(todo: ToDo) {
        itemLabel.text = todo.item
        
        switch todo.priority {
        case 1:
            priorityView.backgroundColor = UIColor.yellow
            break
        case 2:
            priorityView.backgroundColor = UIColor.orange
            break
        default:
            priorityView.backgroundColor = UIColor.red
        }
    }
}
