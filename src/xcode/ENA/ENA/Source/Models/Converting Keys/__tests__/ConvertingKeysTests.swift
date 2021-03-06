//
// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import XCTest
import ExposureNotification
@testable import ENA

final class ConvertingKeysTests: XCTestCase {
	func testToSapKeyConversion() {
		let key = TemporaryExposureKeyMock(
			keyData: Data("hello".utf8),
			rollingPeriod: 123,
			rollingStartNumber: 456,
			transmissionRiskLevel: 88
		).sapKey
		XCTAssertEqual(key.keyData, Data("hello".utf8))
		XCTAssertEqual(key.rollingPeriod, 123)
		XCTAssertEqual(key.rollingStartIntervalNumber, 456)
		XCTAssertEqual(key.transmissionRiskLevel, 88)
	}
}

private final class TemporaryExposureKeyMock: ENTemporaryExposureKey {
	init(
		keyData: Data,
		rollingPeriod: ENIntervalNumber,
		rollingStartNumber: ENIntervalNumber,
		transmissionRiskLevel: ENRiskLevel
	) {
		_keyData = keyData
		_rollingPeriod = rollingPeriod
		_rollingStartNumber = rollingStartNumber
		_transmissionRiskLevel = transmissionRiskLevel
		super.init()
	}

	var _keyData: Data
	override var keyData: Data {
		get { _keyData }
		set { _keyData = newValue }
	}

	var _rollingPeriod: ENIntervalNumber
	override var rollingPeriod: ENIntervalNumber {
		get { _rollingPeriod }
		set { _rollingPeriod = newValue }
	}

	var _rollingStartNumber: ENIntervalNumber
	override var rollingStartNumber: ENIntervalNumber {
		get { _rollingStartNumber }
		set { _rollingStartNumber = newValue }
	}

	var _transmissionRiskLevel: ENRiskLevel
	override var transmissionRiskLevel: ENRiskLevel {
		get { _transmissionRiskLevel }
		set { _transmissionRiskLevel = newValue }
	}
}
