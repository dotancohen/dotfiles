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
	cp -r .cmus ~
	cp .colordiffrc ~
	cp -r .config ~
	cp .editrc ~
	cp .git-completion.bash ~
	cp .tmux.conf ~
	cp -r .vim ~
	cp .vimrc ~



BONUS - INSTALL FAVORITE PACKAGES
---------------------------------

### Ubuntu Server
	sudo apt-get install tmux vim git nmap w3m tree aptitude zip unzip exuberant-ctags ncdu colordiff ack-grep caca-utils aalib1 aview curl python-pip
	sudo pip install awscli
	sudo update-alternatives --config editor
	sudo locale-gen en_DK.utf8

	Note that either 'aalib1' or 'aview' will fail to install, the name has changed between versions.

#### Install pip for Python 3 on Ubuntu >= 12.10
	sudo apt-get install python3-pip

#### Install pip for Python 3 on Ubuntu 12.04 LTS
	sudo apt-get install python3-dev
	curl http://python-distribute.org/distribute_setup.py | sudo python3
	curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python3
	From: http://stackoverflow.com/a/13001357/343302


### CentOS
	yum install vim-enhanced git-core nmap w3m tree ctags ncdu colordiff caca-utils
	wget http://pkgs.repoforge.org/tmux/tmux-1.6-1.el6.rf.x86_64.rpm

	Or download the latest tmux from: http://pkgs.repoforge.org/tmux/



DOUBLE BONUS - INSTALL TYPICAL SERVER PACKAGES
----------------------------------------------

### Ubuntu Server
	sudo aptitude install ruby openssl libopenssl-ruby curl zip unzip vim tmux git ncdu ack-grep apache2 php5 php5-curl libapache2-mod-php5 mysql-server libapache2-mod-auth-mysql php5-mysql openjdk-6-jdk gnuplot-nox python-gnuplot ntp php5-xdebug sysstat build-essential php5-json
	sudo aptitude install ec2-api-tools ec2-ami-tools
	sudo pear install mail Net_SMTP

	Note that php5-json will fail to install in older Ubuntu versions which did not need this package.

#### Configure server
	sudo vim /etc/hostname
	sudo vim /etc/hosts
	sudo chown -R ubuntu:ubuntu /var/www
	mkdir -p /var/www/default/public_html
	mv /var/www/html/index.html /var/www/default/public_html (Ubuntu >=14.04)
	mv /var/www/index.html /var/www/default/public_html (Ubuntu <14.04)
	sudo vim /etc/apache2/sites-available/default
	sudo a2enmod ssl
	sudo service apache2 restart

#### Install PHP OAuth and crypto support
	sudo aptitude install php5-mcrypt liboauth-php php-pear php5-dev libpcre3-dev php-crypt-blowfish 
	sudo pecl install oauth
	sudo vim /etc/php5/conf.d/oauth.ini
		extension=oauth.so


### CentOS
	(incomplete)
