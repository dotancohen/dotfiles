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

Use the following commands to download the dotfiles and to move them to their proper location:

### Ubuntu Server
	wget http://github.com/dotancohen/dotfiles/archive/master.tar.gz
	tar -xzf master.tar.gz
	cd dotfiles-master/
    cp -R .[!(|.|.git)]* ~


### CentOS
	wget http://github.com/dotancohen/dotfiles/archive/master.tar.gz
	tar -xzf master.tar.gz
	cd dotfiles-master/
    cp .bash_profile ~
    cp .bashrc ~
    cp -r .bin ~
    cp .colordiffrc ~
    cp -r .config ~
    cp .tmux.conf ~
    cp -r .vim ~
    cp .vimrc ~



BONUS - INSTALL FAVORITE PACKAGES
---------------------------------

### Ubuntu Server
    sudo apt-get install tmux vim git nmap w3m tree aptitude exuberant-ctags ncdu
	sudo update-alternatives --config editor


### CentOS
	yum install vim-enhanced git-core nmap w3m tree ctags ncdu
	wget http://pkgs.repoforge.org/tmux/tmux-1.6-1.el6.rf.x86_64.rpm

	Or download the latest tmux from: http://pkgs.repoforge.org/tmux/



DOUBLE BONUS - INSTALL TYPICAL SERVER PACKAGES
----------------------------------------------

### Ubuntu Server
    sudo aptitude install zip unzip ruby openssl libopenssl-ruby curl apache2 php5 php5-curl libapache2-mod-php5 mysql-server libapache2-mod-auth-mysql php5-mysql openjdk-6-jdk gnuplot-nox python-gnuplot ntp php5-xdebug screen colordiff sysstat build-essential
	sudo aptitude install ec2-api-tools ec2-ami-tools

#### Install PHP OAuth support
	sudo pecl install oauth
	sudo vim /etc/php5/conf.d/oauth.ini
		extension=oauth.so


### CentOS
	(incomplete)
