alias k="kubectl"

k_attach_grep () {
  pod=$(k get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
  k exec --stdin --tty $pod -- /bin/bash
}

k_logs_grep () {
  service=$(k get deployments --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
  k logs "deployment.apps/$service" -f
}
