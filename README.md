dotfiles
========

My dotfiles - Unix hidden files usually used for configuration.



TODO
----

1. Go over `env.tgz` file and add all files from there.
2. Configure `.bash-secrets` file to be included, for password aliases, that will not be added here.
3. Sort out what goes in `.bashrc` and `.bash_profile`.



INSTALL
-------

Use the following command to move the dotfiles to their proper location:

    mv .[!(|.|.git)]* ~



BONUS - INSTALL FAVORITE PACKAGES
---------------------------------

    sudo apt-get install tmux vim git nmap w3m tree aptitude exuberant-ctags



DOUBLE BONUS - INSTALL TYPICAL UBUNTU SERVER PACKAGES
-----------------------------------------------------

    sudo aptitude install vim zip unzip ruby openssl libopenssl-ruby curl apache2 php5 libapache2-mod-php5 mysql-server libapache2-mod-auth-mysql php5-mysql openjdk-6-jdk ec2-api-tools ec2-ami-tools gnuplot-nox python-gnuplot ntp exuberant-ctags php5-xdebug screen tmux tree git
