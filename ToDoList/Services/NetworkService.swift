import Foundation

struct NetworkService {
    static let shared = NetworkService()

    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"

    let session = URLSession(configuration: .default)

    func getToDo() {
        let url = URL(string: "\(URL_BASE)")!

        let task = session.dataTask(with: url) { (data, _, _) in
            if let error = error {
                debugPrint(error.localizedDescription)
                return 
            }
        }
        task.resume()
    }

    func addToDo(todo: ToDo) {

    }
}
