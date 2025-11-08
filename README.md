# 🪣 gdrive-mount

Um script Bash simples para configurar, montar e abrir o **Google Drive** usando o **rclone** em qualquer distribuição Linux.

---

## ⚙️ Funções

- Verifica se o **rclone** está instalado (e mostra como instalar se não estiver)  
- Configura o **Google Drive** automaticamente via navegador  
- Cria uma pasta local para montagem  
- Monta o Google Drive nessa pasta  
- Abre o gerenciador de arquivos padrão na pasta montada  
- Compatível com a maioria das distribuições Linux  

---

## 🧩 Pré-requisitos

Antes de usar o script, certifique-se de ter:

- **rclone** instalado  
- **fusermount** (ou `fusermount3`, usado para desmontar)  
- **xdg-open** (para abrir o navegador e o gerenciador de arquivos padrão)

---

## 💿 Instalação

Clone o repositório e entre na pasta:

```bash
git clone https://github.com/sshs3rejo/gdrive-mount.git
cd gdrive-mount
chmod +x gdrive-mount.sh