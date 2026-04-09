# 🧩 REGEX — Practical Quick Reference (DevOps Edition)

“Regex is a precision instrument — powerful, unforgiving, and indispensable.”

This guide focuses on **core patterns**, **professional mnemonics**, and **DevOps‑relevant examples** that make regex easier to recall and apply.

---

# 🔑 Why Regex Matters in DevOps

Regex is everywhere:
- Log parsing  
- CI/CD validation  
- Kubernetes label/annotation validation  
- API payload filtering  
- Security scanning  
- Data extraction in pipelines  
- Grep, sed, awk, jq, kubectl, Git hooks  

Regex mastery = faster debugging + cleaner automation.

---

# 🧠 Regex Fundamentals (Optimized for Memorization)

## Literal Characters
Most characters match themselves.

Mnemonic: Literal = “Say What You Mean”

---

# 🧱 Character Classes

[] = Match ONE character from a set.

Examples:
[abc]  
[0-9]  
[a-zA-Z]

Mnemonic: Brackets = “Box of Choices”

Additional Cue:
- A character class always matches exactly one character.

---

## Negated Character Class

[^abc] = Match anything *except* a, b, or c.

Mnemonic: ^ at start = “Not These”

---

## Predefined Classes

\d = digit  
\D = non-digit  
\w = word char (letters, digits, underscore)  
\W = non-word char  
\s = whitespace  
\S = non-whitespace  
. = any character except newline

Mnemonic:  
- d = digit  
- w = word  
- s = space  
- uppercase = opposite  

Additional Cue: Dot = “Wildcard One”

---

# 🔢 Quantifiers

Quantifiers control *how many* characters to match.

* = 0 or more  
+ = 1 or more  
? = 0 or 1  
{n} = exactly n  
{n,} = n or more  
{n,m} = between n and m

Mnemonic:  
* = “Star = Zero or More”  
+ = “Plus = At Least One”  
? = “Question = Optional”  
{} = “Curly = Count It”

Additional Cue:
- * and + are greedy by default.

---

# 🧲 Greedy vs Lazy

Greedy: .*  
Lazy: .*?

Greedy = “Take Everything First”  
Lazy = “Take Only What You Must”

Mnemonic: ? = “Be Minimal”

---

# 🧩 Anchors

^ = start of string  
$ = end of string  
\b = word boundary  
\B = non-boundary

Mnemonic:  
^ = “Beginning of Line”  
$ = “End of Line”  
b = “Border of a Word”

Additional Cue:
- Anchors match positions, not characters.

---

# 🧱 Grouping & Capturing

( ) = capture group  
(?: ) = non-capturing group  
(?= ) = positive lookahead  
(?! ) = negative lookahead  
(?<= ) = positive lookbehind  
(?<! ) = negative lookbehind

Mnemonic:  
( ) = “Remember This”  
(?: ) = “Group Without Memory”  
?= = “Must Be Followed By”  
?! = “Must NOT Be Followed By”  
?<= = “Must Be Preceded By”  
?<! = “Must NOT Be Preceded By”

Additional Cue:
- Lookaheads look forward; lookbehinds look backward.

---

# 🧩 Alternation

a|b = match a OR b

Mnemonic: | = “Pipe of Possibilities”

---

# 🚀 DevOps‑Relevant Regex Patterns

## 1. Validate IPv4 Address
^([0-9]{1,3}\.){3}[0-9]{1,3}$

Mnemonic: “Three Dots, Four Blocks”

---

## 2. Extract Image Tag (e.g., nginx:1.25)
^[^:]+:(.+)$

Mnemonic: “Everything until colon, then capture tag”

---

## 3. Validate Semantic Version
^[0-9]+\.[0-9]+\.[0-9]+$

Mnemonic: “Major.Minor.Patch”

---

## 4. Kubernetes Label Key
^[a-z0-9]([-a-z0-9]*[a-z0-9])?$

Mnemonic: “DNS‑like: lowercase, digits, hyphens”

---

## 5. Email (practical version)
^[^@\s]+@[^@\s]+\.[^@\s]+$

Mnemonic: “No spaces, one @, one dot”

---

## 6. Extract Pod Name Prefix
^([a-z0-9-]+)-[a-z0-9]{5}$

Mnemonic: “Prefix + 5‑char hash”

---

## 7. Find Error Lines in Logs
error|fail|fatal|panic

Mnemonic: “Common failure keywords”

---

## 8. Match ISO Timestamp
^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}

Mnemonic: “YYYY-MM-DDTHH:MM:SS”

---

# 🛠️ Practical DevOps Use Cases

## Grep pods with CrashLoopBackOff
kubectl get pods --all-namespaces | grep -E 'CrashLoopBackOff'

Mnemonic: E = “Extended Expressions”

---

## Extract image names from YAML
grep -Eo 'image:.*' deployment.yaml

Mnemonic: o = “Only the Match”

---

## Validate commit message format
grep -Eq '^(feat|fix|docs|chore|refactor): .+'

Mnemonic: “Conventional Commits Pattern”

---

## Filter logs for timestamps + errors
grep -E '^\d{4}-\d{2}-\d{2}.*(error|fail|fatal)'

Mnemonic: “Timestamp + Failure Keywords”

---

# 🎯 Regex Tips & Memorization Cues

1. Learn shapes:
* looks like a burst → “many”
+ looks like a plus → “add at least one”
? looks like a hook → “maybe”
[] looks like a box → “choices”
() looks like a container → “capture this”

---

2. Learn opposites:
\d vs \D  
\w vs \W  
\s vs \S  

Mnemonic: uppercase = opposite

---

3. Learn the “Core Five”:
.  
*  
+  
?  
[]

Mnemonic: “Dot, Star, Plus, Question, Box”

---

4. Learn anchor pair:
^ start  
$ end  

Mnemonic: “Roof and Floor”

---

5. Learn the “Lookaround Compass”:
?= look ahead  
?! look ahead not  
?<= look behind  
?<! look behind not  

Mnemonic: “= means must, ! means must not”

---

6. Build patterns incrementally:
Start literal → add classes → add quantifiers → add anchors → add groups → add lookarounds

Mnemonic: “L → C → Q → A → G → Lk”

---

# 🧩 Regex Cheat Sheet (DevOps‑Focused)

Concept | Pattern | Mnemonic
------- | -------- | --------
Digit | \d | d = digit
Word char | \w | w = word
Whitespace | \s | s = space
Any char | . | wildcard one
Zero or more | * | star = many
One or more | + | plus = at least one
Optional | ? | maybe
Start anchor | ^ | roof
End anchor | $ | floor
Capture group | ( ) | remember this
Alternation | a|b | pipe of possibilities
Lookahead | (?= ) | must be followed
Negative lookahead | (?! ) | must not be followed

---

# 🧩 Final Mnemonic Map: C.A.S.Q.L.

Letter | Meaning | Mnemonic | Action
------ | -------- | -------- | -------
C | Character Classes | Box of Choices | Select allowed chars
A | Anchors | Roof & Floor | Define boundaries
S | Special Symbols | Dot, Star, Plus | Control matching
Q | Quantifiers | Count It | Control repetition
L | Lookarounds | Must / Must Not | Context‑aware matching
