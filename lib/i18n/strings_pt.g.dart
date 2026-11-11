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
class TranslationsPt extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override String get app => 'Utility Designers';
	@override late final _Translations$bodystar$pt bodystar = _Translations$bodystar$pt._(_root);
	@override String get sensor_not_found => 'Sensor não encontrado';
	@override String get connected_successfully => 'Conectado com sucesso';
	@override String get sensor_not_connected => 'Sensor não conectado';
	@override String get need_bluetooth_ios => 'É necessário ativar o Bluetooth';
	@override String get error_connecting_to_sensor => 'Erro ao conectar ao sensor';
	@override late final _Translations$home$pt home = _Translations$home$pt._(_root);
	@override late final _Translations$history$pt history = _Translations$history$pt._(_root);
	@override late final _Translations$widgets$pt widgets = _Translations$widgets$pt._(_root);
	@override String get recording_data => 'Gravando dados';
	@override String get sensor_is_already_connected => 'O sensor já está conectado';
	@override String get do_not_turn_off_screen => 'Não desligue a tela';
	@override String get do_not_turn_off_screen_description => 'Se a tela do celular desligar, o dispositivo pode parar de gravar. O brilho da tela reduzirá automaticamente para evitar o consumo excessivo da bateria.';
	@override String get searching => 'Buscando...';
}

// Path: bodystar
class _Translations$bodystar$pt extends Translations$bodystar$en {
	_Translations$bodystar$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get connect => 'Conectar Bodystar';
	@override String get connection => 'Conexão Bodystar';
	@override String get found_sensors => 'Encontramos alguns sensores Bodystar nas proximidades.';
	@override String get found_more_than_one => 'Encontramos mais de um sensor Bodystar perto do smartphone. Escolha qual sensor você deseja usar para este exame.';
	@override String get success_connected => 'Bodystar conectado com sucesso';
	@override String get connected => 'O sensor Bodystar está conectado!\nAgora, coloque-o em seu corpo:';
	@override String get insert_tap => 'Coloque uma fita horizontalmente sobre o Bodystar, deixando excesso nas laterais para fixação.';
	@override String get how_to_position => 'Como posicionar o sensor Bodystar';
	@override String get position_tap => 'Coloque a fita 10 cm horizontalmente sobre o Bodystar, deixando excesso nas laterais.';
	@override String get position_chest => 'Posicione o sensor verticalmente, logo abaixo da linha da clavícula. O botão e o LED devem ficar voltados para o pescoço.';
	@override String get how_to_connect => 'Como conectar o sensor Bodystar';
	@override String get align => 'Posicione o sensor verticalmente logo abaixo da linha da clavícula, com o botão e o LED voltados para o pescoço.';
	@override String get where_position => 'Onde posicionar o Bodystar';
	@override String get where_position_chest => 'O sensor Bodystar deve ser posicionado na área do peito, próximo ao esterno.\n\nO esterno é o osso localizado na linha média anterior do nosso peito e faz parte da cavidade torácica anterior.';
	@override String get connect_bluetooth => 'Para conectar o Bodystar ao seu telefone, ele usa tecnologia Bluetooth. Lembre-se de habilitar o Bluetooth em seu smartphone.';
	@override String get how_to_turn_on => 'Como ligar o Bodystar';
	@override String get localize_central_button => 'Para ligar o sensor, basta encontrar e pressionar o botão de ação localizado na parte superior central do Bodystar.';
	@override String get idle_turn_on => 'Ligue o Bodystar para iniciar a conexão.';
	@override String get press_button_to_turn_on => 'Para começar, ligue o Bodystar pressionando o botão de ação.';
	@override String get after_turned_on => 'Depois de ligá-lo, aguarde até que o LED azul pisque, indicando que o sensor está pronto para conectar.';
	@override String get after_turned_on_advance => 'Depois de ligar o sensor, aguarde até que o LED azul comece a piscar e prossiga para conectar.';
	@override String get low_battery => 'O sensor Bodystar está com a bateria fraca.';
	@override late final _Translations$bodystar$positions$pt positions = _Translations$bodystar$positions$pt._(_root);
	@override String get check_tap_body => 'Certifique-se de que o sensor esteja firmemente preso e seguro no corpo.';
	@override String get sensor_not_found => 'Sensor não encontrado';
	@override String get error_connecting => 'Erro ao conectar ao bodystar';
}

// Path: home
class _Translations$home$pt extends Translations$home$en {
	_Translations$home$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$error$pt error = _Translations$home$error$pt._(_root);
	@override late final _Translations$home$recording$pt recording = _Translations$home$recording$pt._(_root);
	@override late final _Translations$home$share$pt share = _Translations$home$share$pt._(_root);
	@override late final _Translations$home$stop_recording$pt stop_recording = _Translations$home$stop_recording$pt._(_root);
	@override late final _Translations$home$last_recording$pt last_recording = _Translations$home$last_recording$pt._(_root);
}

// Path: history
class _Translations$history$pt extends Translations$history$en {
	_Translations$history$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Histórico';
	@override String get delete_all => 'Apagar tudo';
	@override String get empty => 'Nenhum arquivo encontrado';
	@override late final _Translations$history$delete_dialog$pt delete_dialog = _Translations$history$delete_dialog$pt._(_root);
}

// Path: widgets
class _Translations$widgets$pt extends Translations$widgets$en {
	_Translations$widgets$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _Translations$widgets$choose_bodystar$pt choose_bodystar = _Translations$widgets$choose_bodystar$pt._(_root);
	@override late final _Translations$widgets$choose_oxistar$pt choose_oxistar = _Translations$widgets$choose_oxistar$pt._(_root);
}

// Path: bodystar.positions
class _Translations$bodystar$positions$pt extends Translations$bodystar$positions$en {
	_Translations$bodystar$positions$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get top => 'Supino';
	@override String get bottom => 'Ventral';
	@override String get left => 'Esquerdo';
	@override String get right => 'Direito';
	@override String get other => 'Outros';
}

// Path: home.error
class _Translations$home$error$pt extends Translations$home$error$en {
	_Translations$home$error$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get at_least_one_device => 'Pelo menos um dispositivo precisar estar ativado.';
	@override String min_duration({required Object min}) => 'A gravação deve ter no mínimo ${min} minuto.';
}

// Path: home.recording
class _Translations$home$recording$pt extends Translations$home$recording$en {
	_Translations$home$recording$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Gravando';
	@override String get subtitle => 'Gravando...';
	@override String get duration => 'Duração';
	@override String get label => 'Gravação';
}

// Path: home.share
class _Translations$home$share$pt extends Translations$home$share$en {
	_Translations$home$share$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get subject => 'Arquivo de gravação';
}

// Path: home.stop_recording
class _Translations$home$stop_recording$pt extends Translations$home$stop_recording$en {
	_Translations$home$stop_recording$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parar registro';
	@override String get description => 'Deseja mesmo parar o registro?';
	@override String get no => 'Não';
	@override String get yes => 'Sim';
}

// Path: home.last_recording
class _Translations$home$last_recording$pt extends Translations$home$last_recording$en {
	_Translations$home$last_recording$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Última gravação';
	@override String get file => 'Arquivo';
	@override String get size => 'Tamanho';
	@override String get share => 'Compartilhar Arquivo';
}

// Path: history.delete_dialog
class _Translations$history$delete_dialog$pt extends Translations$history$delete_dialog$en {
	_Translations$history$delete_dialog$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Apagar arquivo';
	@override String get title_all => 'Apagar tudo';
	@override String description({required Object file}) => 'Deseja mesmo apagar o arquivo ${file}?';
	@override String get description_all => 'Deseja mesmo apagar todos os arquivos?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Apagar';
	@override String get delete_now => 'Apagar agora';
	@override String delete_countdown({required Object count}) => 'Apagar (${count})';
}

// Path: widgets.choose_bodystar
class _Translations$widgets$choose_bodystar$pt extends Translations$widgets$choose_bodystar$en {
	_Translations$widgets$choose_bodystar$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sensores Bodystar encontrados';
	@override String get subtitle => 'Encontrados mais de um sensor bodystar';
	@override String get description => 'Selecione o sensor Bodystar desejado';
}

// Path: widgets.choose_oxistar
class _Translations$widgets$choose_oxistar$pt extends Translations$widgets$choose_oxistar$en {
	_Translations$widgets$choose_oxistar$pt._(TranslationsPt root) : this._root = root, super.internal(root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sensores Oxistar encontrados';
	@override String get subtitle => 'Encontrados mais de um sensor Oxistar';
	@override String get description => 'Selecione o sensor Oxistar desejado';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app' => 'Utility Designers',
			'bodystar.connect' => 'Conectar Bodystar',
			'bodystar.connection' => 'Conexão Bodystar',
			'bodystar.found_sensors' => 'Encontramos alguns sensores Bodystar nas proximidades.',
			'bodystar.found_more_than_one' => 'Encontramos mais de um sensor Bodystar perto do smartphone. Escolha qual sensor você deseja usar para este exame.',
			'bodystar.success_connected' => 'Bodystar conectado com sucesso',
			'bodystar.connected' => 'O sensor Bodystar está conectado!\nAgora, coloque-o em seu corpo:',
			'bodystar.insert_tap' => 'Coloque uma fita horizontalmente sobre o Bodystar, deixando excesso nas laterais para fixação.',
			'bodystar.how_to_position' => 'Como posicionar o sensor Bodystar',
			'bodystar.position_tap' => 'Coloque a fita 10 cm horizontalmente sobre o Bodystar, deixando excesso nas laterais.',
			'bodystar.position_chest' => 'Posicione o sensor verticalmente, logo abaixo da linha da clavícula. O botão e o LED devem ficar voltados para o pescoço.',
			'bodystar.how_to_connect' => 'Como conectar o sensor Bodystar',
			'bodystar.align' => 'Posicione o sensor verticalmente logo abaixo da linha da clavícula, com o botão e o LED voltados para o pescoço.',
			'bodystar.where_position' => 'Onde posicionar o Bodystar',
			'bodystar.where_position_chest' => 'O sensor Bodystar deve ser posicionado na área do peito, próximo ao esterno.\n\nO esterno é o osso localizado na linha média anterior do nosso peito e faz parte da cavidade torácica anterior.',
			'bodystar.connect_bluetooth' => 'Para conectar o Bodystar ao seu telefone, ele usa tecnologia Bluetooth. Lembre-se de habilitar o Bluetooth em seu smartphone.',
			'bodystar.how_to_turn_on' => 'Como ligar o Bodystar',
			'bodystar.localize_central_button' => 'Para ligar o sensor, basta encontrar e pressionar o botão de ação localizado na parte superior central do Bodystar.',
			'bodystar.idle_turn_on' => 'Ligue o Bodystar para iniciar a conexão.',
			'bodystar.press_button_to_turn_on' => 'Para começar, ligue o Bodystar pressionando o botão de ação.',
			'bodystar.after_turned_on' => 'Depois de ligá-lo, aguarde até que o LED azul pisque, indicando que o sensor está pronto para conectar.',
			'bodystar.after_turned_on_advance' => 'Depois de ligar o sensor, aguarde até que o LED azul comece a piscar e prossiga para conectar.',
			'bodystar.low_battery' => 'O sensor Bodystar está com a bateria fraca.',
			'bodystar.positions.top' => 'Supino',
			'bodystar.positions.bottom' => 'Ventral',
			'bodystar.positions.left' => 'Esquerdo',
			'bodystar.positions.right' => 'Direito',
			'bodystar.positions.other' => 'Outros',
			'bodystar.check_tap_body' => 'Certifique-se de que o sensor esteja firmemente preso e seguro no corpo.',
			'bodystar.sensor_not_found' => 'Sensor não encontrado',
			'bodystar.error_connecting' => 'Erro ao conectar ao bodystar',
			'sensor_not_found' => 'Sensor não encontrado',
			'connected_successfully' => 'Conectado com sucesso',
			'sensor_not_connected' => 'Sensor não conectado',
			'need_bluetooth_ios' => 'É necessário ativar o Bluetooth',
			'error_connecting_to_sensor' => 'Erro ao conectar ao sensor',
			'home.error.at_least_one_device' => 'Pelo menos um dispositivo precisar estar ativado.',
			'home.error.min_duration' => ({required Object min}) => 'A gravação deve ter no mínimo ${min} minuto.',
			'home.recording.title' => 'Gravando',
			'home.recording.subtitle' => 'Gravando...',
			'home.recording.duration' => 'Duração',
			'home.recording.label' => 'Gravação',
			'home.share.subject' => 'Arquivo de gravação',
			'home.stop_recording.title' => 'Parar registro',
			'home.stop_recording.description' => 'Deseja mesmo parar o registro?',
			'home.stop_recording.no' => 'Não',
			'home.stop_recording.yes' => 'Sim',
			'home.last_recording.title' => 'Última gravação',
			'home.last_recording.file' => 'Arquivo',
			'home.last_recording.size' => 'Tamanho',
			'home.last_recording.share' => 'Compartilhar Arquivo',
			'history.title' => 'Histórico',
			'history.delete_all' => 'Apagar tudo',
			'history.empty' => 'Nenhum arquivo encontrado',
			'history.delete_dialog.title' => 'Apagar arquivo',
			'history.delete_dialog.title_all' => 'Apagar tudo',
			'history.delete_dialog.description' => ({required Object file}) => 'Deseja mesmo apagar o arquivo ${file}?',
			'history.delete_dialog.description_all' => 'Deseja mesmo apagar todos os arquivos?',
			'history.delete_dialog.cancel' => 'Cancelar',
			'history.delete_dialog.delete' => 'Apagar',
			'history.delete_dialog.delete_now' => 'Apagar agora',
			'history.delete_dialog.delete_countdown' => ({required Object count}) => 'Apagar (${count})',
			'widgets.choose_bodystar.title' => 'Sensores Bodystar encontrados',
			'widgets.choose_bodystar.subtitle' => 'Encontrados mais de um sensor bodystar',
			'widgets.choose_bodystar.description' => 'Selecione o sensor Bodystar desejado',
			'widgets.choose_oxistar.title' => 'Sensores Oxistar encontrados',
			'widgets.choose_oxistar.subtitle' => 'Encontrados mais de um sensor Oxistar',
			'widgets.choose_oxistar.description' => 'Selecione o sensor Oxistar desejado',
			'recording_data' => 'Gravando dados',
			'sensor_is_already_connected' => 'O sensor já está conectado',
			'do_not_turn_off_screen' => 'Não desligue a tela',
			'do_not_turn_off_screen_description' => 'Se a tela do celular desligar, o dispositivo pode parar de gravar. O brilho da tela reduzirá automaticamente para evitar o consumo excessivo da bateria.',
			'searching' => 'Buscando...',
			_ => null,
		};
	}
}
