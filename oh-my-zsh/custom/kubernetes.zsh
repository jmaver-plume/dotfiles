# -----------------------
# Kubernetes Aliases and Functions
# -----------------------

# Alias for 'kubectl' command for brevity.
alias k="kubectl"

# k_attach_grep
# Attach to the first pod that matches the given pattern and start a bash session.
# Usage: k_attach_grep <pattern>
k_attach_grep() {
  local pod
  pod=$(k get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1 | head -n 1)
  k exec --stdin --tty $pod -- /bin/bash
}

# k_logs_grep
# Tail logs of the deployment that matches the given pattern.
# Usage: k_logs_grep <pattern>
k_logs_grep() {
  local service
  service=$(k get deployments --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
  k logs "deployment.apps/$service" -f --all-containers
}
