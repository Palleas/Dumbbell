import XCTest

@testable import Dumbbell

class BuildTests: XCTestCase {

    func testBuildsAreDecoded() {
        let payload = """
[{
"_id": "58b899061baced0100616172",
"app_id": "58b897fb1baced010061616e",
"repo_url": "git@github.com:myorg/2048.git",
"build_status": "failed",
"finished": true,
"commit_info": {
"tags": [],
"branch": "master",
"commit_sha": "54a9faeccc0979aaa16f3226562a24fb3330e9f0",
"author": "David Pie",
"message": "Add new crash type",
"html_url": "https://github.com/myorg/2048/commit/54a9faeccc0979aaa16f3226562a24fb3330e9f0"
},
"build_number": 2,
"created_at": "2017-03-02T22:13:26.728Z",
"started_at": "2017-03-02T22:15:11.381Z",
"finished_at": "2017-03-02T22:20:06.432Z",
"test_summary": {
"tests_count": 10,
"tests_passed": 9,
"code_coverage_percentage": 0.6878079796534735
},
"links": {
"download": [
{
"name": "m2048 - Release",
"url": "https://dashboard.buddybuild.com/api/download/download-ipa?buildID=58b899061baced0100616172"
}
],
"install": [
{
"name": "m2048 - Release",
"url": "https://dashboard.buddybuild.com/download/ios?buildID=58b899061baced0100616172"
}
]
}
}]
""".data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Formatter.date)

        let builds = try! decoder.decode(Array<Build>.self, from: payload)
        XCTAssertEqual(builds.count, 1)
    }
}
