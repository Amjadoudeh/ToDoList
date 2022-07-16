import Foundation

struct NetworkService {
    static let shared = NetworkService()

    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"

    let session = URLSession(configuration: .default)

    func getToDo() {
        let url = URL(string: "\(URL_BASE)")!

        let task = session.dataTask(with: url) { (data, response , error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                debugPrint("Invalid data or response")
                return
            }
            
            if response.statusCode == 200 {
                // successful result (todo)
            } else {
                // show error to the user
            }
        }
        task.resume()
    }

    func addToDo(todo: ToDo) {

    }
}
