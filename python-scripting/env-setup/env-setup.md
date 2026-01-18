# 🐍 Python Environment Setup — Installation, Configuration & Best Practices

> *"A reliable environment is the foundation of reproducible automation."*

---

## 📦 Installing Python

- **System Package Managers**
  - **Debian/Ubuntu:**
    ```bash
    sudo apt update
    sudo apt install python3 python3-pip
    ```
  - **CentOS/RHEL:**
    ```bash
    sudo yum install python3 python3-pip
    ```
  - **macOS (Homebrew):**
    ```bash
    brew install python3
    ```

- **Version Managers**
  - Use `pyenv` to manage and switch between multiple Python versions seamlessly:
    ```bash
    curl [https://pyenv.run](https://pyenv.run) | bash
    pyenv install 3.12.1
    pyenv global 3.12.1
    ```


---

## 🌍 Environment Variables

- **PATH**
  - Ensure Python and pip binaries are in your executable search path:
    ```bash
    export PATH="$HOME/.local/bin:$PATH"
    ```

- **PYTHONPATH**
  - Use this to extend the module search path for custom libraries:
    ```bash
    export PYTHONPATH="/opt/mylibs:$PYTHONPATH"
    ```

- **Virtual Environment Activation**
  - Activating a `venv` automatically modifies your `PATH` to prioritize the environment’s localized executables.

---

## 🧰 Virtual Environments

- **Lifecycle Commands**
  ```bash
  # Creation
  python3 -m venv venv

  # Activation
  source venv/bin/activate

  # Deactivation
  deactivate
  ```

- **Best Practices**
  - **Isolation:** Maintain one virtual environment per project.
  - **Exclusion:** Never commit the `venv/` directory to version control (add to `.gitignore`).

---

## 📑 Dependency Management

- **Requirements Files**
  - Generate and install from standard dependency lists:
    ```bash
    pip freeze > requirements.txt      # Record current state
    pip install -r requirements.txt    # Replicate environment
    ```

- **Pinning Versions**
  - Ensure reproducibility by locking specific versions:
    ```text
    requests==2.31.0
    flask==3.0.0
    ```

- **Modern Tooling**
  - For advanced dependency resolution and lockfiles, consider **Poetry**, **Pipenv**, or **pip-tools**.


---

## ⚙️ Configuration Files

- **Secrets & Environment Variables**
  - Store sensitive data in `.env` files (and ignore them in Git):
    ```text
    DB_USER=admin
    DB_PASS=secret
    ```
  - Load into your script using `python-dotenv`:
    ```python
    from dotenv import load_dotenv
    import os

    load_dotenv()
    db_user = os.getenv("DB_USER")
    ```

- **Structured Config**
  - Use **YAML** or **JSON** for non-sensitive, structured pipeline settings.

---

## 🧠 Good Setup Practices

- **Isolation:** Always use virtual environments or Docker containers to prevent "dependency hell."
- **Portability:** Use `#!/usr/bin/env python3` in scripts for cross-platform interpreter discovery.
- **Security:** - Never commit `.env` files or secrets to Git.
  - Integrate with Secret Managers (HashiCorp Vault, AWS Secrets Manager) for production.
- **Automation:** - Automate setup in CI/CD pipelines (e.g., GitHub Actions):
    ```yaml
    - name: Set up Python
      uses: actions/setup-python@v5
      with:
        python-version: '3.12'
    - name: Install dependencies
      run: pip install -r requirements.txt
    ```

---

## 🔍 Verification Checklist

- [ ] Python installed and accessible (`python3 --version`)
- [ ] pip installed (`pip --version`)
- [ ] Virtual environment created and activated
- [ ] Dependencies pinned in `requirements.txt`
- [ ] Config files (`.env`, YAML/JSON) loaded securely
- [ ] CI/CD pipeline validates environment setup
- [ ] Environment verified with `python3 -m unittest discover`
