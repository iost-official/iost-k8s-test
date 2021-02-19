CLUSTER = devnet

all: k8s_test

k8s_test:
	./build/delete_cluster.sh $(CLUSTER)
	./build/create_cluster.sh $(CLUSTER)
	sleep 180
	kubectl exec -it itest -n $(CLUSTER) -- ./itest run -c /etc/itest/itest.json a_case
	kubectl exec -it itest -n $(CLUSTER) -- ./itest run -c /etc/itest/itest.json t_case
	kubectl exec -it itest -n $(CLUSTER) -- ./itest run -c /etc/itest/itest.json c_case

