# Linux Commands

---

## Linux

### `cat`

### `curl`

### `find`

#### Find file starting from root folder

```bash
sudo find / -name "file_here.example"
```

### `grep`

### `grub`

#### Modify the Grub bootloader config using the following command

```bash
sudo nano /etc/default/grub
```

#### Update Grub to use the new config

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### `lsof`

#### Listen and display what is using port 3000

```bash
lsof -nP -iTCP:3000 -sTCP:LISTEN
```

### `npm`

#### Build & link NPM package locally

```bash
npm run build; // or whatever build command the project uses
npm link;
```

### `pacman` / `yay`

#### Update packages

```bash
sudo pacman -Syu
```

#### Clean package cache

```bash
sudo pacman -Sc
```

```bash
yay -Sc
```

### `wget`

#### Download all of file type from URL

```bash
# Change file types and URL when running this command!
wget -r -A jpg,png https://www.github.com
```

---

## Exports I Use (usually in `.zshenv` file)

**These change based on path on your machine. Just general idea is written down here.**

```bash
# Ensure pipenv creates virtual environment within project

export PIPENV_VENV_IN_PROJECT=1
```

```bash
# Ruby Gems

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
```

```bash
# Chrome executable (idr what this is for)
export CHROME_EXECUTABLE=/usr/bin/chromium
```

```bash
# Android SDK
export ANDROID_SDK_ROOT=~/Android/Sdk
```

```bash
# Android Debug Bridge
export PATH="~/Android/Sdk/platform-tools:$PATH" 
```

**Remember to `source .zshenv`after updating `.zshenv`**
