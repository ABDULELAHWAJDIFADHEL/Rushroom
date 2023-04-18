//
//  NSDictionary+Extension.swift
//  Bayin
//
//  Created by Call Soft on 30/08/22.
//

import Foundation

// MARK: - Conversion of dictionary into JSON string and DATA
extension Dictionary {
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func dict2json() -> String {
        return json
    }
    
    func merged(with another: [Key: Value]) -> [Key: Value] {
        var result = self
        for entry in another {
            result[entry.key] = entry.value
        }
        return result
    }
    
    var jsonStringRepresentaiton: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
                                                                return nil
        }
        return String(data: theJSONData, encoding: .ascii)
    }
    
    func toJSONString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        } catch {
            return nil
        }
    }
    
    func toJSONStringFormatted() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        } catch {
            return nil
        }
    }
    
    func toJSONData() -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            return jsonData
        } catch {
            return nil
        }
    }
}

// MARK: - Conversion of array into JSON string and DATA
extension Array {
    func convertIntoJSONString() -> String? {
        do {
            let jsonData: Data = try JSONSerialization.data(withJSONObject: self, options: [])
            if  let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                return jsonString as String
            }
        } catch let error as NSError {
            print("Array convertIntoJSON - \(error.description)")
        }
        return nil
    }
    
    func toJSONStringFormatted() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            return String(data: jsonData, encoding: String.Encoding.utf8)!
        } catch {
            return nil
        }
    }
    
    func toJSONData() -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            return jsonData
        } catch {
            return nil
        }
    }
}

func uniq<S : Sequence, T : Hashable>(source: S) -> [T] where S.Iterator.Element == T {
    var buffer = [T]()
    var added = Set<T>()
    for elem in source {
        if !added.contains(elem) {
            buffer.append(elem)
            added.insert(elem)
        }
    }
    return buffer
}
