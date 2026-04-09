# 🧩 JSONPath — Kubernetes Quick Reference (DevOps Edition)

“JSONPath is your scalpel for Kubernetes — precise, surgical, and indispensable.”

---

## 🔑 Why JSONPath Matters in Kubernetes

Kubernetes objects are deeply nested.  
JSONPath helps you extract exactly the field you want, without dumping the entire YAML.

Real DevOps Use Cases:
- Extract Pod IPs
- List container images
- Fetch node capacities
- Filter workloads by status
- Debug misconfigured deployments
- Build scripts & automation pipelines

---

# 🧠 JSONPath Fundamentals (K8s‑Optimized)

Basic Pattern:  
`{.field}`  
`{.field.subfield}`  
`{.items[*].metadata.name}`  

Mnemonic: Dot = Dive Down One Level

---

# 🧱 JSONPath Building Blocks

1️⃣ Root:  
`$`  

Mnemonic: `$ = Source of Truth`

---

2️⃣ Field Access:  
`.metadata.name`  
`.spec.containers`  
`.status.phase`  

Mnemonic: Dot = Step Into the Structure

Additional Cues:
- metadata = identity card of the object  
- spec = desired state blueprint  
- status = actual runtime state  

---

3️⃣ List Wildcard:  
`[*]`  

Mnemonic: Star = Select All  

Example:  
`.items[*].metadata.name`

---

4️⃣ Indexing:  
`[0]`  
`[-1]`  

Mnemonic:  
Zero = First (arrays start at 0)  
Minus One = Last (tail element)  

Example:  
`.spec.containers[0].image`

---

5️⃣ Filtering:  
`[?(@.status.phase=="Running")]`  

Mnemonic: `? = Ask a Question to the List`

---

# 🧩 NEW: Custom Columns in kubectl (Professional JSONPath Integration)

Custom columns let you format `kubectl` output using JSONPath expressions.

General Form:  
`kubectl get <resource> -o custom-columns=<COLUMN_NAME>:<JSONPATH>`

Mnemonic: Custom Columns = “Name the Column, Point to the Path”

---

Examples:

1. Show pod name + IP:  
`kubectl get pods -o custom-columns=NAME:.metadata.name,IP:.status.podIP`  

Mnemonic: Name → `metadata.name`, IP → `status.podIP`

---

2. Show container images:  
`kubectl get pods -o custom-columns=POD:.metadata.name,IMAGE:.spec.containers[*].image`  

Mnemonic: Use star to list all images

---

3. Show node capacity summary:  
`kubectl get nodes -o custom-columns=NODE:.metadata.name,CPU:.status.capacity.cpu,MEM:.status.capacity.memory`  

Mnemonic: `status.capacity` = static resource limits

---

4. Show deployment desired vs ready:  
`kubectl get deploy -o custom-columns=NAME:.metadata.name,DESIRED:.spec.replicas,READY:.status.readyReplicas`  

Mnemonic: `spec` = desired, `status` = actual

---

5. Show service name + ClusterIP + Type:  
`kubectl get svc -o custom-columns=NAME:.metadata.name,CLUSTER_IP:.spec.clusterIP,TYPE:.spec.type`  

Mnemonic: `spec.type` = service exposure model

---

6. Show pod phase + node name:  
`kubectl get pods -o custom-columns=POD:.metadata.name,PHASE:.status.phase,NODE:.spec.nodeName`  

Mnemonic: `status.phase` = lifecycle state, `spec.nodeName` = scheduling target

---

7. Show only pods in Running state (filter + custom columns):  
`kubectl get pods -o jsonpath='{.items[?(@.status.phase=="Running")].metadata.name}' | xargs -I{} kubectl get pod {} -o custom-columns=NAME:.metadata.name,IP:.status.podIP`  

Mnemonic: filter first → format later

---

# 🚀 Kubernetes‑Specific JSONPath Recipes (Real‑World)

1. Get Pod Names:  
`kubectl get pods -o jsonpath='{.items[*].metadata.name}'`  

Mnemonic: `metadata.name` = canonical identifier

---

2. Get Pod IPs:  
`kubectl get pods -o jsonpath='{.items[*].status.podIP}'`  

Mnemonic: `status.podIP` = runtime network identity

---

3. Get Container Images in a Pod:  
`kubectl get pod mypod -o jsonpath='{.spec.containers[*].image}'`  

Mnemonic: `containers[*].image` = container identity

---

4. Get All Images in a Namespace:  
`kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'`  

Sort & dedupe:  
`kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}' | tr ' ' '\n' | sort -u`  

Mnemonic: `items → spec → containers → image` = full path to container identity

---

5. Get Node Internal IPs:  
`kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'`  

Mnemonic: filter by `type == InternalIP`

---

6. Get Deployment Replicas:  
`kubectl get deploy myapp -o jsonpath='{.spec.replicas}'`  

Mnemonic: `spec.replicas` = desired count

---

7. Get Ready Pod Count:  
`kubectl get deploy myapp -o jsonpath='{.status.readyReplicas}'`  

Mnemonic: `status.readyReplicas` = actual count

---

8. Get Node CPU & Memory Capacity:  
`kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{" => CPU:"}{.status.capacity.cpu}{" MEM:"}{.status.capacity.memory}{"\n"}{end}'`  

Mnemonic: `range` = repeat for each node

---

9. Filter Pods by Phase (Running):  
`kubectl get pods -o jsonpath='{.items[?(@.status.phase=="Running")].metadata.name}'`  

Mnemonic: `?` = conditional selection

---

10. Extract Labels:  
`kubectl get pod mypod -o jsonpath='{.metadata.labels}'`  

Specific label:  
`kubectl get pod mypod -o jsonpath='{.metadata.labels.app}'`  

Mnemonic: `metadata.labels` = classification tags

---

# 🧠 JSONPath Mnemonics (Kubernetes Edition)

Pattern | Meaning | Mnemonic
------- | -------- | --------
`$` | Root | `$ = Source of the JSON tree`
`.` | Field navigation | `Dot = Step Down One Level`
`[*]` | All items | `Star = Select All`
`[0]` | First item | `Zero = First Element`
`[-1]` | Last item | `Minus One = Tail Element`
`?()` | Filter | `? = Ask a Question`
`@` | Current item | `@ = At This Item`
`range … end` | Loop | `Range = Repeat`

---

# 🧩 JSONPath Patterns You MUST Memorize for K8s

1. List all resource names:  
`.items[*].metadata.name`  

Mnemonic: `metadata.name` = canonical identifier

---

2. List all container images:  
`.spec.containers[*].image`  

Mnemonic: `containers[*].image` = container identity

---

3. Filter by field:  
`[?(@.field=="value")]`  

Mnemonic: `?` = conditional selection

---

4. Loop with formatting:  
`{range .items[*]}{.metadata.name}{"\n"}{end}`  

Mnemonic: `range` = structured reporting

---

5. Access nested status fields:  
`.status.conditions[?(@.type=="Ready")].status`  

Mnemonic: `conditions` = health indicators

---

# 🛠️ Real‑Time DevOps Use Cases

1. Debug Image Drift:  
`kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'`  

Mnemonic: image list = version drift detector

---

2. Identify Pods Not Ready:  
`kubectl get pods -o jsonpath='{.items[?(@.status.phase!="Running")].metadata.name}'`  

Mnemonic: `!= Running` = anomaly detection

---

3. Extract Node Resource Summary:  
`kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{" => CPU:"}{.status.capacity.cpu}{" MEM:"}{.status.capacity.memory}{"\n"}{end}'`  

Mnemonic: `capacity` = static resource limits

---

4. Find Pods Using a Specific Image:  
`kubectl get pods -o jsonpath='{.items[?(@.spec.containers[*].image=="nginx:1.25")].metadata.name}'`  

Mnemonic: filter by image = pinpoint workloads

---

5. Get Service ClusterIPs:  
`kubectl get svc -o jsonpath='{.items[*].spec.clusterIP}'`  

Mnemonic: `clusterIP` = internal service endpoint

---

# 🎯 JSONPath Tips & Cues for Memorization

1. Follow the YAML Path:  
Replace indentation with dots.  
Replace lists with `[*]`.

Example YAML:  
`spec:`  
`  containers:`  
`    - image: nginx`  

JSONPath:  
`.spec.containers[*].image`  

Mnemonic: YAML indentation = JSONPath dots

---

2. Think in “Maps & Lists”:  
Map → `.key`  
List → `[*]`  

Mnemonic: Dot for Map, Star for List

---

3. Use kubectl explain:  
`kubectl explain pod.spec.containers`  

Mnemonic: `explain` = structural blueprint

---

4. Start Simple, Then Add Filters:  
`.items[*]`  
`.items[*].metadata.name`  
`.items[?(@.status.phase=="Running")].metadata.name`  

Mnemonic: build path → refine → filter

---

5. Use Range for Pretty Output:  
`{range .items[*]}{.metadata.name}{"\n"}{end}`  

Mnemonic: `range` = formatted iteration

---

# 🧩 JSONPath Cheat Sheet (Kubernetes‑Focused)

Goal | JSONPath
---- | --------
Pod names | `.items[*].metadata.name`
Pod IPs | `.items[*].status.podIP`
Container images | `.spec.containers[*].image`
Node internal IPs | `.status.addresses[?(@.type=="InternalIP")].address`
Deployment replicas | `.spec.replicas`
Ready replicas | `.status.readyReplicas`
Pod phase | `.status.phase`
Labels | `.metadata.labels`
Annotations | `.metadata.annotations`
Conditions | `.status.conditions[*]`

---

# 🧩 Final Mnemonic Map: D.S.F.R.

Letter | Meaning | Mnemonic | Action
------ | -------- | -------- | -------
D | Dot | Dot = Dive Down | Navigate maps
S | Star | Star = Select All | Iterate lists
F | Filter | ? = Ask a Question | Conditional selection
R | Range | Range = Repeat | Structured reporting
