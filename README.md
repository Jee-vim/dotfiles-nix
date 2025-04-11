## Preview
![Termina](./screenshots/terminal.png)
![browser](./screenshots/browser.png)
![wofi](./screenshots/wofi.png)
![telegram](./screenshots/telegram.png)
![swaync](./screenshots/swaync.png)

### Build
`home-manager switch --flake .#username`
ex: `home-manager switch --flake .#jee`  

### Troubleshoot
if u add a package then u type `home-manager switch --flake .#username` and it didint install the app or file doesnt exist when u added a new file
- try adding the file to Git ex: `git add file1` then build again
since im using flake, nix only see files commited to Git
