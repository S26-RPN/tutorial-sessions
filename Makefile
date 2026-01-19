.PHONY: setup check fix validate

setup:
	@echo "Syncing environment..."
	@uv run pre-commit install
	@uv sync
	@echo "✅ Environment Ready"

check:
	@echo "Checking formatting..."
	@uv run ruff format --check .
	@echo "Checking logic..."
	@uv run ruff check .
	@echo "✅ Done"

fix:
	@echo "Auto-fixing imports and logic..."
	@uv run ruff check --fix .
	@echo "Formatting code..."
	@uv run ruff format .
	@echo "✅ Done"

validate:
	@curl -s https://raw.githubusercontent.com/S26-RPN/course-infra/main/scripts/validate.py | uv run python3 - --local