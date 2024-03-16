
import SwiftUI
import WebKit

@resultBuilder
public struct HtmlBuilder {
    public static func buildBlock() -> [HtmlTag] { [] }
    
    public static func buildBlock(_ components: HtmlTag...) -> [HtmlTag] { components }
    
    public static func buildBlock(_ components: [HtmlTag]...) -> [HtmlTag] {
        components.flatMap { $0 }
    }
    
    public static func buildArray(_ components: [[HtmlTag]]) -> [HtmlTag] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: HtmlTag) -> [HtmlTag] { [expression] }
    
    public static func buildOptional(_ component: [HtmlTag]?) -> [HtmlTag] { component ?? [] }
    
    public static func buildEither(first component: [HtmlTag]) -> [HtmlTag] { component }
    
    public static func buildEither(second component: [HtmlTag]) -> [HtmlTag] { component }
}
