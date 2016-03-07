<?php
/**
 * ownCloud - Tasks
 *
 * @author Raimund Schlüßler
 * @copyright 2015 Raimund Schlüßler raimund.schluessler@googlemail.com
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU AFFERO GENERAL PUBLIC LICENSE for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

namespace OCA\Tasks\Controller;

use \OCA\Tasks\Service\SettingsService;
use \OCP\IRequest;
use \OCP\AppFramework\Controller;

class SettingsController extends Controller {

	private $settingsService;

	use Response;

	public function __construct($appName, IRequest $request, SettingsService $settingsService){
		parent::__construct($appName, $request);
		$this->settingsService = $settingsService;
	}

	/**
	 * @NoAdminRequired
	 */
	public function get(){
		return $this->generateResponse(function () {
			return ['settings' => $this->settingsService->get()];
		});
	}

	/**
	 * @NoAdminRequired
	 */
	public function set($setting, $type, $value){
		return $this->generateResponse(function () use ($setting, $type, $value) {
			return $this->settingsService->set($setting, $type, $value);
		});
	}
}
