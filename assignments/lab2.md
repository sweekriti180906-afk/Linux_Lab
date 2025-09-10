---

## ✅ Example Scripts in `Scripts/`

Let’s assume you have the following two simple scripts in the `Scripts/` directory:

---

### 📄 `print_numbers.sh`

```bash
#!/bin/bash
# Print numbers from 1 to 5

for i in {1..5}
do
  echo "Number: $i"
done
```

---

### 📄 `array_loop.sh`

```bash
#!/bin/bash
# Loop through an array of fruits

fruits=("apple" "banana" "cherry")

for fruit in "${fruits[@]}"
do
  echo "I like $fruit"
done
```

---

## 📘 `LAB2.md`

````markdown
# LAB2.md

## 1. Script: `print_numbers.sh`

### Purpose:
Prints numbers from 1 to 5 using a loop.

### Line-by-Line Explanation:
```bash
#!/bin/bash               # Specifies the script should run in the Bash shell
# Print numbers from 1 to 5

for i in {1..5}           # Loop variable i takes values from 1 to 5
do
  echo "Number: $i"       # Prints the current number
done
````

### Example Run:

```bash
$ ./print_numbers.sh
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

---

## 2. Script: `array_loop.sh`

### Purpose:

Iterates through an array of fruit names and prints a message for each one.

### Line-by-Line Explanation:

```bash
#!/bin/bash                            # Specifies the script should run in the Bash shell
# Loop through an array of fruits

fruits=("apple" "banana" "cherry")    # Declares an array named 'fruits'

for fruit in "${fruits[@]}"           # Loops through each element in the array
do
  echo "I like $fruit"                # Prints a message with the current fruit
done
```

### Example Run:

```bash
$ ./array_loop.sh
I like apple
I like banana
I like cherry
```

---

## Extra Questions

### Q1: What is the purpose of `#!/bin/bash` at the top of a script?

This is called a **shebang**. It tells the operating system to use the **Bash shell** to execute the script. Without it, the script might run with a different shell (like `sh`), which could cause unexpected behavior if the syntax isn't compatible.

---

### Q2: How do you make a script executable?

Use the `chmod` command to change the file's permissions. For example:

```bash
chmod +x scriptname.sh
```

This allows the script to be run like:

```bash
./scriptname.sh
```

---