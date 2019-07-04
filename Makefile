PYTHON ?= python3
NTC_BASE ?= /opt/ntc

install_awx_venv_%:
	docker exec -it awx_task make -f /opt/ntc_data/Makefile install_awx_venv_$*

install_host_venv:
			$(PYTHON) -m venv --system-site-packages $(NTC_BASE)/host_venv; \
			$(NTC_BASE)/host_venv/bin/pip install -r $(NTC_BASE)/requirements_host_venv.txt; \
