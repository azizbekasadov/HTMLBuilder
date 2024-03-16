//
//  File.swift
//  
//
//  Created by Azizbek Asadov on 16/03/24.
//

import Foundation

extension HTML {
    public struct Title: HtmlTag {
        let title: String
        
        public init(_ title: String) {
            self.title = title
        }
        
        public func render() -> String {
            "<title>" + title + "</title>"
        }
    }
}
