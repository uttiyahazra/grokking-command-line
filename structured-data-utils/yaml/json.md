# 🧩 JSON — Quick Reference (DevOps Edition)

> *"If YAML is the language of configuration, JSON is the language of the API. It is the strict, predictable foundation of modern web communication."*

---

## 🔑 Fundamentals

### Basic Syntax
- **Braces** → `{ }` wrap Objects (Maps).
- **Brackets** → `[ ]` wrap Arrays (Lists).
- **Strict Quoting** → All keys AND string values **must** use double quotes (`" "`).
- **No Trailing Commas** → The last item in a list or object must NOT have a comma.

```json
{
  "app": "myservice",
  "port": 8080,
  "active": true,
  "tags": ["web", "prod"]
}
```

- `⚠️ Critical Nuance`: JSON does not support comments (# or //). Adding them will break most parsers.

## 📚 Core Structures & Mnemonics

**🗂️ Object (Map/Dictionary)**
- `Mnemonic`: "Braces = Base" → { } defines the object structure.

- `Fingerprint`: Key-value pairs separated by colons.

**📋 Array (List)**
- `Mnemonic`: "Brackets = Box" → [ ] acts as a box holding ordered items.

- `Fingerprint`: Values separated by commas inside brackets.

**🔗 Array of Objects**
- `Mnemonic`: "Box of Braces".

- `Usage`: Standard for API responses and cloud logging (e.g., AWS CloudWatch).

```json
"users": [
  { "name": "Alice", "role": "admin" },
  { "name": "Bob", "role": "developer" }
]
```

## 🔢 Data Types & Casting
JSON is strictly typed. Unlike YAML, it does not have "tags" (like !!str), so formatting is vital.

- `Strings`: Must be "double quoted".

- `Numbers`: Integers or Floats (no quotes).

- `Booleans`: true / false (lowercase, no quotes).

= `Null`: null (representing empty/none).

| Feature        | JSON                     | YAML                          | Comments                                |
|----------------|--------------------------|-------------------------------|-----------------------------------------|
|  Comments      | ❌ Not supported         | ✅ Supported (#)               | Comments supported in YAML only          |
| Quotes         | ✅ Mandatory (" ")        | ⚠️ Optional (mostly)           | YAML allows unquoted strings             |
| Whitespace     | ℹ️ For humans only        | ⚠️ Functional (semantic)       | Indentation is structural in YAML        |
| Trailing Comma | ❌ Errors out             | ✅ Allowed                     | YAML tolerates trailing commas           |
| Complexity     | 🟢 Simple / Rigid         | 🟡 Advanced (Anchors/Merge)    | YAML supports anchors, aliases, merges   |

## 🚀 DevOps Use Cases

**Cloud Infrastructure (AWS IAM)**
- AWS Policies are strictly JSON. A single missing comma or double-quote will cause a "Malformed Policy" error.

```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": "s3:ListBucket",
    "Resource": "*"
  }]
}
```

**API Response Handling (Kubernetes API)**
- When you query the Kubernetes API with `kubectl get pods -o json`, you receive a deeply nested JSON object.

  - `Nesting`: Notice how `metadata` is an object inside the main object.

  - `Lists`: `containers` is an array because a Pod can have more than one.

```json
{
  "kind": "Pod",
  "metadata": {
    "name": "nginx-pod",
    "namespace": "default"
  },
  "spec": {
    "containers": [
      {
        "name": "nginx",
        "image": "nginx:1.14.2",
        "ports": [{ "containerPort": 80 }]
      }
    ]
  }
}
```

**CI/CD Context (GitHub Actions)**
- GitHub Actions stores workflow data in a JSON object called the `github` context.

```json
{
  "event_name": "push",
  "repository": "octocat/hello-world",
  "actor": "octocat",
  "workflow": "CI Pipeline"
}
```

**Terraform State**
- Terraform `.tfstate` files are JSON. Never edit these manually unless you are a "JSON Ninja," as the structure is highly sensitive.

## 🧠 Nuances to Remember
- **The Quote Trap** → 'single quotes' are invalid in JSON. Use "double quotes".

- **The Comma Trap** → A comma after the final element in an array/object is the #1 cause of JSON parsing errors in CI/CD pipelines.

- **The "Truth"** → JSON only recognizes true and false. Yes, No, On, and Off are just strings.

- **Validation** → Always lint before sending to an API:

   - `jq . file.json` (The gold standard for JSON processing)

   - `python -m json.tool file.json`

| Symbol | Mnemonic          | Purpose                                      |
|--------|-------------------|----------------------------------------------|
| { }    | Braces = Base     | Defines an Object                            |
| [ ]    | Brackets = Box    | Defines an Array                             |
| "      | Double = Data     | Strings and Keys must use double quotes      |
| :      | Colon = Connect   | Connects Key to Value                        |
| ,      | Comma = Continue  | Separates elements (but don't end with one!) |
