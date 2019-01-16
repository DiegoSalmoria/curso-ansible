#! /bin/bash
for usuarios in $(getent passwd | awk -F: ' $3 >= 1000 {print $1}' | grep -v nobody); do
  maildirmake /home/$usuarios/maildir
  maildirmake /home/$usuarios/maildir/.Enviados
  maildirmake /home/$usuarios/maildir/.Rascunhos
  maildirmake /home/$usuarios/maildir/.Lixeira
  maildirmake /home/$usuarios/maildir/.Spam
  chow -R $usuarios:$usuarios /home/$usuarios
done
