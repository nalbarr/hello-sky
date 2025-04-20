help:
	@echo make install
	@echo ""
	@echo make sky-aws-init
	@echo ""
	@echo make sky check
	@echo ""
	@echo make sky-launch
	@echo make sky-launch-hello
	@echo make sky-launch-ray
	@echo make sky-exec
	@echo make sky-exec-hello
	@echo make sky-exec-ray
	@echo ""
	@echo make sky-launch
	@echo make sky-ssh
	@echo make sky-logs
	@echo make sky-down

# https://docs.skypilot.co/en/latest/getting-started/installation.html
install:
	@echo NOTE: install uv 
	@echo uv venv --seed --python 3.10
	@echo uv pip install "skypilot[kubernetes,aws]"

	@echo NOTE: uv sync
	@echo uv venv
	@echo source .venv/bin/activate
	@echo uv sync
	@echo uv run <script>

sky-aws-init:
	@echo NOTE: set AWS credentials!!!
	@echo "source ~/aws-utils/set-<aws_env>.sh"

install-mac-m1-dependencies:
	pip uninstall grpcio; conda install -c conda-forge grpcio=1.43.0

sky-check:
	sky check

CLUSTER_NAME=sky-hello

sky-launch: sky-launch-hello

sky-launch-hello:
	sky launch --cluster $(CLUSTER_NAME) \
		--cpus 2 \
		--cloud aws \
		infra/$(CLUSTER_NAME).yaml \
		-i 60

CLUSTER_NAME2=sky-ray
sky-launch-ray:
	sky launch --cluster $(CLUSTER_NAME2) \
		--cpus 2 \
		--cloud aws \
		infra/$(CLUSTER_NAME2).yaml \
		-i 60

sky-exec: sky-exec-hello

sky-exec-hello:
	sky exec sky-hello infra/sky-hello.yaml

sky-exec-ray:
	sky exec sky-ray infra/sky-ray.yaml

sky-ssh:
	ssh $(CLUSTER_NAME)

sky-logs:
	sky logs $(CLUSTER_NAME)

sky-down:
	sky down $(CLUSTER_NAME)
