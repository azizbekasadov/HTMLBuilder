//
//  File.swift
//  
//
//  Created by Azizbek Asadov on 16/03/24.
//

import Foundation

extension HTML {
    public struct Body: HtmlTag {
        let children: [HtmlTag]
        
        public init(@HtmlBuilder _ content: () -> [HtmlTag]) {
            self.children = content()
        }
        
        public func render() -> String {
            "<body>" +
            children
                .map { $0.render() }
                .joined() +
            "</body>"
        }
    }
    
    public struct Head: HtmlTag {
        let children: [HtmlTag]
        
        public init(@HtmlBuilder _ content: () -> [HtmlTag]) {
            self.children = content()
        }
        
        public func render() -> String {
            "<head>" +
            children
                .map { $0.render() }
                .joined() +
            "</head>"
        }
    }
    
    public struct Meta: HtmlTag {
        let name: String
        let content: String
        
        public func render() -> String {
            "<meta name=\"\(name)\" content=\"\(content)\">"
        }
    }
    
    public struct P: HtmlTag {
        let text: String
        
        public init(_ text: String) {
            self.text = text
        }
        
        public func render() -> String {
            "<p>" + text + "</p>"
        }
    }
    
    public struct H1: HtmlTag {
        let text: String
        
        public init(_ text: String) {
            self.text = text
        }
        
        public func render() -> String {
            "<h1>" + text + "</h1>"
        }
    }
    
    public struct Table: HtmlTag {
        let rows: [HtmlTag]
        
        public init(@HtmlBuilder _ content: () -> [HtmlTag]) {
            self.rows = content()
        }
        
        public func render() -> String {
            "<table>" +
            rows
                .map { $0.render() }
                .joined() +
            "</table>"
        }
    }
    
    public struct Tr: HtmlTag {
        let columns: [HtmlTag]
        
        public init(@HtmlBuilder _ content: () -> [HtmlTag]) {
            self.columns = content()
        }
        
        public func render() -> String {
            "<tr>" +
            columns
                .map { $0.render() }
                .joined() +
            "</tr>"
        }
    }
    
    public struct Td<Value: CustomStringConvertible>: HtmlTag {
        let data: Value
        
        public init(_ data: Value) {
            self.data = data
        }
        
        public func render() -> String {
            "<td>" + data.description + "</td>"
        }
    }
    
    public struct Th: HtmlTag {
        let title: String
        
        public init(_ title: String) {
            self.title = title
        }
        
        public func render() -> String {
            "<th>" + title + "</th>"
        }
    }
    
    public struct Img: HtmlTag {
        private var attributes: [Attribute] = []
        
        public init(url: String) {
            self.attributes.append(Attribute(key: "src", value: url))
        }

        public func render() -> String {
            return "<img " + buildAttributes() + ">"
        }
        
        private func buildAttributes() -> String {
            var attributesString = ""
            
            for attribute in attributes {
                attributesString.append(attribute.key + "=" + "\"\(attribute.value)\" ")
            }
            
            print(attributesString)
            return attributesString
        }
    }
    
    public struct Attribute {
        let key: String
        let value: String
    }
}

public extension HTML.Img {
    func alt(text: String) -> Self {
        var newImage = self
        newImage.attributes.append(HTML.Attribute(key: "alt", value: text))

        return newImage
    }
    
    func style(width: Int?, height: Int?) -> Self {
        var newImage = self
        
        if let width {
            newImage.attributes.append(HTML.Attribute(key: "width", value: "\(width)"))
        }
        
        if let height {
            newImage.attributes.append(HTML.Attribute(key: "height", value: "\(height)"))
        }
        
        return newImage
    }
}
