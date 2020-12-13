import UIKit

enum Arrow {
    case iron, wooden, elven, dwarvish, magic, silver
}

struct CountedSet<Element : Hashable> {
    private(set) var dict: [Element: Int] = [:]
    
    mutating func insert(_ member: Element) {
        dict[member, default: 0] += 1
    }
    
    mutating func remove(_ member: Element) {
        if dict.keys.contains(member) {
            if let value = dict[member] {
                dict[member] = value - 1
            }
            if dict[member] == 0 {
                dict.removeValue(forKey: member)
            }
        } else {
            print("Element does not exist!")
        }
    }
    
    subscript(_ member: Element) -> Int {
        return dict[member] ?? 0
    }
    
    var count: String {
        return dict.count > 0 ? String(dict.count) : "isEmpty"
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            dict[element, default: 0] += 1
        }
    }
}

//var countedSet = CountedSet<String>()
//countedSet.insert("Hello")
//countedSet.insert("Hello")
//countedSet.insert("Bye")
//countedSet.remove("Hello")
//countedSet.remove("Yo")
//print(countedSet["Hello"])
//print(countedSet.count)

var aCountedSet = CountedSet<Arrow>()
print(aCountedSet[.iron])
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
print(myCountedSet[.iron])
myCountedSet.remove(.iron)
print(myCountedSet[.iron])
print(myCountedSet[.dwarvish])
