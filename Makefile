PYTHON ?= python3
NTC_BASE ?= /opt/ntc

install_awx_venv_%:
	docker exec -it awx_task make -f /opt/ntc_data/Makefile install_awx_venv_$*

install_host_venv:
	$(PYTHON) -m venv --system-site-packages $(NTC_BASE)/host_venv; \
	$(NTC_BASE)/host_venv/bin/pip install -r $(NTC_BASE)/requirements_host_venv.txt; \

get_awx:
	git clone https://github.com/ansible/awx.git $(NTC_BASE)/awx_source

install_awx:
	if [ "$(NTC_BASE)/host_venv" ]; then \
		. $(NTC_BASE)/host_venv/bin/activate; \
		$(NTC_BASE)/host_venv/bin/ansible-playbook -i $(NTC_BASE)/awx_installer/ntc_inventory $(NTC_BASE)/awx_source/installer/install.yml ;\
	fi; \

ntc_awx: install_host_venv get_awx install_awx
