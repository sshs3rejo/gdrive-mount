# ☁️ gdrive-mount

<p align="center">
  <img src="https://raw.githubusercontent.com/sshs3rejo/gdrive-mount/main/logo.svg" width="120" alt="gdrive-mount Logo"/>
</p>

Monte facilmente o **Google Drive** no Linux ou Termux usando o **rclone**.  
Este script automatiza a configuração e montagem do seu Drive em uma pasta local, de forma simples e intuitiva.

---

## ⚙️ Funções

- Verifica se o **rclone** está instalado e orienta o usuário a instalá-lo se necessário  
- Configura o **Google Drive** via navegador padrão  
- Cria a pasta de montagem automaticamente (`~/GoogleDrive`)  
- Monta o Drive nessa pasta  
- Abre o gerenciador de arquivos padrão diretamente na pasta montada  
- Funciona em qualquer distribuição Linux e também no Termux (Android)

---

## 🧰 Requisitos

- Uma conta Google  
- Conexão com a internet  
- O pacote `rclone` instalado (necessário para montar o Google Drive)

---

## 💿 Instalação

Clone o repositório e dê permissão de execução:

```bash
git clone https://github.com/sshs3rejo/gdrive-mount.git
cd gdrive-mount
chmod +x gdrive-mount.sh

Para desmontar o Google Drive e liberar o ponto de montagem:
fusermount -u ~/GoogleDrive

No Termux (Android):
termux-umount ~/GoogleDrive
