env=local
lang=pt

install:
	bash scripts/fvm-run.sh flutter pub get

clean:
	bash scripts/fvm-run.sh flutter clean

generate_code_watch:
	bash scripts/fvm-run.sh dart run build_runner watch --delete-conflicting-outputs

generate_code_build:
	bash scripts/fvm-run.sh dart run build_runner build --delete-conflicting-outputs

generate_code_build_windows:
	fvm dart run build_runner build --delete-conflicting-outputs

generate_code_watch_windows:
	fvm dart run build_runner watch --delete-conflicting-outputs

translation:
	bash scripts/fvm-run.sh dart run slang

#Translate all files and generate .g files
translate_all:
	make translate lang=pt && \
	make translate lang=es && \
	make translation

translate:
	@echo "lang: $(lang)"	
	bash scripts/fvm-run.sh dart run slang_gpt --target=$(lang) --api-key=$(shell awk -F= '$$1=="OPEN_AI_KEY" {print $$2}' .env.dev)

translate_full:
	@echo "lang: $(lang)"	
	bash scripts/fvm-run.sh dart run slang_gpt --target=$(lang) --full --api-key=$(shell awk -F= '$$1=="OPEN_AI_KEY" {print $$2}' .env.dev)

format:
	bash scripts/fvm-run.sh dart format .

analyze:
	bash scripts/fvm-run.sh dart analyze .

custom_analyze:
	bash scripts/fvm-run.sh dart run custom_lint

test_code:
	bash scripts/fvm-run.sh flutter test --concurrency=$(shell sysctl -n hw.ncpu)

app_coverage:
	ulimit -S -n 2048
	fvm flutter test --coverage --concurrency=$(shell sysctl -n hw.ncpu)
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

full_test: format analyze test

full_coverage: format analyze coverage

app:
	if [ ! -d "lib/src/${name}" ]; then mkdir -p lib/src/${name} && cp -r module_template/* "lib/src/${name}"; fi
	if [ ! -d "test/src/${name}" ]; then mkdir -p test/src/${name} && cp -r module_template/* "test/src/${name}"; fi

run-debug: .env.$(env)
	bash scripts/fvm-run.sh flutter run  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-debug-verify: .env.$(env)
	bash scripts/fvm-run.sh flutter run -v  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-debug-windows: .env.$(env)
	fvm flutter run  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-profile: .env.$(env)
	bash scripts/fvm-run.sh flutter run  -t lib/main.dart --profile --purge-persistent-cache $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-release: .env.$(env)
	bash scripts/fvm-run.sh flutter run  -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

run-release-windows: .env.$(env)
	fvm flutter run  -t lib/main.dart --release $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-apk: .env.$(env)
	bash scripts/fvm-run.sh flutter build apk  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-ipa: .env.$(env)
	bash scripts/fvm-run.sh flutter build ipa  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-obfuscate-apk: .env.$(env)
	bash scripts/fvm-run.sh flutter build apk --obfuscate --split-debug-info=obfuscate-apk-$(env)-symbols  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-obfuscate-ipa: .env.$(env)
	bash scripts/fvm-run.sh flutter build ipa --obfuscate --split-debug-info=obfuscate-ipa-$(env)-symbols  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-appbundle: .env.$(env)
	bash scripts/fvm-run.sh flutter build appbundle  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

build-obfuscate-appbundle: .env.$(env)
	bash scripts/fvm-run.sh flutter build appbundle --obfuscate --split-debug-info=obfuscate-appbundle-$(env)-symbols  -t lib/main.dart $(shell awk '{print "--dart-define=" $$0}' .env.$(env))

setup-fvm:
	dart pub global activate fvm
	fvm install

setup-verify:
	bash scripts/setup-verify.sh
