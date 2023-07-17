tmux_dev_nb_session='nb-dev'

py-setup:
	@bash ./scripts/python/setup_env.sh

py-clean:
	@bash -c "source ./scripts/python/activate_env.sh && \
	python -u scripts/setup_remove_build_files.py"

py-install:
	@bash -c "source ./scripts/python/activate_env.sh && \
	pip install -r requirements.txt"

run:
	@bash -c "source ./scripts/python/activate_env.sh && \
	python -u src/example_sklearn.py"

nb:
	@tmux new -d -s $(tmux_dev_nb_session)
	@tmux send-keys -t $(tmux_dev_nb_session).0 \
		"source venv/bin/activate && sleep 0.5 && jupyter lab" \
		ENTER

nb-stop:
	@echo "Sending stop signal (ctrl+c) to nb session" && \
        tmux send-keys -t $(tmux_dev_nb_session).0 "C-c" ENTER && \
		tmux send-keys -t $(tmux_dev_nb_session).0 "y" ENTER && \
		tmux send-keys -t $(tmux_dev_nb_session).0 ENTER && \
        echo "Killing session in a few secs..." && sleep 2 && \
        tmux kill-session -t $(tmux_dev_nb_session)