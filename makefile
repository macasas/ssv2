.PHONY: run_on_ios run_on_ios_sim run_on_android run_on_android_sim devices format clean

all: lint clean format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done


diagrams: ## Generate dependency diagrams
	@echo "╠ Generate dependency diagrams..."
	lakos . | dot -T png -Gdpi=200 -o d_total.png
	lakos ./lib | dot -T png -Gdpi=200 -o d_lib.png
	lakos ./lib/src/app | dot -T png -Gdpi=200 -o d_lib_app.png
	lakos ./lib/src/app/regions | dot -T png -Gdpi=200 -o d_lib_app_regions.png
	lakos ./lib/src/app/regions/account_status | dot -T png -Gdpi=200 -o d_lib_app_account.png
	lakos ./lib/src/app/regions/auth_status | dot -T png -Gdpi=200 -o d_lib_app_auth.png
	lakos ./lib/src/app/regions/activity_status | dot -T png -Gdpi=200 -o d_lib_app_activity.png
	lakos ./test | dot -T png -Gdpi=200 -o d_test.png

get: 
	@echo "╠ Refresh the project dependencies with pub get..."
	@flutter pub get

format: ## Format the dart code
	@echo "╠ Formatting the project..."
	dart format .

clean: ## Remove pubspec.lock file and clean flutter
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

upgrade: clean ## Clean up and Upgrade flutter dependencies with pub upgrade
	@echo "╠ Upgrading dependencies..."
	@flutter pub upgrade  || (echo "▓▓ Error while upgrading flutter ▓▓"; exit 1)

lint: ## Analyse and show formatting and coding errors
	@echo "╠ Verifying code..."
	@dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)


test_bdd: ## Run BDD Feature/Scenario tests
	@echo "╠ Running the BDD Scenario Tests"
	dart test_driver/test_config.dart

test_unit: ## Run unit tests
	@echo "╠ Running the tests"
	@flutter test || (echo "▓▓ Error while running tests ▓▓"; exit 1)


build_android_dev_mobile: clean run_unit ## Builds the android mobile application in dev
	@echo "╠ Building dev for android"
	@flutter build apk --flavor dev  || (echo "▓▓ Error while building android dev ▓▓"; exit 1)


devices: ## Show a list of available devices
	flutter devices


run_on_ios: ## Run project on ios device
	@echo "╠ Running on ios device..."
	flutter run -d ios

run_on_ios_sim: ## Run project on ios simulator
	@echo "╠ Running on ios simulator..."
	flutter run -d 6EB11635-AD50-42C6-BA1C-FD5CECDDE3CC

run_on_android: ## Run project on android device
	@echo "╠ Running on android device..."
	flutter run -d S8OFNNHQZPFUOBM7

run_on_android_sim: ## Run project on android simulator
	@echo "╠ Running on android simulator..."
	flutter run -d android

run_on_macos: ## Run project on mac os
	@echo "╠ Running on mac os ..."
	flutter run -d macos

build_on_android_multidex: ## Build project on android with multidex
	@echo "╠ Building with multidex..."
	flutter build apk --multidex --debug

rebuild_pods: ## Clean up and rebuild cocoa pods if getting error
	@echo "╠ Rebuilding cocoa pod install..."
	flutter clean
	rm -Rf ios/Pods
	rm -Rf ios/.symlinks
	rm -Rf ios/Flutter/Flutter.framework
	rm -Rf ios/Flutter/Flutter.podspec
	flutter pub get
	cd ios
	pod install # (or on an M1+ mac: arch -x86_64 pod install)
	cd ..
	flutter build ios
	flutter run

run_visma: 
	echo "╠ Running visma ..."
	# visma --port 4040 --plantuml_jar ./plantuml-1.2023.13.jar
	visma --port=4040 --plantuml_jar=plantuml.1.2022.1.jar --bind 0.0.0.0