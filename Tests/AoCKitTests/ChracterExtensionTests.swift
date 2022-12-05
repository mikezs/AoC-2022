import XCTest
@testable import AoCKit

final class CharacterExtensionTests: XCTestCase {
    func testOrd() {
        XCTAssertEqual(Character("A").ord, 65)
        XCTAssertNil(Character("🎉").ord)
    }
}
