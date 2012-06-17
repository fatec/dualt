Dualt - en utilisant comme point de départ http://railsapps.github.com/tutorial-rails-bootstrap-devise-cancan.html
-------------

Application pour le projet DualT


Pour installer sur un nouvel ordi:

git clone git@github.com:fatec/dualt-rails-bootstrap-devise-cancan.git

bundle install

cd dualt-rails-bootstrap-devise-cancan/
rake db:migrate
rake db:seed

Pour envoyer des mails depuis gmail.. et ne pas laisser le mot de passe sur github dans mon ~/.profile je rajoute cela
(ou alors modifier dans config.acion_mailer)
export GMAIL_USERNAME="mon_mail@gmail.com"
export GMAIL_PASSWORD="mon_mot_de_passe"

- verifier s'il faut faire qquchose pour le bootstrap twitter? Je pense pas.. :D