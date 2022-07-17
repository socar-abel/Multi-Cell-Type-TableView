import Foundation

class Entity: Decodable {
    let viewItems: [ViewItem]
}

class ViewItem: Decodable {
    let viewType: String?
    // ViewObject -> OneLineViewObject, TwoLineViewObject, OneImageViewObject
    var viewObject: ViewObject?
    
    enum CodingKeys: String, CodingKey {
        case viewType, viewObject
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        viewType = try container.decode(String.self, forKey: .viewType)
        viewObject = nil
        
        switch viewType {
        case ViewType.oneLine.rawValue:
            viewObject = try container.decode(OneLineViewObject.self, forKey: .viewObject)
            
        case ViewType.twoLine.rawValue:
            viewObject = try container.decode(TwoLineViewObject.self, forKey: .viewObject)
            
        case ViewType.oneImage.rawValue:
            viewObject = try container.decode(OneImageViewObject.self, forKey: .viewObject)
            
        default:
            return
        }
    }
}

class ViewObject : Decodable { }

class OneLineViewObject: ViewObject {
    var text1: String?
    
    enum Keys: String, CodingKey {
        case text1
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.text1 = try container.decode(String.self, forKey: .text1)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
}

class TwoLineViewObject: ViewObject {
    var text1: String?
    var text2: String?
    
    enum Keys: String, CodingKey {
        case text1
        case text2
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.text1 = try container.decode(String.self, forKey: .text1)
        self.text2 = try container.decode(String.self, forKey: .text2)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
}

class OneImageViewObject: ViewObject {
    var url: String?

    enum Keys: String, CodingKey {
        case url
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.url = try container.decode(String.self, forKey: .url)
        let superDecoder = try container.superDecoder()
        try super.init(from: superDecoder)
    }
}

