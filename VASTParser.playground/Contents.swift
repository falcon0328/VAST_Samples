import Foundation

class SampleXMLParserDelegate: NSObject, XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("didStartElement: \(elementName)")
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("foundCharcters: \(string)")
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("didEndElement: \(elementName)")
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parseErrorOccurred: \(parseError)")
    }
}

// InlineのEventTracking
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Inline_Event_Tracking-test.xml")!
// InLineのCompanionを含んだVAST
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Inline_Companion_Tag-test.xml")!
// InLineのLinearを含んだVAST
let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Inline_Linear_Tag-test.xml")!
// InLineのNonLinearAdsを含んだVAST
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Inline_Non-Linear_Tag-test.xml")!
// Wrapperを含まないVAST
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/No_Wrapper_Tag-test.xml")!
// Wrapperを含むVAST
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Video_Clicks_and_click_tracking-Inline-test.xml")!
// VideoClicksとClickTrackingを含んだVAST
//let url = URL(string: "https://falcon0328.github.io/VAST_Samples/VAST_3_0_Samples/Video_Clicks_and_click_tracking-Inline-test.xml")!

// パーサーのインスタンスを生成
guard let parser = XMLParser(contentsOf: url) else {
    print("【ERROR】XMLParser is not initialized")
    exit(0)
}

print("【OK】XMLParser is initialized")

// 外部のリソースを取得できるようにする
//parser.shouldResolveExternalEntities = true
let parserDelegate = SampleXMLParserDelegate()
parser.delegate = parserDelegate

// パースに成功したかどうか
// 通信エラーなどで、エラーが起きた場合はFalseになる
let success = parser.parse()

print(success)
