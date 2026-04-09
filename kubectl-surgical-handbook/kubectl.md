# 🧩 KUBECTL — Surgical Quick Reference (CKAD Edition, Final Unified Version)

“Kubectl is your scalpel in the CKAD exam — precise, fast, and unforgiving.”

This handbook merges all CKAD‑relevant content into one clean, deduplicated, enriched, exam‑ready reference.

---

# 🔥 CKAD Mindset: “FAST CYCLE OPS”

1. See → get, describe, logs  
2. Stabilize → edit, patch, scale  
3. Fix → apply, replace  
4. Verify → get, logs, exec  
5. Move → next question  

Mnemonic: **S‑S‑F‑V‑M** → “See, Stabilize, Fix, Verify, Move.”

---

# 🧠 kubectl Fundamentals (Optimized for Memorization)

## Global Flags You Must Know
- `-n <ns>`  
- `--dry-run=client -o yaml`  
- `-o wide`  
- `--show-labels`  
- `--sort-by`  
- `--field-selector`  
- `--force --grace-period=0`  

Mnemonic: **N D W L S F** → “Namespaces Don’t Wait; Labels Sort Fast.”

## kubectl explain (CKAD MUST‑KNOW)
`kubectl explain pod`  
`kubectl explain pod.spec`  
`kubectl explain pod.spec.containers`  
`kubectl explain deploy`  
`kubectl explain pod.spec.containers --recursive`  

**Conceptual Note:**  
`kubectl explain` is your **built‑in Kubernetes documentation**.  
Use it when you forget field names under pressure.

---

# 🧱 Creating Resources (Imperative)

## Pods
`kubectl run mypod --image=nginx`  
`kubectl run mypod --image=nginx --restart=Never`  
`kubectl run mypod --image=nginx --port=80`  

## Generate YAML (don’t apply)
`kubectl run mypod --image=nginx --dry-run=client -o yaml > pod.yaml`

## Multi‑container Pod
`kubectl run mc --image=nginx --dry-run=client -o yaml --overrides='{"spec":{"containers":[{"name":"c1","image":"nginx"},{"name":"c2","image":"busybox","command":["sleep","3600"]}]}}'`

## Pod Lifecycle Notes
restartPolicy: Always | OnFailure | Never  
Default: Always  

`kubectl logs --previous <pod>`  

**Conceptual Note:**  
- `Always` → restarts on failure (default for Deployments)  
- `OnFailure` → retry logic for Jobs  
- `Never` → run once and exit  

---

# 🧩 Editing & Applying

`kubectl edit deploy myapp`  
`kubectl replace -f deploy.yaml`  
`kubectl apply -f .`  
`kubectl patch deploy myapp -p '{"spec":{"replicas":3}}'`  
`kubectl patch deploy myapp --type=json -p='[{"op":"replace","path":"/spec/replicas","value":4}]'`

**Conceptual Note:**  
Use **edit** for live fixes.  
Use **apply** for declarative workflows.

---

# 🏷️ Labels, Annotations, Selectors

`kubectl label pod mypod tier=frontend`  
`kubectl label pod mypod tier-`  
`kubectl label po nginx env=lab`  
`kubectl label po nginx env=lab1 --overwrite`  
`kubectl label no node01 size=large`  

`kubectl get pods -l tier=frontend`  
`kubectl get po --selector=app=App1`  
`kubectl get po --selector=env=prod,bu=finance,tier=frontend`  

`kubectl annotate pod mypod owner=utt`  
`kubectl annotate po nginx desc="Hello World"`  
`kubectl annotate po nginx desc-`  

**Conceptual Note:**  
Selectors behave like logical AND:  
`env=prod,tier=frontend` → must match both.

Mnemonic: **L A S A** → Label → Annotate → Select → Annotate.

---

# 📜 Logs, Exec, Debug

`kubectl logs mypod`  
`kubectl logs mypod -c sidecar`  
`kubectl logs -f mypod`  
`kubectl logs <pod> --previous`  
`kubectl exec -it mypod -- sh`  
`kubectl exec -it web -c nginx -- /bin/bash`  
`kubectl debug mypod -it --image=busybox`  
`kubectl cp mypod:/var/log/app.log ./app.log`  

**Conceptual Note:**  
`--previous` shows logs from the **last crashed container instance**.

CKAD Cue: CrashLoopBackOff → **L‑D‑E** → Logs → Describe → Edit.

---

# 🌐 Services

`kubectl expose pod mypod --port=80 --target-port=8080 --type=ClusterIP`  
`kubectl expose deploy myapp --port=80 --type=NodePort`  
`kubectl expose pod redis --port=6379 --name=redis-service --type=ClusterIP --dry-run=client -o yaml`  
`kubectl expose pod nginx --port=80 --target-port=8080 --type=NodePort --dry-run=client -o yaml`  

`kubectl get svc`  
`kubectl describe svc <svc>`  
`kubectl get ep`  

**Conceptual Note:**  
- `port` → service port  
- `targetPort` → container port  
- `nodePort` → node‑level port (30000–32767)

CKAD Cue: Service not working → **L‑S‑E** → Labels → Selectors → Endpoints.

---

# 🚀 Deployments

`kubectl create deploy myapp --image=nginx`  
`kubectl get deploy`  
`kubectl describe deploy myapp`  
`kubectl get deploy -o wide`  
`kubectl scale deploy myapp --replicas=5`  
`kubectl rollout status deploy myapp`  
`kubectl rollout history deploy myapp`  
`kubectl rollout undo deploy myapp`  
`kubectl rollout pause deploy myapp`  
`kubectl rollout resume deploy myapp`  
`kubectl create deploy myapp --image=nginx --dry-run=client -o yaml`  

**Conceptual Note:**  
Deployments create ReplicaSets → ReplicaSets create Pods.  
Rollouts track revisions.

CKAD Cue: Deployment not updating → check **image**, **strategy**, **rollout**.

---

# 🔐 ConfigMaps & Secrets

`kubectl get cm`  
`kubectl describe cm <cm>`  
`kubectl create cm appcfg --from-literal=env=prod`  
`kubectl create cm appcfg --from-file=config.json`  
`kubectl create cm appcfg --from-file=./dir`  

`kubectl get secrets`  
`kubectl describe secret <secret>`  
`kubectl create secret generic creds --from-literal=user=utt --from-literal=pass=123`  
`kubectl create secret generic creds --from-file=./config`  

**Conceptual Note:**  
- ConfigMaps = plain text  
- Secrets = base64 encoded  
- Both can be injected via env or volume

Mnemonic: **V‑E‑K** → Volume, Env, Key.

---

# ❤️ Probes (Liveness, Readiness, Startup)

`kubectl set probe deploy/myapp --liveness --get-url=http://:80/healthz`  
`kubectl set probe deploy/myapp --readiness --get-url=http://:80/ready`  

Probe properties:
initialDelaySeconds  
periodSeconds  
failureThreshold  
httpGet  
exec  
tcpSocket  

**Conceptual Note:**  
- Liveness → restart container  
- Readiness → remove from service endpoints  

Mnemonic: **RNR / RST**.

---

# ⏱️ Jobs & CronJobs

`kubectl create job pi --image=perl -- perl -Mbignum=bpi -wle 'print bpi(2000)'`  
`kubectl create job busybox --image=busybox -- /bin/sh -c "echo hello;sleep 30;echo world"`  
`kubectl get jobs`  
`kubectl logs busybox-xxxxx`  
`kubectl create cronjob backup --image=busybox --schedule="*/5 * * * *" -- echo hi`  
`kubectl get cj`  

**Conceptual Note:**  
Jobs require restartPolicy = Never | OnFailure.

CKAD Cue: Job stuck → **B‑R‑C** → Backoff, RestartPolicy, Command.

---

# 🔍 Resource Inspection & Debugging

`kubectl describe pod mypod`  
`kubectl get pod mypod -o yaml`  
`kubectl get events --sort-by=.metadata.creationTimestamp`  

`kubectl describe node <node>`  
`kubectl get no`  
`kubectl get no -o wide`  

`kubectl top node`  
`kubectl top pod`  
`kubectl top po --sort-by cpu`  

**Conceptual Note:**  
Pod Pending → usually scheduling issues.

CKAD Cue: Pod Pending → **T‑N‑A‑R** → Taints, NodeSelector, Affinity, Resources.

---

# 🧩 Imperative → Declarative Conversion

`kubectl create deploy myapp --image=nginx --dry-run=client -o yaml > deploy.yaml`  
`kubectl get deploy myapp -o yaml > deploy.yaml`  

**Conceptual Note:**  
This is the fastest way to generate correct YAML under pressure.

---

# 🔎 JSONPath Quick Reference

`kubectl get pod mypod -o jsonpath='{.status.podIP}'`  
`kubectl get pods -o jsonpath='{.items[*].metadata.name}'`  
`kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'`  

Mnemonic: **S M S** → Status → Metadata → Spec.

---

# 🗂️ Namespace Operations

`kubectl get ns`  
`kubectl create ns dev`  
`kubectl delete ns dev`  
`kubectl config set-context --current --namespace=dev`  
`kubectl get po -A`  
`kubectl get all -A`  

**Conceptual Note:**  
Switch namespace early → saves minutes.

---

# ⚡ CKAD Time‑Saver Aliases

`alias k='kubectl'`  
`alias kgp='kubectl get pods'`  
`alias kgs='kubectl get svc'`  
`alias kga='kubectl get all'`  
`alias kdp='kubectl describe pod'`  
`alias kaf='kubectl apply -f'`  
`alias kdf='kubectl delete -f'`  

---

# 🚨 CKAD Troubleshooting Scenarios (Surgical Mode)

## 🔥 CrashLoopBackOff
`kubectl logs <pod>`  
`kubectl logs <pod> --previous`  
`kubectl describe pod <pod>`  
`kubectl edit deploy <deploy>`  

**Common Causes:**  
- Wrong command/args  
- Missing config/secret  
- Failing liveness probe  
- Volume mount path mismatch  

Mnemonic: **C‑M‑P** → Command, Mounts, Probes.

---

## 💤 Pod Pending
`kubectl describe pod <pod>`  
`kubectl describe node <node>`  

**Common Causes:**  
- NodeSelector mismatch  
- Taints not tolerated  
- Insufficient CPU/memory  
- PVC not bound  

Mnemonic: **R‑T‑N‑P** → Resources, Taints, NodeSelector, PVC.

---

## 🚫 Service Not Working
`kubectl get svc`  
`kubectl get ep`  
`kubectl get pods -l <selector>`  

**Common Causes:**  
- Wrong selector  
- No endpoints  
- Wrong targetPort  
- Readiness probe failing  

Mnemonic: **S‑E‑T** → Selector, Endpoints, TargetPort.

---

## 📦 PVC Pending
`kubectl get pvc`  
`kubectl describe pvc`  
`kubectl get sc`  

**Common Causes:**  
- StorageClass mismatch  
- AccessMode mismatch  
- No PV available  

Mnemonic: **S‑A‑V** → StorageClass, AccessMode, Volume.

---

## 🔐 NetworkPolicy Blocking
`kubectl get netpol`  
`kubectl describe netpol`  
`kubectl exec -it <pod> -- wget <svc>:<port>`  

Mnemonic: **I‑E‑N** → Ingress, Egress, NamespaceSelector.

---

## 🔄 Deployment Not Updating
`kubectl rollout status deploy <d>`  
`kubectl describe deploy <d>`  
`kubectl get rs`  

Mnemonic: **I‑S‑M** → Image, Strategy, MaxUnavailable.

---

# 🧩 CKAD kubectl Decision Tree Map

## 🟦 Pod Pending
→ describe pod  
→ check node  
→ check taints  
→ check PVC  
→ check resources  

## 🟩 Pod Running but Not Ready
→ readiness probe  
→ endpoints  
→ config injection  

## 🟧 Pod Restarting
→ liveness probe  
→ command  
→ mounts  

## 🟥 Service Broken
→ selector  
→ endpoints  
→ targetPort  

## 🟪 Job Not Completing
→ backoffLimit  
→ restartPolicy  
→ command  

## 🟨 Deployment Not Updating
→ rollout  
→ image  
→ strategy  

---

# 🧩 kubectl + YAML Fusion Sheet

Imperative → YAML  
`kubectl create deploy app --image=nginx --dry-run=client -o yaml > app.yaml`

Extract live YAML  
`kubectl get deploy app -o yaml > app.yaml`

Convert Pod → Deployment  
`kubectl get pod p -o yaml > p.yaml`  
(edit: change kind, add selector, add replicas)

Add sidecar  
(edit deployment → add container)

Add volume + mount  
(edit deployment → volumes + volumeMounts)

Add env from ConfigMap  
envFrom: configMapRef

Add secret as env  
env: secretKeyRef

Add probe  
livenessProbe: httpGet, exec, tcpSocket

---

# 🧩 CKAD Muscle‑Memory Daily Routine

1. Create → YAML → Edit → Apply  
2. Add probe  
3. Add sidecar  
4. Create ConfigMap + mount  
5. Create Job + CronJob  
6. Debug networking  
7. JSONPath extraction  
8. Service troubleshooting  
9. PVC troubleshooting  
10. Rollout operations  

---

# 🧩 Additional CKAD Essentials

## Environment Variables (Imperative)
`kubectl run nginx --image=nginx --env=app=web`

## ServiceAccount
`kubectl create sa myuser`  
`kubectl get sa`  
`kubectl run nginx --image=nginx --serviceaccount=myuser --dry-run=client -o yaml`

## Taints & Tolerations
`kubectl describe no <node> | grep -i taint`  
`kubectl taint no node01 spray=mortein:NoSchedule`  
`kubectl taint no master node-role.kubernetes.io/master:NoSchedule-`

## Monitoring
`kubectl top no`  
`kubectl top po`  
`kubectl top po --sort-by cpu`

## NetworkPolicy Basics
`kubectl get netpol`  
`kubectl describe netpol`

---

# 🧩 Final Mnemonic Map: C.R.U.D‑L.S.D.

C → Create  
R → Read  
U → Update  
D → Delete  
L → Label  
S → Select  
D → Debug  

---
