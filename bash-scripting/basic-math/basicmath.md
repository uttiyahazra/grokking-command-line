# ➗ Bash Math Expressions — Quick Reference
> "Math powers automation: Bash lets you calculate directly inside scripts without external tools."

## 🔑 Basic Syntax
```bash
# Arithmetic expansion
RESULT=$(( expression ))

# Using expr (older style)
RESULT=$(expr 5 + 3)
```

- `$(( ))` → Modern, preferred arithmetic expansion.

- `expr` → Legacy command, requires spaces around operators.

-  Supported operators: `+ - * / %` (addition, subtraction, multiplication, division, modulus).

## 🧮 Simple Calculations

```bash
x=10
y=3

sum=$(( x + y ))
diff=$(( x - y ))
prod=$(( x * y ))
quot=$(( x / y ))
mod=$(( x % y ))

echo "Sum: $sum"
echo "Difference: $diff"
echo "Product: $prod"
echo "Quotient: $quot"
echo "Remainder: $mod"
```
## 📂 Increment and Decrement

```bash
count=5
((count++))   # increment
((count--))   # decrement
echo "Count: $count"
```

## 🔗 Conditional Math in Scripts

```bash
cpu_load=75

if (( cpu_load > 80 )); then
    echo "High CPU load! Scale up servers."
else
    echo "CPU load is normal."
fi
```

## 🧠 Critical Nuances
**Integer only**  
- Bash arithmetic is integer‑based. For floating point, use bc or awk.

**Quoting discipline**  
- No quotes needed inside $(( )).

**Division by zero**  
- Will cause an error — always validate before dividing.

## 🎯 Mnemonics
- `$(( ))`  → "Double parentheses = do the math."

- `+ - * / %` → Standard operators.

- `((var++))` → "Increment in place."

## 🛠️ Demo Snippets

#### Calculate Disk Usage Threshold

```bash
disk_used=70
disk_limit=80

if (( disk_used > disk_limit )); then
    echo "Alert: Disk usage exceeded threshold!"
else
    echo "Disk usage within safe limits."
fi
```

#### Batch Processing with Modulus

```bash
tasks=10
batch_size=3

remainder=$(( tasks % batch_size ))
echo "Tasks left after full batches: $remainder"
```

#### Floating point with bc

```bash
cpu=7.5
mem=2.3

# bc handles decimals
result=$(echo "$cpu + $mem" | bc)
echo "Total resources: $result"
```