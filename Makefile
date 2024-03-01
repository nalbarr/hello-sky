help:
	@echo make sky-aws-init
	@echo ""
	@echo make sky check
	@echo ""
	@echo make sky-launch
	@echo make sky-exec
	@echo make sky-ssh
	@echo make sky-logs
	@echo make sky-down
	@echo ""
	@echo make sky-spot-launch
	@echo ""
	@echo make sky-launch-ev
	@echo make sky-exec-train

sky-aws-init:
	@echo NOTE: set AWS credentials!!!
	@echo "source ~/aws-utils/set-<aws_env>.sh"

install-mac-m1-dependencies:
	pip uninstall grpcio; conda install -c conda-forge grpcio=1.43.0

sky-check:
	sky check

CLUSTER_NAME=sky
sky-launch:
	sky launch -c $(CLUSTER_NAME) infra/sky-hello.yaml \
		-i 60

sky-launch-uv:
	sky launch -c $(CLUSTER_NAME) infra/sky-hello-uv.yaml \
		-i 60

sky-exec-hello:
	sky exec hello infra/sky-hello.yaml

sky-exec-train:
	sky exec hello infra/sky-hello-uv.yaml

sky-ssh:
	ssh $(CLUSTER_NAME)

sky-logs:
	sky logs $(CLUSTER_NAME)

sky-down:
	sky down $(CLUSTER_NAME)

sky-spot-launch:
	sky spot launch -n hello-sky-spot infra/sky-hello.yaml

