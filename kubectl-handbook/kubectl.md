# 🧩 KUBECTL — Surgical Quick Reference (CKAD Edition, Final Unified Version)

> *"Kubectl is your scalpel in the CKAD exam — precise, fast, and unforgiving."*

This handbook is your **single source of truth** for CKAD preparation. Every command, YAML pattern, mnemonic, and decision tree is here.

---

# 🔥 CKAD Mindset: "FAST CYCLE OPS"

1. **See** → `get`, `describe`, `logs`
2. **Stabilize** → `edit`, `patch`, `scale`
3. **Fix** → `apply`, `replace`
4. **Verify** → `get`, `logs`, `exec`
5. **Move** → next question

Mnemonic: **S‑S‑F‑V‑M** → *"See, Stabilize, Fix, Verify, Move."*

> ⏱️ **Exam Tip:** Set your namespace at the very start of each question.  
> `kubectl config set-context --current --namespace=<ns>`  
> This alone saves minutes across the full exam.

---

# ⚡ CKAD Time‑Saver Aliases (Set These First!)

```bash
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kga='kubectl get all'
alias kdp='kubectl describe pod'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
export do='--dry-run=client -o yaml'   # usage: k run nginx --image=nginx $do
export now='--force --grace-period=0'  # usage: k delete pod nginx $now
```

> ⏱️ **Exam Tip:** These are the first things to type at the terminal. The `$do` and `$now` variables cut repetitive typing by ~50%.

---

# 🧠 kubectl Fundamentals

## Global Flags You Must Know

| Flag | Purpose |
|------|---------|
| `-n <ns>` | Target namespace |
| `--dry-run=client -o yaml` | Generate YAML without applying |
| `-o wide` | Extra columns (node, IP) |
| `--show-labels` | Show all labels |
| `--sort-by=<field>` | Sort output by JSONPath field |
| `--field-selector` | Filter by field value |
| `--force --grace-period=0` | Instant delete / replace |
| `-A` or `--all-namespaces` | All namespaces |

Mnemonic: **N D W L S F** → *"Namespaces Don't Wait; Labels Sort Fast."*

---

## kubectl explain (CKAD MUST‑KNOW)

```bash
kubectl explain pod
kubectl explain pod.spec
kubectl explain pod.spec.containers
kubectl explain pod.spec.containers --recursive
kubectl explain deploy
kubectl explain pvc.spec
kubectl explain netpol.spec
```

> 💡 **Conceptual Note:** `kubectl explain` is your **built-in Kubernetes docs**.  
> Use it when you forget field names under pressure — faster than any browser tab.

---

# 🧱 Creating Resources (Imperative)

## Pods

```bash
kubectl run mypod --image=nginx
kubectl run mypod --image=nginx --restart=Never        # standalone pod
kubectl run mypod --image=nginx --port=80
kubectl run mypod --image=nginx --env=APP=web --labels=tier=frontend
kubectl run mypod --image=nginx --requests='cpu=100m,memory=128Mi' --limits='cpu=200m,memory=256Mi'
```

## Generate YAML (don't apply — your best friend)

```bash
kubectl run mypod --image=nginx --dry-run=client -o yaml > pod.yaml
kubectl run mypod --image=nginx --restart=Never --dry-run=client -o yaml > pod.yaml
```

## Multi‑Container Pod (via override)

```bash
kubectl run mc --image=nginx --dry-run=client -o yaml \
  --overrides='{
    "spec":{
      "containers":[
        {"name":"c1","image":"nginx"},
        {"name":"c2","image":"busybox","command":["sleep","3600"]}
      ]
    }
  }' > mc-pod.yaml
```

> 💡 **Tip:** It is usually faster to `dry-run` a single pod, then manually add the second container in the YAML.

## Pod Lifecycle — restartPolicy

| Policy | Behaviour | Use Case |
|--------|-----------|----------|
| `Always` | Restart on any exit (default) | Deployments |
| `OnFailure` | Restart only on non-zero exit | Jobs |
| `Never` | Never restart | One-shot Pods |

```bash
kubectl logs --previous <pod>    # logs from last crashed instance
```

CKAD Cue: **CrashLoopBackOff → L‑D‑E** → Logs → Describe → Edit.

---

# 🧩 Editing & Applying

```bash
kubectl edit deploy myapp                                          # live fix
kubectl apply -f .                                                 # declarative apply entire dir
kubectl replace -f deploy.yaml                                     # full replace
kubectl replace --force -f deploy.yaml                             # delete + recreate
kubectl patch deploy myapp -p '{"spec":{"replicas":3}}'
kubectl patch deploy myapp --type=json \
  -p='[{"op":"replace","path":"/spec/replicas","value":4}]'
```

## kubectl set (Imperative In-Place Updates)

```bash
kubectl set image deploy/myapp nginx=nginx:1.21          # update image
kubectl set image deploy/myapp nginx=nginx:1.21 --record # (deprecated but still seen)
kubectl set resources deploy myapp \
  --containers=nginx \
  --requests=cpu=100m,memory=128Mi \
  --limits=cpu=250m,memory=256Mi
kubectl set env deploy/myapp APP_ENV=production
kubectl set env deploy/myapp APP_ENV-                    # remove env var
kubectl set serviceaccount deploy/myapp mysa
```

> 💡 `kubectl set image` is the fastest way to trigger a rolling update — no YAML editing needed.

---

# 🚀 Deployments

```bash
kubectl create deploy myapp --image=nginx
kubectl create deploy myapp --image=nginx --replicas=3
kubectl create deploy myapp --image=nginx --dry-run=client -o yaml > deploy.yaml
kubectl get deploy
kubectl describe deploy myapp
kubectl get deploy -o wide
kubectl scale deploy myapp --replicas=5
kubectl rollout restart deploy myapp
kubectl rollout status deploy myapp
kubectl rollout history deploy myapp
kubectl rollout undo deploy myapp
kubectl rollout undo deploy myapp --to-revision=2
kubectl rollout pause deploy myapp
kubectl rollout resume deploy myapp
```

> 💡 **Conceptual Note:** Deployments → ReplicaSets → Pods. Rollouts track revisions.  
> CKAD Cue: Deployment not updating → check **image**, **strategy**, **rollout status**.

---

# 🏷️ Labels, Annotations, Selectors

```bash
kubectl label pod mypod tier=frontend
kubectl label pod mypod tier-                            # remove label
kubectl label pod mypod tier=backend --overwrite
kubectl label no node01 size=large

kubectl get pods -l tier=frontend
kubectl get po --selector=app=App1
kubectl get po --selector=env=prod,bu=finance,tier=frontend   # AND logic

kubectl annotate pod mypod owner=utt
kubectl annotate pod mypod desc="Hello World"
kubectl annotate pod mypod desc-                         # remove annotation
```

> 💡 Selectors are **logical AND**: `env=prod,tier=frontend` → must match both.  

Mnemonic: **L A S A** → Label → Annotate → Select → Act.

---

# 📜 Logs, Exec, Debug, Port-Forward

```bash
kubectl logs mypod
kubectl logs mypod -c sidecar                           # specific container
kubectl logs -f mypod                                   # follow / stream
kubectl logs mypod --previous                           # last crashed instance
kubectl logs -l app=myapp --all-containers=true         # label-based multi-pod

kubectl exec -it mypod -- sh
kubectl exec -it mypod -c nginx -- /bin/bash
kubectl exec mypod -- wget -qO- http://<svc>:<port>     # ← capital O, not zero
kubectl exec mypod -- curl -s http://<svc>:<port>
kubectl exec mypod -- env                               # check env vars inside pod
kubectl exec mypod -- cat /etc/config/key               # check mounted ConfigMap

kubectl debug mypod -it --image=busybox --copy-to=debug-pod
kubectl cp mypod:/var/log/app.log ./app.log
kubectl cp ./localfile mypod:/tmp/file

kubectl port-forward pod/mypod 8080:80                  # local:container
kubectl port-forward svc/myapp 8080:80
kubectl port-forward deploy/myapp 8080:80
```

```bash
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get events -A | grep -i error
kubectl get events -n dev --field-selector reason=BackOff
```

> ⚠️ **Bug fix note:** `wget -qO-` uses capital **O** (output to stdout), not zero. Zero is a silent flag.

---

# 🌐 Services

```bash
kubectl expose pod mypod --port=80 --target-port=8080 --type=ClusterIP
kubectl expose deploy myapp --port=80 --type=NodePort
kubectl expose pod redis --port=6379 --name=redis-service --dry-run=client -o yaml
kubectl expose pod nginx --port=80 --target-port=8080 --type=NodePort --dry-run=client -o yaml

kubectl get svc
kubectl describe svc <svc>
kubectl get ep                    # endpoints — your first stop when svc is broken
kubectl get ep <svc>
```

| Term | Meaning |
|------|---------|
| `port` | Service port (what clients hit) |
| `targetPort` | Container port (where app listens) |
| `nodePort` | Node-level port (30000–32767) |

CKAD Cue: Service not working → **S‑E‑T** → Selectors → Endpoints → TargetPort.

---

# 🔐 ConfigMaps & Secrets

```bash
# ConfigMaps
kubectl get cm
kubectl describe cm <cm>
kubectl create cm appcfg --from-literal=env=prod
kubectl create cm appcfg --from-literal=env=prod --from-literal=debug=false
kubectl create cm appcfg --from-file=config.json
kubectl create cm appcfg --from-file=./dir
kubectl create cm appcfg --from-env-file=app.env      # key=value file, one per line

# Secrets
kubectl get secrets
kubectl describe secret <secret>
kubectl get secret <secret> -o jsonpath='{.data.token}' | base64 --decode
kubectl create secret generic creds --from-literal=user=utt --from-literal=pass=123
kubectl create secret generic creds --from-file=./config
kubectl create secret docker-registry regcred \
  --docker-server=REGISTRY \
  --docker-username=USER \
  --docker-password=PASS
```

**Injection patterns (YAML):**

```yaml
# Env from ConfigMap (all keys)
envFrom:
  - configMapRef:
      name: appcfg

# Single key from ConfigMap
env:
  - name: ENV
    valueFrom:
      configMapKeyRef:
        name: appcfg
        key: env

# Single key from Secret
env:
  - name: DB_PASS
    valueFrom:
      secretKeyRef:
        name: creds
        key: pass

# Volume mount (files in /config/)
volumes:
  - name: cfg-vol
    configMap:
      name: appcfg
containers:
  - volumeMounts:
      - name: cfg-vol
        mountPath: /config
```

> 💡 ConfigMaps = plain text. Secrets = base64-encoded. Both inject via **env** or **volume**.  

Mnemonic: **V‑E‑K** → Volume, Env, Key.

---

# 📦 Resource Limits & Requests

```yaml
resources:
  requests:
    cpu: "100m"       # 0.1 CPU core
    memory: "128Mi"
  limits:
    cpu: "250m"
    memory: "256Mi"
```

```bash
kubectl set resources deploy myapp \
  --containers=nginx \
  --requests=cpu=100m,memory=128Mi \
  --limits=cpu=250m,memory=256Mi
```

> 💡 **Requests** = guaranteed allocation. **Limits** = hard ceiling.  
> Pod evicted → check if memory limit too low. OOMKilled → memory limit exceeded.  

Mnemonic: **R‑L** → Request what you need, Limit what you allow.

---

# 🔒 Security Context

```yaml
# Pod-level (applies to all containers)
spec:
  securityContext:
    runAsUser: 1000
    runAsGroup: 3000
    fsGroup: 2000

# Container-level (overrides pod-level)
containers:
  - name: app
    securityContext:
      runAsNonRoot: true
      allowPrivilegeEscalation: false
      readOnlyRootFilesystem: true
      capabilities:
        add: ["NET_ADMIN"]
        drop: ["ALL"]
```

> 💡 `runAsUser` → sets UID. `fsGroup` → files written to volumes get this GID.  
> CKAD Cue: "Run as non-root" or "drop capabilities" → SecurityContext.

---

# 🏁 Init Containers

```yaml
spec:
  initContainers:
    - name: init-db
      image: busybox
      command: ['sh', '-c', 'until nslookup mydb; do echo waiting; sleep 2; done']
  containers:
    - name: app
      image: myapp
```

> 💡 Init containers **run to completion sequentially** before any app container starts.  
> Use for: waiting on dependencies, seeding data, pre-config.  
> CKAD Cue: Pod stuck in `Init:0/1` → check init container logs: `kubectl logs mypod -c init-db`.

---

# ❤️ Probes (Liveness, Readiness, Startup)

```bash
kubectl set probe deploy/myapp --liveness  --get-url=http://:80/healthz
kubectl set probe deploy/myapp --readiness --get-url=http://:80/ready
```

```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
  failureThreshold: 3

readinessProbe:
  exec:
    command: ["cat", "/tmp/ready"]
  initialDelaySeconds: 5
  periodSeconds: 3

startupProbe:
  tcpSocket:
    port: 8080
  failureThreshold: 30
  periodSeconds: 10
```

| Probe | Failure Action |
|-------|----------------|
| Liveness | Restart container |
| Readiness | Remove from Service endpoints |
| Startup | Block liveness/readiness until passes |

> 💡 Startup probe protects slow-starting containers from being killed by liveness.  

Mnemonic: **S‑R‑L** → Startup gates, Readiness routes, Liveness restarts.

---

# ⏱️ Jobs & CronJobs

```bash
kubectl create job pi --image=perl -- perl -Mbignum=bpi -wle 'print bpi(2000)'
kubectl create job busybox --image=busybox -- /bin/sh -c "echo hello; sleep 30; echo world"
kubectl create job myjob --from=cronjob/backup    # manual trigger from CronJob
kubectl get jobs
kubectl logs job/busybox

kubectl create cronjob backup --image=busybox --schedule="*/5 * * * *" -- echo hi
kubectl get cj
kubectl delete cj backup
```

**Job YAML fields:**

```yaml
spec:
  completions: 3          # run pod 3 times total
  parallelism: 2          # run 2 pods simultaneously
  backoffLimit: 4         # retry attempts before marking failed
  activeDeadlineSeconds: 100
  template:
    spec:
      restartPolicy: OnFailure   # Never or OnFailure — NOT Always
```

CKAD Cue: Job stuck → **B‑R‑C** → BackoffLimit, RestartPolicy, Command.

---

# 🔑 RBAC (ServiceAccounts, Roles, Bindings)

```bash
# ServiceAccounts
kubectl create sa mysa
kubectl get sa
kubectl run nginx --image=nginx --serviceaccount=mysa --dry-run=client -o yaml

# Roles (namespace-scoped)
kubectl create role pod-reader \
  --verb=get,list,watch \
  --resource=pods

kubectl create role pod-writer \
  --verb=create,update,patch,delete \
  --resource=pods,deployments

# RoleBinding
kubectl create rolebinding pod-reader-binding \
  --role=pod-reader \
  --serviceaccount=default:mysa \
  --namespace=dev

kubectl create rolebinding pod-reader-binding \
  --role=pod-reader \
  --user=jane

# ClusterRoles (cluster-wide)
kubectl create clusterrole node-reader --verb=get,list --resource=nodes
kubectl create clusterrolebinding node-reader-binding \
  --clusterrole=node-reader \
  --serviceaccount=default:mysa

# Check permissions
kubectl auth can-i create pods
kubectl auth can-i create pods --as=jane
kubectl auth can-i create pods --as=system:serviceaccount:default:mysa
kubectl auth can-i '*' '*'       # am I admin?
```

> 💡 **Role** = scoped to one namespace. **ClusterRole** = cluster-wide.  
> A ClusterRole bound with a **RoleBinding** is namespace-scoped. Bound with **ClusterRoleBinding** = cluster-wide.  

Mnemonic: **S‑R‑B** → ServiceAccount → Role → Binding.

---

# 🌍 Ingress

```bash
kubectl get ingress
kubectl describe ingress myingress
kubectl create ingress myingress --rule="myapp.com/api*=appsvc:80" --dry-run=client -o yaml
```

**Ingress YAML:**

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - host: myapp.com
      http:
        paths:
          - path: /api
            pathType: Prefix
            backend:
              service:
                name: appsvc
                port:
                  number: 80
```

> 💡 Ingress requires an **Ingress Controller** (nginx, traefik) to be deployed — it does NOT work alone.

---

# 💾 PersistentVolumes & PersistentVolumeClaims

```bash
kubectl get pv
kubectl get pvc
kubectl describe pvc mypvc
kubectl get sc                    # StorageClasses
```

**PV YAML:**

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mypv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /data/mypv
  persistentVolumeReclaimPolicy: Retain
```

**PVC YAML:**

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mypvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
  storageClassName: ""    # "" = static binding (no dynamic provisioning)
```

**Mount PVC in a Pod:**

```yaml
spec:
  volumes:
    - name: data-vol
      persistentVolumeClaim:
        claimName: mypvc
  containers:
    - name: app
      volumeMounts:
        - name: data-vol
          mountPath: /data
```

| AccessMode | Abbrev | Meaning |
|------------|--------|---------|
| ReadWriteOnce | RWO | One node, read+write |
| ReadOnlyMany | ROX | Many nodes, read only |
| ReadWriteMany | RWX | Many nodes, read+write |

Mnemonic: **S‑A‑V** → StorageClass, AccessMode, Volume.

---

# 🛡️ Taints, Tolerations & Node Affinity

```bash
# Taints
kubectl taint no node01 spray=mortein:NoSchedule
kubectl taint no node01 spray=mortein:NoSchedule-          # remove taint
kubectl taint no master node-role.kubernetes.io/master:NoSchedule-
kubectl describe no node01 | grep -i taint
```

**Toleration YAML (pod must tolerate the taint to be scheduled):**

```yaml
spec:
  tolerations:
    - key: spray
      operator: Equal
      value: mortein
      effect: NoSchedule
```

**Node Affinity YAML:**

```yaml
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: size
                operator: In
                values: [large, medium]
```

> 💡 **Taints** repel pods. **Tolerations** let pods ignore taints. **NodeSelector/Affinity** attract pods to nodes.  

Mnemonic: **T‑T‑A** → Taint the node, Tolerate in pod, Attract with Affinity.

---

# 🔍 Resource Inspection & Debugging

```bash
kubectl describe pod mypod
kubectl get pod mypod -o yaml
kubectl get events --sort-by=.metadata.creationTimestamp
kubectl get events -A | grep -i error

kubectl describe node <node>
kubectl get no
kubectl get no -o wide

kubectl top node
kubectl top pod
kubectl top pod --sort-by=cpu
kubectl top pod --sort-by=memory
kubectl top pod -l app=myapp
```

> 💡 Pod Pending → almost always a **scheduling** issue.  

CKAD Cue: Pod Pending → **R‑T‑N‑P** → Resources, Taints, NodeSelector, PVC.

---

# 🗂️ Namespace Operations

```bash
kubectl get ns
kubectl create ns dev
kubectl delete ns dev
kubectl config set-context --current --namespace=dev
kubectl get po -A                          # all namespaces
kubectl get all -A
kubectl get po -n kube-system
```

> ⏱️ **Exam Tip:** Switch namespace at the start of every question — one line that pays dividends.

---

# 🔎 JSONPath Quick Reference

```bash
kubectl get pod mypod -o jsonpath='{.status.podIP}'
kubectl get pods -o jsonpath='{.items[*].metadata.name}'
kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
kubectl get secret mysecret -o jsonpath='{.data.password}' | base64 --decode
kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.phase}{"\n"}{end}'
```

Mnemonic: **S‑M‑S** → Status → Metadata → Spec.

---

# 🔎 Custom-Columns Quick Reference

```bash
kubectl get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase
kubectl get pods -o custom-columns=\
  NAME:.metadata.name,\
  IMAGE:.spec.containers[*].image,\
  MEM_LIM:.spec.containers[*].resources.limits.memory
kubectl get nodes -o custom-columns=NAME:.metadata.name,CPU:.status.capacity.cpu
```

---

# 🌐 NetworkPolicy

```bash
kubectl get netpol
kubectl describe netpol
kubectl exec -it <pod> -- wget -qO- <svc>:<port>    # test connectivity
```

**Deny-all ingress (baseline lockdown):**

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: deny-all
spec:
  podSelector: {}
  policyTypes:
    - Ingress
```

**Allow specific ingress:**

```yaml
spec:
  podSelector:
    matchLabels:
      app: db
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              app: api
        - namespaceSelector:
            matchLabels:
              team: backend
      ports:
        - protocol: TCP
          port: 5432
```

> ⚠️ `from` items in the **same list element** (with `-`) are AND. Items as **separate list elements** (`-` on new line) are OR.  

Mnemonic: **I‑E‑N** → Ingress rules, Egress rules, NamespaceSelector.

---

# 🚨 CKAD Troubleshooting Scenarios (Surgical Mode)

## 🔥 CrashLoopBackOff

```bash
kubectl logs <pod>
kubectl logs <pod> --previous
kubectl describe pod <pod>
kubectl edit deploy <deploy>
```

**Common Causes:** Wrong command/args · Missing config/secret · Liveness probe too aggressive · Volume mount path mismatch  

Mnemonic: **C‑M‑P** → Command, Mounts, Probes.

---

## 💤 Pod Pending

```bash
kubectl describe pod <pod>          # look at Events section
kubectl describe node <node>        # check capacity + taints
kubectl get pvc                     # check if PVC is bound
```

**Common Causes:** NodeSelector mismatch · Taint not tolerated · Insufficient CPU/memory · PVC unbound  

Mnemonic: **R‑T‑N‑P** → Resources, Taints, NodeSelector, PVC.

---

## 🚫 Service Not Working

```bash
kubectl get svc
kubectl get ep                      # no endpoints = selector mismatch
kubectl get pods -l <selector>
kubectl describe svc <svc>
```

**Common Causes:** Wrong label selector · No matching pods · Wrong targetPort · Readiness probe failing  

Mnemonic: **S‑E‑T** → Selector, Endpoints, TargetPort.

---

## 📦 PVC Pending

```bash
kubectl get pvc
kubectl describe pvc
kubectl get sc
kubectl get pv
```

**Common Causes:** StorageClass mismatch · AccessMode mismatch · No matching PV available  

Mnemonic: **S‑A‑V** → StorageClass, AccessMode, Volume.

---

## 🔐 NetworkPolicy Blocking

```bash
kubectl get netpol
kubectl describe netpol
kubectl exec -it <pod> -- wget -qO- <svc>:<port>
```

Mnemonic: **I‑E‑N** → Ingress rules, Egress rules, NamespaceSelector.

---

## 🔄 Deployment Not Updating

```bash
kubectl rollout status deploy <d>
kubectl describe deploy <d>
kubectl get rs
kubectl get pods -l app=<d>
```

Mnemonic: **I‑S‑M** → Image, Strategy, MaxUnavailable.

---

## 🔒 Permission Denied / RBAC

```bash
kubectl auth can-i <verb> <resource> --as=<user>
kubectl auth can-i <verb> <resource> --as=system:serviceaccount:<ns>:<sa>
kubectl describe role <role> -n <ns>
kubectl describe rolebinding <rb> -n <ns>
```

Mnemonic: **S‑R‑B** → ServiceAccount, Role, Binding.

---

# 🧩 CKAD kubectl Decision Tree

```
Pod Pending
  └─ describe pod → Events section
       ├─ Insufficient CPU/memory → add resources / remove limits
       ├─ No nodes matched → check nodeSelector / taints / affinity
       └─ PVC not bound → check storageClass / accessMode / PV

Pod Running but Not Ready
  └─ readinessProbe failing → logs / exec / fix probe
  └─ no endpoints → label selector mismatch on service

Pod Restarting (CrashLoopBackOff)
  └─ kubectl logs --previous
       ├─ exit code 1 → app error / bad command
       ├─ OOMKilled (137) → raise memory limit
       └─ liveness killing it → relax initialDelaySeconds / thresholds

Service Broken
  └─ kubectl get ep → empty? → selector wrong
  └─ endpoints exist but no response → targetPort wrong

Job Not Completing
  └─ restartPolicy wrong (must be Never/OnFailure)
  └─ backoffLimit exhausted → check command
  └─ parallelism / completions mismatch

Deployment Not Rolling Out
  └─ kubectl rollout status → check progress
  └─ kubectl get rs → old RS still has pods → maxUnavailable issue
  └─ wrong image name → imagePullBackOff
```

---

# 🧩 Imperative → Declarative Cheat Sheet

```bash
# Generate base YAML
kubectl create deploy app --image=nginx --dry-run=client -o yaml > app.yaml
kubectl run pod1 --image=nginx --restart=Never --dry-run=client -o yaml > pod.yaml
kubectl create cm mycm --from-literal=k=v --dry-run=client -o yaml > cm.yaml
kubectl create secret generic mysec --from-literal=p=x --dry-run=client -o yaml > sec.yaml
kubectl create sa mysa --dry-run=client -o yaml > sa.yaml
kubectl create role myrole --verb=get,list --resource=pods --dry-run=client -o yaml > role.yaml
kubectl create ingress myingress --rule="host/path=svc:port" --dry-run=client -o yaml > ing.yaml

# Extract live YAML for editing
kubectl get deploy app -o yaml > app.yaml
kubectl get pod mypod -o yaml > pod.yaml
```

> ⏱️ **Exam Tip:** Never write YAML from scratch. Always generate with `--dry-run=client -o yaml` and edit.

---

# 🧩 kubectl + YAML Fusion Patterns

| Task | Technique |
|------|-----------|
| Add sidecar | Edit deployment → add container to `containers[]` |
| Add volume + mount | Edit deployment → `volumes[]` + `volumeMounts[]` |
| Inject all ConfigMap keys as env | `envFrom: [{configMapRef: {name: cm}}]` |
| Inject single Secret key as env | `env: [{valueFrom: {secretKeyRef: ...}}]` |
| Mount Secret as files | `volumes: [{secret: {secretName: ...}}]` |
| Add liveness probe | `livenessProbe: {httpGet/exec/tcpSocket}` |
| Add init container | `initContainers: [{name, image, command}]` |
| Run as non-root | `securityContext: {runAsNonRoot: true}` |
| Add toleration | `tolerations: [{key, operator, value, effect}]` |
| Bind ServiceAccount | `spec.serviceAccountName: mysa` |

---

# 🔎 Monitoring

```bash
kubectl top no
kubectl top po
kubectl top po --sort-by=cpu
kubectl top po --sort-by=memory
kubectl top po -l app=myapp
kubectl top po -A
```

---

# 🧩 CKAD Muscle‑Memory Daily Routine

1. Create pod / deployment → YAML → Edit → Apply
2. Add probe (liveness + readiness)
3. Add sidecar + shared volume (emptyDir)
4. Create ConfigMap + inject via env + volume
5. Create Secret + inject
6. Create Job + CronJob + check logs
7. Set resource requests/limits
8. Create Role + RoleBinding + verify with `auth can-i`
9. Apply NetworkPolicy + test connectivity
10. PVC → mount to pod
11. Rollout operations (update image → undo → pause → resume)
12. JSONPath / custom-columns extraction
13. Service troubleshooting (endpoints, selectors)
14. Debug with `kubectl debug` or ephemeral containers

---

# 🧩 Final Mnemonic Map: C.R.U.D‑L.S.D.

| Letter | Action | Exam Trigger |
|--------|--------|--------------|
| **C** | Create | `run`, `create`, `expose` |
| **R** | Read | `get`, `describe`, `logs`, `explain` |
| **U** | Update | `edit`, `set`, `patch`, `apply`, `rollout` |
| **D** | Delete | `delete --force --grace-period=0` |
| **L** | Label | `label`, `annotate`, `selector` |
| **S** | Select | JSONPath, custom-columns, `--selector` |
| **D** | Debug | `exec`, `debug`, `top`, `events`, `port-forward` |

---

> 🎯 **Final Exam Checklist**
> - [ ] Set aliases and `$do` / `$now` variables at terminal start
> - [ ] Set namespace at start of every question
> - [ ] Always `--dry-run=client -o yaml` before applying
> - [ ] Check events section in `describe` when pod misbehaves
> - [ ] Verify with `kubectl get ep` when a service is broken
> - [ ] Use `kubectl explain` when a field name escapes you
> - [ ] `kubectl auth can-i` to quickly verify RBAC
> - [ ] `kubectl logs --previous` for crashed containers
> - [ ] `kubectl rollout undo` is one command — don't overthink it

**Good luck. You've got this.** 🚀
