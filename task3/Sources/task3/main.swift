import Foundation
import Alamofire

let queue = DispatchQueue(label: "alamofire-queue", attributes: .concurrent)

func getInput() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = String(data: inputData, encoding: String.Encoding.utf8)!
    return strData.trimmingCharacters(in: CharacterSet.newlines)
}

func printRepositories(_ repos: [Repo], for user: String) {
    print("Found \(repos.count) repositories for user \(user)")
    for repo in repos{
        print(repo.fullName)
    }
    print("That's all.")
}

func getRepositories(with name:String) {
    print("Serching......")
    Alamofire.request("https://api.github.com/users/\(name)/repos")
        .responseJSON(queue: queue) { response in
            switch response.result {
            case .success(_):
                if let result = response.result.value as? [String : String], result["message"] == "Not Found" {
                    print("Sorry, no user with name \(name) was found")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let repos = try decoder.decode([Repo].self, from: response.data!)
                    printRepositories(repos, for: name)
                } catch let error {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
    }
}

func main() {
    print("Input GitHub User to recieve list of his repositories, type \"exit\" to finish the program")
    var shouldQuit = false
    while !shouldQuit {
        let input = getInput()
        switch input {
        case "exit":
            shouldQuit = true
        default:
            if input != "" {
                getRepositories(with: input)
            }
        }
    }
}

main()
