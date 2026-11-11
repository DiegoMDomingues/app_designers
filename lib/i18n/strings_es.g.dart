///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override String get app => 'Utility Designers';
	@override late final _Translations$bodystar$es bodystar = _Translations$bodystar$es._(_root);
	@override String get sensor_not_found => 'Sensor no encontrado';
	@override String get connected_successfully => 'Conectado con éxito';
	@override String get sensor_not_connected => 'Sensor no conectado';
	@override String get need_bluetooth_ios => 'Necesita activar Bluetooth';
	@override String get error_connecting_to_sensor => 'Error al conectar con el sensor';
	@override late final _Translations$home$es home = _Translations$home$es._(_root);
	@override late final _Translations$history$es history = _Translations$history$es._(_root);
	@override late final _Translations$widgets$es widgets = _Translations$widgets$es._(_root);
	@override String get recording_data => 'Grabando datos';
	@override String get sensor_is_already_connected => 'El sensor ya está conectado';
	@override String get do_not_turn_off_screen => 'No apagues la pantalla';
	@override String get do_not_turn_off_screen_description => 'Si la pantalla del teléfono se apaga, el dispositivo puede dejar de grabar. El brillo de la pantalla disminuirá automáticamente para evitar un consumo excesivo de batería.';
	@override String get searching => 'Buscando...';
}

// Path: bodystar
class _Translations$bodystar$es extends Translations$bodystar$en {
	_Translations$bodystar$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get connect => 'Conectar Bodystar';
	@override String get connection => 'Conexión Bodystar';
	@override String get found_sensors => 'Se encontraron algunos sensores Bodystar cercanos.';
	@override String get found_more_than_one => 'Se encontraron más de un sensor Bodystar cerca del teléfono. Elige qué sensor quieres usar para este examen.';
	@override String get success_connected => 'Bodystar conectado con éxito';
	@override String get connected => '¡El sensor Bodystar está conectado!\nAhora, colócalo en tu cuerpo:';
	@override String get insert_tap => 'Coloca una tira de manera horizontal sobre el Bodystar, dejando exceso a los lados para la fijación.';
	@override String get how_to_position => 'Cómo posicionar el sensor Bodystar';
	@override String get position_tap => 'Coloca la cinta a 10 cm horizontalmente sobre el Bodystar, dejando exceso a los lados.';
	@override String get position_chest => 'Coloca el sensor verticalmente, justo debajo de la línea de la clavícula. El botón y el LED deben estar orientados hacia el cuello.';
	@override String get how_to_connect => 'Cómo conectar el sensor Bodystar';
	@override String get align => 'Coloca el sensor verticalmente justo debajo de la línea de la clavícula, con el botón y el LED orientados hacia el cuello.';
	@override String get where_position => 'Dónde posicionar el Bodystar';
	@override String get where_position_chest => 'El sensor Bodystar debe posicionarse en el área del pecho cerca del esternón.\n\nEl esternón es el hueso ubicado en la línea media anterior de nuestro pecho y forma parte de la cavidad torácica anterior.';
	@override String get connect_bluetooth => 'Para conectar el Bodystar a tu teléfono, utiliza la tecnología Bluetooth. Recuerda activar el Bluetooth en tu smartphone.';
	@override String get how_to_turn_on => 'Cómo encender el Bodystar';
	@override String get localize_central_button => 'Para encender el sensor, simplemente encuentra y presiona el botón de acción ubicado en la parte central superior del Bodystar.';
	@override String get idle_turn_on => 'Enciende el Bodystar para comenzar la conexión.';
	@override String get press_button_to_turn_on => 'Para empezar, enciende el Bodystar presionando el botón de acción.';
	@override String get after_turned_on => 'Después de encenderlo, espera hasta que el LED azul parpadee, indicando que el sensor está listo para conectarse.';
	@override String get after_turned_on_advance => 'Después de encender el sensor, espera hasta que el LED azul comience a parpadear y avanza para conectarte.';
	@override String get low_battery => 'El sensor Bodystar tiene poca batería.';
	@override late final _Translations$bodystar$positions$es positions = _Translations$bodystar$positions$es._(_root);
	@override String get check_tap_body => 'Asegúrate de que el sensor esté firmemente sujeto y seguro en el cuerpo.';
	@override String get sensor_not_found => 'Sensor no encontrado';
	@override String get error_connecting => 'Error al conectar con Bodystar';
}

// Path: home
class _Translations$home$es extends Translations$home$en {
	_Translations$home$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$error$es error = _Translations$home$error$es._(_root);
	@override late final _Translations$home$recording$es recording = _Translations$home$recording$es._(_root);
	@override late final _Translations$home$share$es share = _Translations$home$share$es._(_root);
	@override late final _Translations$home$stop_recording$es stop_recording = _Translations$home$stop_recording$es._(_root);
	@override late final _Translations$home$last_recording$es last_recording = _Translations$home$last_recording$es._(_root);
}

// Path: history
class _Translations$history$es extends Translations$history$en {
	_Translations$history$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Historial';
	@override String get delete_all => 'Borrar todo';
	@override String get empty => 'No se encontraron archivos';
	@override late final _Translations$history$delete_dialog$es delete_dialog = _Translations$history$delete_dialog$es._(_root);
}

// Path: widgets
class _Translations$widgets$es extends Translations$widgets$en {
	_Translations$widgets$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$widgets$choose_bodystar$es choose_bodystar = _Translations$widgets$choose_bodystar$es._(_root);
	@override late final _Translations$widgets$choose_oxistar$es choose_oxistar = _Translations$widgets$choose_oxistar$es._(_root);
}

// Path: bodystar.positions
class _Translations$bodystar$positions$es extends Translations$bodystar$positions$en {
	_Translations$bodystar$positions$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get top => 'Supino';
	@override String get bottom => 'Ventral';
	@override String get left => 'Izquierda';
	@override String get right => 'Derecha';
	@override String get other => 'Otros';
}

// Path: home.error
class _Translations$home$error$es extends Translations$home$error$en {
	_Translations$home$error$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get at_least_one_device => 'Al menos un dispositivo debe estar activado.';
	@override String min_duration({required Object min}) => 'La grabación debe durar al menos ${min} minuto(s).';
}

// Path: home.recording
class _Translations$home$recording$es extends Translations$home$recording$en {
	_Translations$home$recording$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Grabando';
	@override String get subtitle => 'Grabando...';
	@override String get duration => 'Duración';
	@override String get label => 'Grabación';
}

// Path: home.share
class _Translations$home$share$es extends Translations$home$share$en {
	_Translations$home$share$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Archivo de grabación';
}

// Path: home.stop_recording
class _Translations$home$stop_recording$es extends Translations$home$stop_recording$en {
	_Translations$home$stop_recording$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detener grabación';
	@override String get description => '¿Realmente desea detener la grabación?';
	@override String get no => 'No';
	@override String get yes => 'Sí';
}

// Path: home.last_recording
class _Translations$home$last_recording$es extends Translations$home$last_recording$en {
	_Translations$home$last_recording$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Última grabación';
	@override String get file => 'Archivo';
	@override String get size => 'Tamaño';
	@override String get share => 'Compartir Archivo';
}

// Path: history.delete_dialog
class _Translations$history$delete_dialog$es extends Translations$history$delete_dialog$en {
	_Translations$history$delete_dialog$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Borrar archivo';
	@override String get title_all => 'Borrar todo';
	@override String description({required Object file}) => '¿Realmente desea borrar el archivo ${file}?';
	@override String get description_all => '¿Realmente desea borrar todos los archivos?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Borrar';
	@override String get delete_now => 'Borrar ahora';
	@override String delete_countdown({required Object count}) => 'Borrar (${count})';
}

// Path: widgets.choose_bodystar
class _Translations$widgets$choose_bodystar$es extends Translations$widgets$choose_bodystar$en {
	_Translations$widgets$choose_bodystar$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sensores Bodystar encontrados';
	@override String get subtitle => 'Se encontraron más de un sensor Bodystar';
	@override String get description => 'Seleccione el sensor Bodystar deseado';
}

// Path: widgets.choose_oxistar
class _Translations$widgets$choose_oxistar$es extends Translations$widgets$choose_oxistar$en {
	_Translations$widgets$choose_oxistar$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sensores Oxistar encontrados';
	@override String get subtitle => 'Se encontraron más de un sensor Oxistar';
	@override String get description => 'Seleccione el sensor Oxistar deseado';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app' => 'Utility Designers',
			'bodystar.connect' => 'Conectar Bodystar',
			'bodystar.connection' => 'Conexión Bodystar',
			'bodystar.found_sensors' => 'Se encontraron algunos sensores Bodystar cercanos.',
			'bodystar.found_more_than_one' => 'Se encontraron más de un sensor Bodystar cerca del teléfono. Elige qué sensor quieres usar para este examen.',
			'bodystar.success_connected' => 'Bodystar conectado con éxito',
			'bodystar.connected' => '¡El sensor Bodystar está conectado!\nAhora, colócalo en tu cuerpo:',
			'bodystar.insert_tap' => 'Coloca una tira de manera horizontal sobre el Bodystar, dejando exceso a los lados para la fijación.',
			'bodystar.how_to_position' => 'Cómo posicionar el sensor Bodystar',
			'bodystar.position_tap' => 'Coloca la cinta a 10 cm horizontalmente sobre el Bodystar, dejando exceso a los lados.',
			'bodystar.position_chest' => 'Coloca el sensor verticalmente, justo debajo de la línea de la clavícula. El botón y el LED deben estar orientados hacia el cuello.',
			'bodystar.how_to_connect' => 'Cómo conectar el sensor Bodystar',
			'bodystar.align' => 'Coloca el sensor verticalmente justo debajo de la línea de la clavícula, con el botón y el LED orientados hacia el cuello.',
			'bodystar.where_position' => 'Dónde posicionar el Bodystar',
			'bodystar.where_position_chest' => 'El sensor Bodystar debe posicionarse en el área del pecho cerca del esternón.\n\nEl esternón es el hueso ubicado en la línea media anterior de nuestro pecho y forma parte de la cavidad torácica anterior.',
			'bodystar.connect_bluetooth' => 'Para conectar el Bodystar a tu teléfono, utiliza la tecnología Bluetooth. Recuerda activar el Bluetooth en tu smartphone.',
			'bodystar.how_to_turn_on' => 'Cómo encender el Bodystar',
			'bodystar.localize_central_button' => 'Para encender el sensor, simplemente encuentra y presiona el botón de acción ubicado en la parte central superior del Bodystar.',
			'bodystar.idle_turn_on' => 'Enciende el Bodystar para comenzar la conexión.',
			'bodystar.press_button_to_turn_on' => 'Para empezar, enciende el Bodystar presionando el botón de acción.',
			'bodystar.after_turned_on' => 'Después de encenderlo, espera hasta que el LED azul parpadee, indicando que el sensor está listo para conectarse.',
			'bodystar.after_turned_on_advance' => 'Después de encender el sensor, espera hasta que el LED azul comience a parpadear y avanza para conectarte.',
			'bodystar.low_battery' => 'El sensor Bodystar tiene poca batería.',
			'bodystar.positions.top' => 'Supino',
			'bodystar.positions.bottom' => 'Ventral',
			'bodystar.positions.left' => 'Izquierda',
			'bodystar.positions.right' => 'Derecha',
			'bodystar.positions.other' => 'Otros',
			'bodystar.check_tap_body' => 'Asegúrate de que el sensor esté firmemente sujeto y seguro en el cuerpo.',
			'bodystar.sensor_not_found' => 'Sensor no encontrado',
			'bodystar.error_connecting' => 'Error al conectar con Bodystar',
			'sensor_not_found' => 'Sensor no encontrado',
			'connected_successfully' => 'Conectado con éxito',
			'sensor_not_connected' => 'Sensor no conectado',
			'need_bluetooth_ios' => 'Necesita activar Bluetooth',
			'error_connecting_to_sensor' => 'Error al conectar con el sensor',
			'home.error.at_least_one_device' => 'Al menos un dispositivo debe estar activado.',
			'home.error.min_duration' => ({required Object min}) => 'La grabación debe durar al menos ${min} minuto(s).',
			'home.recording.title' => 'Grabando',
			'home.recording.subtitle' => 'Grabando...',
			'home.recording.duration' => 'Duración',
			'home.recording.label' => 'Grabación',
			'home.share.subject' => 'Archivo de grabación',
			'home.stop_recording.title' => 'Detener grabación',
			'home.stop_recording.description' => '¿Realmente desea detener la grabación?',
			'home.stop_recording.no' => 'No',
			'home.stop_recording.yes' => 'Sí',
			'home.last_recording.title' => 'Última grabación',
			'home.last_recording.file' => 'Archivo',
			'home.last_recording.size' => 'Tamaño',
			'home.last_recording.share' => 'Compartir Archivo',
			'history.title' => 'Historial',
			'history.delete_all' => 'Borrar todo',
			'history.empty' => 'No se encontraron archivos',
			'history.delete_dialog.title' => 'Borrar archivo',
			'history.delete_dialog.title_all' => 'Borrar todo',
			'history.delete_dialog.description' => ({required Object file}) => '¿Realmente desea borrar el archivo ${file}?',
			'history.delete_dialog.description_all' => '¿Realmente desea borrar todos los archivos?',
			'history.delete_dialog.cancel' => 'Cancelar',
			'history.delete_dialog.delete' => 'Borrar',
			'history.delete_dialog.delete_now' => 'Borrar ahora',
			'history.delete_dialog.delete_countdown' => ({required Object count}) => 'Borrar (${count})',
			'widgets.choose_bodystar.title' => 'Sensores Bodystar encontrados',
			'widgets.choose_bodystar.subtitle' => 'Se encontraron más de un sensor Bodystar',
			'widgets.choose_bodystar.description' => 'Seleccione el sensor Bodystar deseado',
			'widgets.choose_oxistar.title' => 'Sensores Oxistar encontrados',
			'widgets.choose_oxistar.subtitle' => 'Se encontraron más de un sensor Oxistar',
			'widgets.choose_oxistar.description' => 'Seleccione el sensor Oxistar deseado',
			'recording_data' => 'Grabando datos',
			'sensor_is_already_connected' => 'El sensor ya está conectado',
			'do_not_turn_off_screen' => 'No apagues la pantalla',
			'do_not_turn_off_screen_description' => 'Si la pantalla del teléfono se apaga, el dispositivo puede dejar de grabar. El brillo de la pantalla disminuirá automáticamente para evitar un consumo excesivo de batería.',
			'searching' => 'Buscando...',
			_ => null,
		};
	}
}
