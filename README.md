## Cool Compiler

Developer environment for the self-paced version of Stanford's undergraduate course on Compilers (cs164).

### Build

```bash
docker build -t maxfire/cool-compiler .
```

### Usage

```bash
docker run -it --rm --name cool-compiler -v //c/Dev/Compilers:/src maxfire/cool-compiler
```

or

```powershell
.\run.ps1
```
