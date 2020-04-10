kubectl get pods \
  -l "app=hello-node" \
  -o=jsonpath={.items[0].metadata.name}