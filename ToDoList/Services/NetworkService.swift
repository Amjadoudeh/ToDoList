import Foundation

struct NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    
    func getToDos(onSeccess: @escaping (ToDos) -> Void) {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response , error) in
            DispatchQueue.main.async {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response")
                    return
                }
                do {
                    if response.statusCode == 200 {
                        // handle success
                        let items = try JSONDecoder().decode(ToDos.self, from: data)
                        onSeccess(items)
                    } else {
                        // handle error
                        let err = try JSONDecoder().decode(APIError.self, from: data)
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    func addToDo(todo: ToDo) {
        
    }
}
