PYTHON ?= python3
VENV_BASE ?= /var/lib/awx/venv
NTC_BASE ?= /opt/ntc_data

install_venv_%:
	if [ "$(VENV_BASE)" ]; then \
		yum install -y python36-devel python-devel gcc; \
		if [ ! -d "$(VENV_BASE)/venv_$*" ]; then \
			$(PYTHON) -m venv --system-site-packages $(VENV_BASE)/venv_$*; \
			$(VENV_BASE)/venv_$*/bin/pip install -r $(NTC_BASE)/venv_$*/requirements.txt ; \
		fi; \
	fi
