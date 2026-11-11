///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Utility Designers'
	String get app => 'Utility Designers';

	late final Translations$bodystar$en bodystar = Translations$bodystar$en.internal(_root);

	/// en: 'Sensor not found'
	String get sensor_not_found => 'Sensor not found';

	/// en: 'Connected successfully'
	String get connected_successfully => 'Connected successfully';

	/// en: 'Sensor not connected'
	String get sensor_not_connected => 'Sensor not connected';

	/// en: 'Need to enable Bluetooth'
	String get need_bluetooth_ios => 'Need to enable Bluetooth';

	/// en: 'Error connecting to sensor'
	String get error_connecting_to_sensor => 'Error connecting to sensor';

	late final Translations$home$en home = Translations$home$en.internal(_root);
	late final Translations$history$en history = Translations$history$en.internal(_root);
	late final Translations$widgets$en widgets = Translations$widgets$en.internal(_root);

	/// en: 'Recording data'
	String get recording_data => 'Recording data';

	/// en: 'Sensor is already connected'
	String get sensor_is_already_connected => 'Sensor is already connected';

	/// en: 'Do not turn off the screen'
	String get do_not_turn_off_screen => 'Do not turn off the screen';

	/// en: 'If the screen of the cell phone turns off, the device may stop recording. The screen brightness will automatically decrease to avoid excessive battery consumption.'
	String get do_not_turn_off_screen_description => 'If the screen of the cell phone turns off, the device may stop recording. The screen brightness will automatically decrease to avoid excessive battery consumption.';

	/// en: 'Seeking out...'
	String get searching => 'Seeking out...';
}

// Path: bodystar
class Translations$bodystar$en {
	Translations$bodystar$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Connect Bodystar'
	String get connect => 'Connect Bodystar';

	/// en: 'Bodystar Connection'
	String get connection => 'Bodystar Connection';

	/// en: 'We found some nearby Bodystar sensors.'
	String get found_sensors => 'We found some nearby Bodystar sensors.';

	/// en: 'We found more than one Bodystar sensor near the smartphone. Choose which sensor you want to use for this exam.'
	String get found_more_than_one => 'We found more than one Bodystar sensor near the smartphone. Choose which sensor you want to use for this exam.';

	/// en: 'Bodystar successfully connected'
	String get success_connected => 'Bodystar successfully connected';

	/// en: 'The Bodystar sensor is connected! Now, place it on your body:'
	String get connected => 'The Bodystar sensor is connected!\nNow, place it on your body:';

	/// en: 'Place a strip horizontally over the Bodystar, leaving excess on the sides for fixation.'
	String get insert_tap => 'Place a strip horizontally over the Bodystar, leaving excess on the sides for fixation.';

	/// en: 'How to position the Bodystar sensor'
	String get how_to_position => 'How to position the Bodystar sensor';

	/// en: 'Place the tape 10cm horizontally over the Bodystar, leaving excess on the sides.'
	String get position_tap => 'Place the tape 10cm horizontally over the Bodystar, leaving excess on the sides.';

	/// en: 'Position the sensor vertically, just below the collarbone line. The button and LED should face towards the neck.'
	String get position_chest => 'Position the sensor vertically, just below the collarbone line. The button and LED should face towards the neck.';

	/// en: 'How to connect the Bodystar sensor'
	String get how_to_connect => 'How to connect the Bodystar sensor';

	/// en: 'Position the sensor vertically just below the collarbone line, with the button and LED facing towards the neck.'
	String get align => 'Position the sensor vertically just below the collarbone line, with the button and LED facing towards the neck.';

	/// en: 'Where to position the Bodystar'
	String get where_position => 'Where to position the Bodystar';

	/// en: 'The Bodystar sensor should be positioned in the chest area near the sternum. The sternum is the bone located in the anterior midline of our chest and is part of the anterior thoracic cavity.'
	String get where_position_chest => 'The Bodystar sensor should be positioned in the chest area near the sternum.\n\nThe sternum is the bone located in the anterior midline of our chest and is part of the anterior thoracic cavity.';

	/// en: 'To connect the Bodystar to your phone, it uses Bluetooth technology. Remember to enable Bluetooth on your smartphone.'
	String get connect_bluetooth => 'To connect the Bodystar to your phone, it uses Bluetooth technology. Remember to enable Bluetooth on your smartphone.';

	/// en: 'How to turn on the Bodystar'
	String get how_to_turn_on => 'How to turn on the Bodystar';

	/// en: 'To turn on the sensor, just find and press the action button located at the center top of the Bodystar.'
	String get localize_central_button => 'To turn on the sensor, just find and press the action button located at the center top of the Bodystar.';

	/// en: 'Turn on the Bodystar to start the connection.'
	String get idle_turn_on => 'Turn on the Bodystar to start the connection.';

	/// en: 'To get started, turn on the Bodystar by pressing the action button.'
	String get press_button_to_turn_on => 'To get started, turn on the Bodystar by pressing the action button.';

	/// en: 'After turning it on, wait until the blue LED blinks, indicating that the sensor is ready to connect.'
	String get after_turned_on => 'After turning it on, wait until the blue LED blinks, indicating that the sensor is ready to connect.';

	/// en: 'After turning on the sensor, wait until the blue LED starts blinking and advance to connect.'
	String get after_turned_on_advance => 'After turning on the sensor, wait until the blue LED starts blinking and advance to connect.';

	/// en: 'Bodystar sensor has low battery.'
	String get low_battery => 'Bodystar sensor has low battery.';

	late final Translations$bodystar$positions$en positions = Translations$bodystar$positions$en.internal(_root);

	/// en: 'Make sure the sensor is securely attached and firm on the body.'
	String get check_tap_body => 'Make sure the sensor is securely attached and firm on the body.';

	/// en: 'Sensor not found'
	String get sensor_not_found => 'Sensor not found';

	/// en: 'Error connecting to Bodystar'
	String get error_connecting => 'Error connecting to Bodystar';
}

// Path: home
class Translations$home$en {
	Translations$home$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$home$error$en error = Translations$home$error$en.internal(_root);
	late final Translations$home$recording$en recording = Translations$home$recording$en.internal(_root);
	late final Translations$home$share$en share = Translations$home$share$en.internal(_root);
	late final Translations$home$stop_recording$en stop_recording = Translations$home$stop_recording$en.internal(_root);
	late final Translations$home$last_recording$en last_recording = Translations$home$last_recording$en.internal(_root);
}

// Path: history
class Translations$history$en {
	Translations$history$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'History'
	String get title => 'History';

	/// en: 'Delete all'
	String get delete_all => 'Delete all';

	/// en: 'No files found'
	String get empty => 'No files found';

	late final Translations$history$delete_dialog$en delete_dialog = Translations$history$delete_dialog$en.internal(_root);
}

// Path: widgets
class Translations$widgets$en {
	Translations$widgets$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$widgets$choose_bodystar$en choose_bodystar = Translations$widgets$choose_bodystar$en.internal(_root);
	late final Translations$widgets$choose_oxistar$en choose_oxistar = Translations$widgets$choose_oxistar$en.internal(_root);
}

// Path: bodystar.positions
class Translations$bodystar$positions$en {
	Translations$bodystar$positions$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Supine'
	String get top => 'Supine';

	/// en: 'Ventral'
	String get bottom => 'Ventral';

	/// en: 'Left'
	String get left => 'Left';

	/// en: 'Right'
	String get right => 'Right';

	/// en: 'Others'
	String get other => 'Others';
}

// Path: home.error
class Translations$home$error$en {
	Translations$home$error$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'At least one device must be enabled.'
	String get at_least_one_device => 'At least one device must be enabled.';

	/// en: 'The recording must be at least $min minute(s).'
	String min_duration({required Object min}) => 'The recording must be at least ${min} minute(s).';
}

// Path: home.recording
class Translations$home$recording$en {
	Translations$home$recording$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recording'
	String get title => 'Recording';

	/// en: 'Recording...'
	String get subtitle => 'Recording...';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'Recording'
	String get label => 'Recording';
}

// Path: home.share
class Translations$home$share$en {
	Translations$home$share$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Recording file'
	String get subject => 'Recording file';
}

// Path: home.stop_recording
class Translations$home$stop_recording$en {
	Translations$home$stop_recording$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Stop recording'
	String get title => 'Stop recording';

	/// en: 'Do you really want to stop recording?'
	String get description => 'Do you really want to stop recording?';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Yes'
	String get yes => 'Yes';
}

// Path: home.last_recording
class Translations$home$last_recording$en {
	Translations$home$last_recording$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Last recording'
	String get title => 'Last recording';

	/// en: 'File'
	String get file => 'File';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Share File'
	String get share => 'Share File';
}

// Path: history.delete_dialog
class Translations$history$delete_dialog$en {
	Translations$history$delete_dialog$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete file'
	String get title => 'Delete file';

	/// en: 'Delete all'
	String get title_all => 'Delete all';

	/// en: 'Do you really want to delete the file $file?'
	String description({required Object file}) => 'Do you really want to delete the file ${file}?';

	/// en: 'Do you really want to delete all files?'
	String get description_all => 'Do you really want to delete all files?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Delete now'
	String get delete_now => 'Delete now';

	/// en: 'Delete ($count)'
	String delete_countdown({required Object count}) => 'Delete (${count})';
}

// Path: widgets.choose_bodystar
class Translations$widgets$choose_bodystar$en {
	Translations$widgets$choose_bodystar$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bodystar sensors found'
	String get title => 'Bodystar sensors found';

	/// en: 'Found more than one Bodystar sensor'
	String get subtitle => 'Found more than one Bodystar sensor';

	/// en: 'Select the desired Bodystar sensor'
	String get description => 'Select the desired Bodystar sensor';
}

// Path: widgets.choose_oxistar
class Translations$widgets$choose_oxistar$en {
	Translations$widgets$choose_oxistar$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Oxistar sensors found'
	String get title => 'Oxistar sensors found';

	/// en: 'Found more than one Oxistar sensor'
	String get subtitle => 'Found more than one Oxistar sensor';

	/// en: 'Select the desired Oxistar sensor'
	String get description => 'Select the desired Oxistar sensor';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app' => 'Utility Designers',
			'bodystar.connect' => 'Connect Bodystar',
			'bodystar.connection' => 'Bodystar Connection',
			'bodystar.found_sensors' => 'We found some nearby Bodystar sensors.',
			'bodystar.found_more_than_one' => 'We found more than one Bodystar sensor near the smartphone. Choose which sensor you want to use for this exam.',
			'bodystar.success_connected' => 'Bodystar successfully connected',
			'bodystar.connected' => 'The Bodystar sensor is connected!\nNow, place it on your body:',
			'bodystar.insert_tap' => 'Place a strip horizontally over the Bodystar, leaving excess on the sides for fixation.',
			'bodystar.how_to_position' => 'How to position the Bodystar sensor',
			'bodystar.position_tap' => 'Place the tape 10cm horizontally over the Bodystar, leaving excess on the sides.',
			'bodystar.position_chest' => 'Position the sensor vertically, just below the collarbone line. The button and LED should face towards the neck.',
			'bodystar.how_to_connect' => 'How to connect the Bodystar sensor',
			'bodystar.align' => 'Position the sensor vertically just below the collarbone line, with the button and LED facing towards the neck.',
			'bodystar.where_position' => 'Where to position the Bodystar',
			'bodystar.where_position_chest' => 'The Bodystar sensor should be positioned in the chest area near the sternum.\n\nThe sternum is the bone located in the anterior midline of our chest and is part of the anterior thoracic cavity.',
			'bodystar.connect_bluetooth' => 'To connect the Bodystar to your phone, it uses Bluetooth technology. Remember to enable Bluetooth on your smartphone.',
			'bodystar.how_to_turn_on' => 'How to turn on the Bodystar',
			'bodystar.localize_central_button' => 'To turn on the sensor, just find and press the action button located at the center top of the Bodystar.',
			'bodystar.idle_turn_on' => 'Turn on the Bodystar to start the connection.',
			'bodystar.press_button_to_turn_on' => 'To get started, turn on the Bodystar by pressing the action button.',
			'bodystar.after_turned_on' => 'After turning it on, wait until the blue LED blinks, indicating that the sensor is ready to connect.',
			'bodystar.after_turned_on_advance' => 'After turning on the sensor, wait until the blue LED starts blinking and advance to connect.',
			'bodystar.low_battery' => 'Bodystar sensor has low battery.',
			'bodystar.positions.top' => 'Supine',
			'bodystar.positions.bottom' => 'Ventral',
			'bodystar.positions.left' => 'Left',
			'bodystar.positions.right' => 'Right',
			'bodystar.positions.other' => 'Others',
			'bodystar.check_tap_body' => 'Make sure the sensor is securely attached and firm on the body.',
			'bodystar.sensor_not_found' => 'Sensor not found',
			'bodystar.error_connecting' => 'Error connecting to Bodystar',
			'sensor_not_found' => 'Sensor not found',
			'connected_successfully' => 'Connected successfully',
			'sensor_not_connected' => 'Sensor not connected',
			'need_bluetooth_ios' => 'Need to enable Bluetooth',
			'error_connecting_to_sensor' => 'Error connecting to sensor',
			'home.error.at_least_one_device' => 'At least one device must be enabled.',
			'home.error.min_duration' => ({required Object min}) => 'The recording must be at least ${min} minute(s).',
			'home.recording.title' => 'Recording',
			'home.recording.subtitle' => 'Recording...',
			'home.recording.duration' => 'Duration',
			'home.recording.label' => 'Recording',
			'home.share.subject' => 'Recording file',
			'home.stop_recording.title' => 'Stop recording',
			'home.stop_recording.description' => 'Do you really want to stop recording?',
			'home.stop_recording.no' => 'No',
			'home.stop_recording.yes' => 'Yes',
			'home.last_recording.title' => 'Last recording',
			'home.last_recording.file' => 'File',
			'home.last_recording.size' => 'Size',
			'home.last_recording.share' => 'Share File',
			'history.title' => 'History',
			'history.delete_all' => 'Delete all',
			'history.empty' => 'No files found',
			'history.delete_dialog.title' => 'Delete file',
			'history.delete_dialog.title_all' => 'Delete all',
			'history.delete_dialog.description' => ({required Object file}) => 'Do you really want to delete the file ${file}?',
			'history.delete_dialog.description_all' => 'Do you really want to delete all files?',
			'history.delete_dialog.cancel' => 'Cancel',
			'history.delete_dialog.delete' => 'Delete',
			'history.delete_dialog.delete_now' => 'Delete now',
			'history.delete_dialog.delete_countdown' => ({required Object count}) => 'Delete (${count})',
			'widgets.choose_bodystar.title' => 'Bodystar sensors found',
			'widgets.choose_bodystar.subtitle' => 'Found more than one Bodystar sensor',
			'widgets.choose_bodystar.description' => 'Select the desired Bodystar sensor',
			'widgets.choose_oxistar.title' => 'Oxistar sensors found',
			'widgets.choose_oxistar.subtitle' => 'Found more than one Oxistar sensor',
			'widgets.choose_oxistar.description' => 'Select the desired Oxistar sensor',
			'recording_data' => 'Recording data',
			'sensor_is_already_connected' => 'Sensor is already connected',
			'do_not_turn_off_screen' => 'Do not turn off the screen',
			'do_not_turn_off_screen_description' => 'If the screen of the cell phone turns off, the device may stop recording. The screen brightness will automatically decrease to avoid excessive battery consumption.',
			'searching' => 'Seeking out...',
			_ => null,
		};
	}
}
