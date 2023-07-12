
import UIKit
import Moya

struct ItemModel: Decodable {
    var image: String
    var title: String
    var category: String
    var price: Float
}

enum ItemService {
    case getItems
    case getMoreItems
}

extension ItemService: TargetType {
    var baseURL: URL {
        switch self {
        case .getItems:
            return URL(string: "https://fakestoreapi.com/products?limit=10")!
            
        case .getMoreItems:
            return URL(string: "https://fakestoreapi.com/products")!
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}


