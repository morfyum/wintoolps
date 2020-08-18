# wintoolps
Tools for Windows 10. Easy way to automation activation Windows 10 for FREE without install additional software.

## MAGYAR
### HOW IT WORKS
Mivel a Windows powershell ExecutionPolicy alapértelmezés szerint "Restricted", így a .ps1 fájlok végrehajátsa nem lehetséges.
A használatához, először át kell állítanod az `ExecutionPolicy`-t "Unrestricted"-re. Majd, ha végeztél a művelettel,
érdemes ezt visszakapcsolni az eredeti "Restricted" állapotba, hogy megelőzt a rosszindulatú kódok futtatását.
A `menu.bat` ezen folyamat könnyebbé tételére szolgál.

A parancssori eszköz
```
menu.bat
```
Lehetőséget kínál az "ExecutionPolicy" "Unrestricted", illetve "Restricted" módja közötti váltásra.
Lehetőséget nyújt a `features` könyvtárban található scriptek futtatására.

### Indítsd el a `menu.bat` fájlt. (Dupla klikk)
A menu.bat az alábbi sorokkal fogad:
```
========== ==========
       CMD MENU
========== ==========
STATUS: Restricted                 # Kijelzi az ExecutionPolicy aktuális státuszát

0 - EXIT			       # Kilépés a programból
1 - Enable Execute Scripts		# Kódvégrehajtás engedéjezése
2 - Disable to Execute Scripts     # Végrehajtás tíltása (biztonságos mód)
3 - Activator                      # Alkalmazás indítása
```

#### LÉPÉSEK
 - Nyomd meg az 1-es gombot, hogy engedélyezt a végrehajtást.
 - Nyomd meg a 3-as gombot, hogy elindítsd az alkalmazást.
 - Nyomd meg a 2-es gombot, hogy visszaállítsd a végrehajátési Policy-t.
 - Nyomd meg a 0-s gombot, hogy kilépj a `menu.bat`-ból.

## ENGLISH
### HOW IT WORKS
Because windows powershell execution default policy is "Restricted", first of all you need to set ExecutionPolicy to "Unrestricted".
After you finished your work, put back this policy to "Restricted", for prevent malicious code executin.


My commandline tool
```
 - .bat
```
is give an option to set ExecutionPolicy to "Unrestricted", and after you finish, you can fall back to safe Policy.

### Launch `menu.bat`
menu.bat welcome with below lines:
```
========== ==========
       CMD MENU
========== ==========
STATUS: Restricted                 # Shpw actual status of ExecutionPolicy

0 - EXIT				# Exit from menu.bat
1 - Enable Execute Scripts	       # Enable Execute Scripts (Unrestricted)
2 - Disable to Execute Scripts     # Disable Execute Unrestricted (Restricted)
3 - Activator                      # Launch application
```
#### STEPS:
 - Press 1 to Enable Execution
 - Press 3 to Launch application
 - Press 2 to Disable Execution
 - Press 0 to Exit `menu.bat`