import Foundation
struct ToDos: Codable {
    let items: Array<ToDo>
}

struct ToDo: Codable {
    let item: String
    let priority: Int
}
