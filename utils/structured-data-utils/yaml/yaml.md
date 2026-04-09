# 🧩 YAML — Quick Reference (Refined & Complete)

> *"YAML is the lingua franca of modern tech — from Ansible to GitHub Actions to Kubernetes."*

---

## 🔑 Fundamentals

### Basic Syntax
- **Indentation** → Spaces only (no tabs). Consistent depth is mandatory.
- **Key-Value Pairs** → `key: value`
- **Lists** → `- item`
- **Dictionaries** → Nested indentation under a key.

```yaml
app: myservice
port: 8080
servers:
  - host1
  - host2
```  

⚠️ `Critical Nuance`: Misaligned spaces or a single tab character will break the parser entirely.

## Multi-Document Separators

- `---` → Triple-Dash: Starts a new document/resource. Essential for bundling multiple Kubernetes objects (e.g., Service + Deployment) in one file.

- `...` → Triple-Dot: Formally ends a document (rarely used in DevOps, but valid).

```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: webapp-svc
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp
```

## 📚 Core Structures & Mnemonics

**🗂️ Map (Dictionary)**
- Mnemonic: “Colon = Collection”

= Fingerprint: Multiple lines aligned, ending in :.

**📋 List (Sequence)**
- Mnemonic: “Dash = Data in Order”

- Fingerprint: Lines starting with - at the same level.

**🔗 List of Maps**
- Mnemonic: “Dash + Colon = Dictionary in a List”

- Usage: Standard for defining Kubernetes containers or Ansible tasks.

```yaml
users:
  - name: Alice
    role: admin
  - name: Bob
    role: developer
```

**🧩 Nested Structures**
- Mnemonic: “Indent = Inside”

- Logic: Deeper indentation means the data belongs to the key above it.

## 📝 Multi-line Strings

**Literal vs Folded**
- `|` → Literal: “Line for Line.” Preserves every newline. Use for scripts or SSH keys.

- `>` → Folded: “Greater = Giant Line.” Converts newlines into spaces. Use for long descriptions.

**Chomping Indicators**
- `|` → Clip: Keeps exactly one newline at the end (Default).

- `|+` → Keep: Keeps all trailing blank lines.

- `|-` → Strip: Removes all trailing blank lines (Best for clean config injection).

```yaml
script: |-
  echo "Deploying..."
  kubectl apply -f k8s/
```

## 🚀 Advanced Concepts

**Anchors, Aliases & Merging**
- `&` → Anchor: Attach a label to a block of code.

- `*` → Alias: Reference that label elsewhere.

- `<<` → Merge Key: Inject the anchored content into a new map.

**Mnemonic** 

- “Double-Less = Load Less” (use << to write less code).

```yaml
defaults: &base
  retries: 3
  timeout: 30

service-a:
  <<: *base
  port: 80
```

## 🌊 Flow vs Block Style
- `Flow Style` → {} and []. JSON-like, good for compact lists.

- `Block Style` → Indentation and dashes. Standard for readability.

```yaml
ports: [80, 443] # Flow
ports:           # Block
  - 80
  - 443
```

## 🛡️ Nuances to Remember
- **The "Norway Problem"** → In YAML 1.1, `NO` is parsed as `false`. Always quote ISO codes: `"NO"`, `"OFF"`, `"ON"`.
- **The Port Trap** → `ports: 22:22` can be misparsed as sexagesimal (base-60). Always quote port mappings: `"22:22"`.
- **Reserved Characters** → `? : - { } [ ] , & * # ! | > ' " % @ \ ` are reserved. If a value starts with one, wrap it in quotes.
- **Booleans** → Prefer `true/false` over `yes/no` for better cross-language parser consistency.
- **Casting** → Use !!str to force a number to be a string: version: !!str 1.1.
- **Validation** → Always lint before committing:

  - `yamllint file.yaml`
  - `kubectl apply --dry-run=client`
  - `ansible-playbook --syntax-check`

## 📋 Mnemonic Cheat Sheet

| Symbol | Mnemonic                        | Purpose                                |
|--------|----------------------------------|----------------------------------------|
| :      | Colon = Collection              | Map (Key: Value)                       |
| -      | Dash = Data in Order            | List item                              |
| &      | Anchor = Attach                 | Define reusable block                  |
| *      | Alias = At again                | Reference an anchor                    |
| <<     | Double-Less = Load Less         | Merge template into map                |
| ---    | Triple-Dash = Document          | Start new resource/file                |
| ...    | Triple-Dot = End                | End a document (rare)                  |
| |      | Pipe = Preserve                 | Literal block (newlines stay)          |
| >      | Greater = Giant Line            | Folded block (newlines → spaces)       |

## 🚀 Advanced Merging & Overriding

**Simple Value Override**
- In this scenario, we use a base template for a deployment but change only the `image` and `port` for a specific environment.

```yaml
# Define the base template
.base_service: &base_config
  replicas: 3
  image: nginx:stable
  port: 80
  restart_policy: always

# Override specific keys
web-production:
  <<: *base_config       # Pulls in all 4 keys
  image: nginx:1.25      # Overrides only the image
  port: 443              # Overrides only the port
```

**Result** 

- `web-production` will have `replicas: 3` and `restart_policy: always` from the template, but its own specific image and port.

**2. Nested Map Merging (The "Gotcha")**
⚠️ Important Nuance: YAML merge keys do not perform a deep merge. If you override a nested dictionary, you replace the entire dictionary.

```yaml
.db_defaults: &db_base
  connection:
    host: localhost
    port: 5432
    timeout: 30

# ❌ INCORRECT: Trying to override just the host
db-client:
  <<: *db_base
  connection:
    host: prod-db        # WARNING: This DELETES 'port' and 'timeout'!

# ✅ CORRECT: Redefining the nested map
db-client-fixed:
  <<: *db_base
  connection:
    host: prod-db
    port: 5432           # Must re-state these if 'connection' is overridden
    timeout: 30
```

**Merging Multiple Anchors**
- You can merge multiple templates into a single block. If there are conflicting keys, the `last` merge key (or the keys defined directly in the map) takes precedence.

```yaml
.monitoring: &mon_labels
  metrics: enabled
  log_level: info

.security: &sec_policy
  runAsRoot: false
  readOnlyRootFilesystem: true

# Combine both templates
api-gateway:
  <<: [*mon_labels, *sec_policy]  # Merges both lists of keys
  log_level: debug                # Override a value from 'monitoring'
```

## 🛠️ The "Inheritance" Visualization
- When you use the merge key, think of it as a "Base Class" in programming. The template (Anchor) provides the default behavior, while the Alias + Merge Key allows for "sub-classing" or specialization.

**🧠 The Mnemonic Map: A.C.E.**
- To remember how to handle YAML inheritance without errors, use the A.C.E. acronym:

| Letter | Concept   | Mnemonic              | DevOps Action                                                  |
|--------|-----------|------------------------|----------------------------------------------------------------|
| A      | Anchor (&) | "Anchor = Attach"      | Stick a label on your "Base Class" or template.                |
| C      | Conflict   | "Direct beats Merge"   | Any key you write explicitly wins over an inherited one.       |
| E      | Entirety   | "Deep is Dead"         | Merging replaces entire nested maps; it doesn't mix them.      |


#### 🚀 Inheritance Demo: Overriding vs. Retaining
- This example demonstrates how to "re-skin" a template while keeping the core logic intact.

```yaml
# 1. THE ANCHOR (The Template)
.task_template: &task_base
  type: shell
  retry_limit: 5
  timeout: 60
  env:
    REGION: us-east-1
    DEBUG: "false"

# 2. THE ALIAS + OVERRIDE
# "Direct beats Merge" -> We keep everything except the 'timeout'
cleanup_job:
  <<: *task_base      # Inherits type, retry_limit, env
  timeout: 10         # OVERRIDE: Direct value wins

# 3. THE NESTED "GOTCHA" (The Entirety Rule)
# We want to change ONLY the REGION...
deploy_job:
  <<: *task_base
  env:                # OVERRIDE: This replaces the WHOLE 'env' map
    REGION: eu-west-1 
    # ⚠️ ERROR: DEBUG is now missing! 
    # You must redefine DEBUG here if you want to keep it.
```