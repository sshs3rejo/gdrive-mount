# ☁️ gdrive-mount

Monte facilmente o **Google Drive** no Linux usando o **rclone**.  
Este script automatiza a configuração e montagem do seu Drive em uma pasta local, de forma simples e intuitiva.

---

## ⚙️ Funções

- Verifica se o **rclone** está instalado e orienta o usuário a instalá-lo se necessário  
- Configura o **Google Drive** via navegador padrão  
- Cria a pasta de montagem automaticamente (`~/GDrive`)  
- Monta o Drive nessa pasta  
- Abre o gerenciador de arquivos padrão diretamente na pasta montada  
- Funciona em qualquer distribuição Linux

---

## 🧰 Requisitos

- Uma conta Google  
- Conexão com a internet  
- O pacote `rclone` instalado (necessário para montar o Google Drive)

---

## 💿 Instalação e Uso

```bash
git clone https://github.com/sshs3rejo/gdrive-mount.git
cd gdrive-mount
chmod +x gdrive-mount.sh
./gdrive-mount.sh
