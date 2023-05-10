py-setup:
	@bash ./scripts/python/setup_env.sh

py-clean:
	@bash -c "source ./scripts/python/activate_env.sh && \
	python -u scripts/setup_remove_build_files.py"

py-install:
	@bash -c "source ./scripts/python/activate_env.sh && \
	pip install -r requirements.txt"