# -----------------------
# Kubernetes Aliases and Functions
# -----------------------

# Alias for 'kubectl' command for brevity.
alias k="kubectl"

# kattach
# Attach to the first pod that matches the given pattern and start a bash session.
# Usage: kattach <pattern>
kattach() {
  local pod
  pod=$(k get pods --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1 | head -n 1)
  k exec --stdin --tty $pod -- /bin/bash
}

# klogs
# Tail logs of the deployment that matches the given pattern.
# Usage: klogs <pattern>
klogs() {
  local service
  service=$(k get deployments --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1)
  k logs "deployment.apps/$service" -f --all-containers
}
