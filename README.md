# Разработка скриптов на Bash и Python для автоматизации работы
<ul>
    <li>
        Установка программ через скрипт
    </li>
    <li>
        Восстановление флешек
    </li>
    <li>
        Резкое переполнение базы в Firebird
    </li>
    <li>
        Обработка и сортировка тегов на сайте организации
    </li>
    <li>
        Разработка программы "Менеджер паролей"
    </li>
    <li>Развернуть виртуальный сервер.</li>
    <li>Добавить сетевые папки.</li>
    <li>Создать интерфейса сетевого моста.</li>
    <li>Установить сервер Postgresql.</li>
    <li>Настроить удаленный доступ к серверу.</li>
    <li>Настроить Pgadmin.</li>
    <li>Создать таблицы: В первой - отметим в каких зданиях находятся кабинеты, Вторая - отвечает за названия оборудований, Третья - отвечает за инвентарные номера оборудований, кабинетов и даты изменения.</li>
    <li>Вывести таблицу, где в первом столбце будет инвентарные номера, во втором столбце, устройство и его название, а в третьем столбце вывести кабинеты, где находятся те самые оборудования.</li>
    <li>Удалить лишнее оборудование в кабинете.</li>
    <li>Добавить новое обрудование в таблицу.</li>
</ul>
<p>
    <strong>Task:</strong><br>
    В компьютерном классе по 20 компьютеров и в каждом надо было установить Microsoft Office. Для этого я написал скрипты инсталлятор и конфигуратор, которые позволяют мне выбрать дистрибутив, в котором я установливаю, саму программу для установки и настройки (не только офис)<br>
    <strong>Decision:</strong><br>
    $ vim Linux-Installer.sh<br>
    $ cat Linux-Installer.sh<br>
    #!/bin/bash<br>
    checkcmd(){<br>
    if [ $? -eq 0 ]; then<br>
    &nbsp;&nbsp; &nbsp;echo ! The command was executed successfully<br>
    else<br>
    &nbsp;&nbsp; &nbsp;echo ! The command was executed with an error<br>
    fi<br>
    }&nbsp;<br>
    #echo YOUR-PASSWORD | sudo -S sudo dnf update<br>
    #checkcmd<br>
    # https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script<br>
    while true; do<br>
    &nbsp;&nbsp; &nbsp;read -p "Do you want to install the program? (y/n) " yn<br>
    &nbsp;&nbsp; &nbsp;case $yn in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;[Yy]* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choicedistr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choicedistr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1|Centos)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select a program (Test - 0 / Sublime Text - 1 / Postgresql - 2 / PgAdmin - 3 / Git - 4 / Kvm - 5 / nfts-3g - 6 / libreoffice - 7): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choiceprogr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choiceprogr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;0)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://www.sublimetext.com/docs/linux_repositories.html#dnf<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y install sublime-text<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://www.postgresql.org/download/linux/redhat/<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -qy module disable postgresql<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf install -y postgresql15-server<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo /usr/pgsql-15/bin/postgresql-15-setup initdb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo systemctl enable postgresql-15<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo systemctl start postgresql-15<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;3)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://www.pgadmin.org/download/pgadmin-4-rpm/<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum install -y pgadmin4<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum install -y pgadmin4-desktop<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum install -y pgadmin4-web<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo /usr/pgadmin4/bin/setup-web.sh<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum upgrade -y pgadmin4<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;4)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://unixcop.com/how-to-install-git-on-centos-9-stream-fedora/<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y install git<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;git --version<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;5)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://technixleo.com/install-kvm-on-centos-alma-rhel-9/<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;egrep -c '(vmx|svm)' /proc/cpuinfo<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf install -y qemu-kvm qemu-img libvirt virt-install libvirt-client virt-manager<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lsmod | grep kvm<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo systemctl enable --now libvirtd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo virt-host-validate&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;6)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;# https://itisgood.ru/2019/03/26/kak-smontirovat-disk-ntfs-na-centos-rhel-scientific-linux/<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y install epel-release<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y install ntfs-3g<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;7)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y install libreoffice<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2|u|U|Ubuntu)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt -y upgrade<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select a program (Test - 0 / Net-Tools - 1 / Ssh - 2): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choiceprogr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choiceprogr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;0)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt-get -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt-get install net-tools<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2)#https://help.reg.ru/support/servery-vps/oblachnyye-servery/rabota-s-serverom/kak-ustanovit-i-nastroit-ssh<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt-get install ssh<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo apt-get install openssh-server<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;systemctl status ssh<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;exit 0<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;3|r|R|Redos)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select a program (Test - 0 / Office - 1 / Playonlinux - 2): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choiceprogr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choiceprogr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;0)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;wine /LINKS/MS\ Office\ 2007-10-13/Office_Professional_Plus_2007_W32_Russia/SETUP.EXE<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo touch /etc/yum.repos.d/playonlinux.repo<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo echo '[playonlinux]<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;name=PlayOnLinux Official repository<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;baseurl=http://rpm.playonlinux.com/fedora/yum/base<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;enable=1<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpgcheck=0<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;gpgkey=http://rpm.playonlinux.com/public.gpg' &gt; /etc/yum.repos.d/playonlinux.repo<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;cat /etc/yum.repos.d/playonlinux.repo<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo yum -y install playonlinux nc jq<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo reboot&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;*)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo "Nothing was entered."<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;[Nn]* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;exit<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo "Please answer yes or no."<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;esac<br>
    done<br>
    exit 0<br>
    $ ./Linux-Installer.sh<br>
    Do you want to install the program? (y/n) y<br>
    Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): 1<br>
    Select a program (Test - 0 / Sublime Text - 1 / Postgresql - 2 / PgAdmin - 3 / Git - 4 / Kvm - 5 / nfts-3g - 6 / libreoffice - 7): 0<br>
    Do you want to install the program? (y/n) y<br>
    Select the distribution where you want to install the program (Centos 9 - 1 / Ubuntu 22.04 - 2 / Redos 7.3 - 3): 2<br>
    Select a program (Test - 0 / Net-Tools - 1 / Ssh - 2): 0<br>
    $ vim Linux-Config.sh<br>
    $ cat Linux-Config.sh<br>
    #!/bin/bash&nbsp;<br>
    checkcmd(){<br>
    if [ $? -eq 0 ]; then<br>
    &nbsp;&nbsp; &nbsp;echo ! The command was executed successfully<br>
    else<br>
    &nbsp;&nbsp; &nbsp;echo ! The command was executed with an error<br>
    fi<br>
    }<br>
    # https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script<br>
    while true; do<br>
    &nbsp;&nbsp; &nbsp;read -p "Do you want to configure the program? (y/n) " yn<br>
    &nbsp;&nbsp; &nbsp;case $yn in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;[Yy]* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select the distribution where you want to configure the program (Redhat - 1 / Debian - 2): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choicedistr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choicedistr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1|r|R|Redhat)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Select a program (Test - 0 / Disabling Lamp - 1 / Starting Lamp - 2 / Add users in postgressql - 3 / Moving linux folders to another disk - 4): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read choiceprogr<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;case "$choiceprogr" in<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;0)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo dnf -y update<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo service apache2 stop<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo service mysql stop<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2)<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo service apache2 start<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo service mysql start<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;3) #https://www.dmosk.ru/miniinstruktions.php?mini=postgresql-users&amp;ysclid=lig0a2xuou515754413#create<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Please come up with a new user: "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read userdb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Please come up with a new password: "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read passwdb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;#echo YOUR-PASSWORD | sudo -S&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;cd /tmp<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo -u postgres -H -- psql -d template1 -c "CREATE USER $userdb WITH PASSWORD '$passwdb';"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;#psql -U postgres -d template1 -c "CREATE USER tuser0 WITH PASSWORD 'Tpsswd';"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Please come up with a new base: "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read namedb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo -u postgres -H -- psql -d template1 -c "CREATE database $namedb;"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo -u postgres -H -- psql -d template1 -c "GRANT ALL PRIVILEGES ON DATABASE "$namedb" to $userdb;"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo -u postgres -H -- psql -d template1 -c "\c $namedb;"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sudo -u postgres -H -- psql -d template1 -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "$userdb";"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;4) #http://sysengineering.ru/notes/peremeschenie-papok-linux-na-drugoy-disk?ysclid=lisfix46x1712981898<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lsblk<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "USB device for moving the base (hint above): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read mntusb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo fdisk $mntusb<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lsblk<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "USB device for moving the base (hint above): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read mntusb1<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Enter the file system type: "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read mntfs<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo mkfs -t $mntfs $mntusb1<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo mount $mntusb1 /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;shopt -s dotglob<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Which directory do you need to move: "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read movedir<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo rsync -aulvXpogtr $movedir/* /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ls -Zd $movedir<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ls -Zd /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Change the security settings of a new folder (hint above): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read mntset<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo chcon -t $mntset /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ls -Zd /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo umount /mnt<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo blkid<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo -n "Enter the UUID of the disk (hint above): "<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;read mntuid<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo sh -c "echo 'UUID=$mntuid&nbsp;&nbsp; $movedir&nbsp; $mntfs&nbsp; defaults,noatime,nofail 0 2' &gt;&gt; /etc/fstab"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo cat /etc/fstab | grep $mntfs<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo mv $movedir $movedir.back<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo mkdir $movedir<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo YOUR-PASSWORD | sudo -S sudo mount -av<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;checkcmd<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ls $movedir<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;lsblk&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2|d|D|Debian)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo "deb"<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;exit 0<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;*)&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo "Nothing was entered."<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;esac&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;[Nn]* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;exit<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;* )&nbsp;<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;echo "Please answer yes or no."<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;;;<br>
    &nbsp;&nbsp; &nbsp;esac<br>
    done<br>
    exit 0<br>
    $ ./Linux-Config.sh<br>
    Do you want to configure the program? (y/n) y<br>
    Select the distribution where you want to configure the program (Redhat - 1 / Debian - 2): 1<br>
    Select a program (Test - 0 / Disabling Lamp - 1 / Starting Lamp - 2 / Add users in postgressql - 3 / Moving linux folders to another disk - 4): 0<br>
    Do you want to configure the program? (y/n) n<br>
    <strong>Task:</strong><br>
    Столкнулся с такой проблемой, что маленький неттоп флешки не читает, он не был добавлен в домен и антивирус на нем не стоял. Убедимся на другой машине, в моем случае ноутбуке, что флешка спокойно видит на нем файлы.&nbsp;&nbsp; &nbsp;То есть это чистая флешка, не зараженная, и попробуем ее вставить в тот проблемный неттоп. Тут мы увидим, что во флешке другая информация будет. Как будто в самой флешке отображается сама флешка, и если ее открыть (что делать не стоит) тот там и будут наши файлы. на самом деле они будут зашифрованны и флешка заражена. Надо это исправлять. В тот момент у нас не было в неттопе никакого антивируса, поэтому я установил бесплатный антивирус Касперский FREE с официального сайта. И вот, он выдал в момент запуска после установки рекомендации по устранении проблм в компьютере. - Жмем устранить и перезагрузимся - В следующем запуске антивирус покажет информацию об устранении проблем, и можем сразу вставить флешку в неттопе. Тут мы увидим, что антвирус удалил какой-то файл (это и есть вирус) Открываем саму флешку после удаления вируса, а там пустой файл, хотя система показывает, что флешка заполнена. Он содержит зашифрованные файлы. Давайте попробуем их восстановить. Есть скрипт, который возвращает данные. Вставьте этот файл на флешку - запустите его - увидите файл и папку с файлами, которые ему удалось восстановить - Все готово, и неттоп мы подлечили, и данные со флешки восстановили, и антивирус бесплатный установили, и главное что этот бюджетный вариант с восстановлением вполне корректно работает.<br>
    <strong>Decision:</strong><br>
    $ vim Windows-FlashDriveRecovery.bat<br>
    $ cat Windows-FlashDriveRecovery.bat<br>
    dir /AS /B &gt; list.txt&nbsp;<br>
    FOR /F "eol=# tokens=1* delims=:" %%i in (list.txt) do (&nbsp;<br>
    attrib -s -h -r "%%i"&nbsp;<br>
    )&nbsp;<br>
    pause<br>
    <strong>Task:</strong><br>
    Ошибка после ввода пароля в программе у всех пользователей - "Не отвечает программа"<br>
    ВНЕШНЯЯБАЗА2.exe не работает<br>
    На одном из объектов автоматизации второй раз за месяц происходит процесс переполнения внешней базы документооборота C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB. База данных увеличивается в размерах с 1.8 Гб до 115Гб за три дня. После проведения инженером филиала процедуры Бэкап/Рестор внешняя база возвращается к прежнему размеру. Данная проблема наблюдается второй раз за месяц с периодичностью в две недели.<br>
    <strong>Task:</strong><br>
    Отключить службы Firebird, Сделать backup/restore базы ВНЕШНЯЯБАЗА1.GDB, запустив скрипты&nbsp;<br>
    1. backup.bat&nbsp;<br>
    2. restore.bat<br>
    после чего сохранится файл ВНЕШНЯЯБАЗА1.GDB в КУДАСОХРАНЯТЬИЗМЕНЕНИЯ. Файл заменить на файл в сервере, который занимал 120 гб. Посмотреть лог файлы:<br>
    1. retranslator.log<br>
    2. retranslator_2022-01-11_15-23-40-694.log<br>
    3. retranslator_2022-01-24_16-36-09-627.log<br>
    4. retranslator_2022-01-24_16-36-16-806.log<br>
    <strong>Decision:</strong><br>
    $ cat backup.bat<br>
    @ echo on<br>
    SET ISC_USER=ИМЯПОЛЬЗОВАТЕЛЯБАЗЫ<br>
    SET ISC_PASSWORD=ПАРОЛЬКБАЗЕ<br>
    SET dbpath=localhost:C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB<br>
    SET fbpath=C:\ПУТЬFIREBIRD\Firebird_1_5\bin\<br>
    SET bbpath=C:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\<br>
    "%fbpath%gfix" -shut -force 5 "%dbpath%"<br>
    "%fbpath%gbak" -b -v -g -y "%bbpath%%date%.log" "%dbpath%" "%bbpath%ВНЕШНЯЯБАЗА1_%date%.gbk"<br>
    @ pause<br>
    $ cat restore.bat<br>
    @ echo on<br>
    SET ISC_USER=ИМЯПОЛЬЗОВАТЕЛЯБАЗЫ<br>
    SET ISC_PASSWORD=ПАРОЛЬКБАЗЕ<br>
    SET fbpath=C:\ПУТЬFIREBIRD\Firebird_1_5\bin\<br>
    SET bbpath=localhost:C:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\<br>
    "%fbpath%gbak.exe" -c -v -r -y "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\%date%_fix.log" "c:\КУДАСОХРАНЯТЬИЗМЕНЕНИЯ\ВНЕШНЯЯБАЗА1_backup.gbk" "%bbpath%ВНЕШНЯЯБАЗА1_fix.GDB"&nbsp;<br>
    @ pause<br>
    $ cat retranslator.log<br>
    ...<br>
    INF|09.12.2022 16:27:36 Сообщения в очереди "viv.client.КОДОА.1" отсутствуют<br>
    INF|09.12.2022 16:32:39 Отправка запроса id="ИДЕНТИФИКАТОРПРОЦЕССА1", type_id=ИДЕНТИФИКАТОРТИП ...<br>
    ERR|09.12.2022 16:33:37 Out of memory.<br>
    &nbsp;&nbsp;&nbsp; E.ClassName=EOutOfMemory<br>
    &nbsp;&nbsp;&nbsp; Sender.ClassName=TWorkThread<br>
    ...<br>
    INF|11.12.2022 22:28:27 Отправка запроса id="ИДЕНТИФИКАТОРПРОЦЕССА2", type_id=ИДЕНТИФИКАТОРТИП ...<br>
    ERR|11.12.2022 22:28:53 При отправке запроса id="ИДЕНТИФИКАТОРПРОЦЕССА2" произошла неустранимая ошибка чтения из БД, запрос отклонён. Текст ошибки:<br>
    &nbsp;&nbsp;&nbsp; Unsuccessful execution caused by a system error that precludes<br>
    &nbsp;&nbsp;&nbsp; successful execution of subsequent statements.<br>
    &nbsp;&nbsp;&nbsp; I/O error for file "C:\ПУТЬКБАЗЕ\ВНЕШНЯЯБАЗА1.GDB".<br>
    &nbsp;&nbsp;&nbsp; Error while trying to write to file.<br>
    &nbsp;&nbsp;&nbsp; Недостаточно места на диске.<br>
    ...<br>
    <strong>Decision:</strong><br>
    при обработке одного запроса id="ИДЕНТИФИКАТОРПРОЦЕССА1", type_id=ИДЕНТИФИКАТОРТИП происходит нехватка памяти, что далее приводит к сбою функционирования. Вероятно в запросе большое вложение. Для дальнейшего анализа смотрим БД ВНЕШНЯЯБАЗА2.gdb, в которой покажет технические ошибки состояния базы ВНЕШНЯЯБАЗА2.gdb.<br>
    Для их устранения также сделать бэкап/ресторе БД ВНЕШНЯЯБАЗА2.gdb. Далее понаблюдать за ситуацией с размером БД ВНЕШНЯЯБАЗА2.GDB, чтобы он весил не больше 19 Гб.<br>
    <strong>Task:</strong><br>
    Проверить все страницы сайта на отсутствие pdf файлов больше 15 Мб.<br>
    <strong>Decision:</strong><br>
    $ wget https://tsite.ru/sveden/document<br>
    --2018-11-01 20:12:20-- https://tsite.ru/sveden/document<br>
    Распознаётся tsite.ru (tsite.ru)… IpAddr<br>
    Подключение к tsite.ru (tsite.ru)|IpAddr|:443... соединение установлено.<br>
    ОШИБКА: Нет доверия сертификату для «tsite.ru».<br>
    ОШИБКА: Неизвестный издатель сертификата «tsite.ru».<br>
    $ wget --no-check-certificate -r -l 1 -A pdf https://tsite.ru/sveden/document<br>
    $ vim FileWeight.sh<br>
    $ chmod +x FileWeight.sh<br>
    $ cat FileWeight.sh<br>
    #!/bin/bash<br>
    echo -n "Enter a link to the site: "<br>
    read linksite<br>
    user=$(whoami)<br>
    echo -n "Come up with a name for the directory where the files will be written: "<br>
    read linkfiles<br>
    if [ -d /home/$user/$linkfiles ]; then<br>
    rm -rf /home/$user/$linkfiles<br>
    echo "/home/$user/$filename delete"<br>
    else<br>
    mkdir /home/$user/$linkfiles<br>
    cd /home/$user/$linkfiles<br>
    echo "/home/$user/$linkfiles create"<br>
    fi<br>
    wget --no-check-certificate -r -l 1 -A pdf $linksite<br>
    find /home/$user/$linkfiles -size +15M &gt; output<br>
    $ ./FileWeight.sh<br>
    Enter a link to the site: https://tsite.ru/sveden/document<br>
    Come up with a name for the directory where the files will be written: tdir<br>
    /home/tUser/tdir create<br>
    ...<br>
    $ cat /home/tUser/tdir/output<br>
    /home/tUser/tdir/tsite.ru/Media/irk/Документы института/2018/tDoc1.pdf<br>
    $ ls -l /home/tUser/tdir/tsite.ru/Media/irk/Документы\ института/2018/tDoc1.pdf&nbsp;<br>
    -rw-r--r--. 1 tUser tUser 20055320 июн 30 2018 '/home/tUser/tdir/tsite.ru/Media/irk/Документы института/2018/tDoc1.pdf'<br>
    <strong>Task:</strong><br>
    Отсортировать html-код страницы по атрибутам &lt;tr&gt;&lt;td&gt;<br>
    <strong>Decision:</strong><br>
    <strong>Task:</strong><br>
    Поменять/добавить тег на странице с таблицей,в некоторых строках тег отсутствует<br>
    <strong>Decision:</strong><br>
    <strong>Source:</strong><br>
    https://stackoverflow.com/questions/4846007/check-if-directory-exists-and-delete-in-one-command-unix<br>
    <strong>Task:</strong><br>
    В командной строке программа у пользователя запрашивает данные и сохраняет даные в файл.<br>
    links&nbsp;&nbsp; | email&nbsp;&nbsp; | login | password - Keys<br>
    http://fds | fgd@fgd.ru | admin | fgdfgdf &nbsp;&nbsp;- Values<br>
    <strong>Decision:</strong><br>
    $ cat PasswordStorage.py<br>
    repeat="y"<br>
    while repeat == "y":<br>
    keys=['links', 'mails', 'logins', 'passwords']<br>
    print(keys)&nbsp;<br>
    #print(keys[1])<br>
    values=[]<br>
    #print(values)<br>
    link, email, login, password= input("Enter the link: "), input("Enter email: "), input("Enter login: "), input("Enter password: ")<br>
    values.append(link)<br>
    values.append(email)<br>
    values.append(login)<br>
    values.append(password)<br>
    print(values)<br>
    #print(values[2])<br>
    row={}<br>
    for i in range(len(keys)):<br>
    #print(keys[i])<br>
    #row[keys[i]] = None<br>
    row[keys[i]] = values[i]<br>
    print(row)<br>
    createfile = input("Create new file? (y/n): ")<br>
    if createfile == "y":<br>
    namefile = input("Name the file where the passwords will be stored: ")<br>
    with open(namefile,'w') as file:<br>
    #file.write(str(row))<br>
    for key, value in row.items():<br>
    #print("Key: " + key)<br>
    keyRow="| "+str(key)+" |"<br>
    file.write(keyRow)<br>
    file.write("\n")<br>
    for key, value in row.items():<br>
    valueRow="| "+str(value)+" |"<br>
    file.write(valueRow)<br>
    file.close()<br>
    elif createfile == "n":<br>
    namefile = input("Write the name of the file in which you want to make changes: ")<br>
    with open(namefile,'a') as file:<br>
    file.write("\n")<br>
    for key, value in row.items():<br>
    valueRow="| "+str(value)+" |"<br>
    file.write(valueRow)<br>
    file.write("\n")<br>
    file.close()<br>
    repeat = input("Do you want to continue? (y/n): ")<br>
    if repeat == "n":<br>
    break<br>
    while (repeat!="y" and repeat!="n"):<br>
    repeat = input("Please enter the correct answer (y/n): ")<br>
    $ python PasswordStorage.py<br>
    ['links', 'mails', 'logins', 'passwords']<br>
    Enter the link: 1<br>
    Enter email: 2<br>
    Enter login: 3<br>
    Enter password: 4<br>
    ['1', '2', '3', '4']<br>
    {'links': '1', 'mails': '2', 'logins': '3', 'passwords': '4'}<br>
    Create new file? (y/n): y<br>
    Name the file where the passwords will be stored: testfile<br>
    Do you want to continue? (y/n): 1213wa<br>
    Please enter the correct answer (y/n): y<br>
    ['links', 'mails', 'logins', 'passwords']<br>
    Enter the link: 11<br>
    Enter email: 22<br>
    Enter login: 33<br>
    Enter password: 4444444<br>
    ['11', '22', '33', '4444444']<br>
    {'links': '11', 'mails': '22', 'logins': '33', 'passwords': '4444444'}<br>
    Create new file? (y/n): n<br>
    Write the name of the file in which you want to make changes: testfile<br>
    Do you want to continue? (y/n): n<br>
    $ cat testfile<br>
    | links || mails || logins || passwords |<br>
    | 1 || 2 || 3 || 4 |<br>
    | 11 || 22 || 33 || 4444444 |<br>
    &nbsp;
</p>
<p>
    <strong>Task:</strong><br>
    Установить виртуальный сервер AltLinux в Hyper-V<br>
    <strong>Decision:</strong><br>
    PS C:\Windows\system32&gt; $ram=1*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $ram<br>
    1073741824<br>
    PS C:\Windows\system32&gt; $hdd=10*1024*1024*1024<br>
    PS C:\Windows\system32&gt; $hdd<br>
    10737418240<br>
    PS C:\Windows\system32&gt; NEW-VM -Name Alt -MemoryStartupBytes $ram -NewVHDPath 'C:\Data\VM\Alt\Alt.vhdx'-NewVHD<br>
    SizeBytes $hdd -Path 'C:\Data\VM\Alt'<br>
    PS C:\Windows\system32&gt; Start-VM -name Alt<br>
    PS C:\Windows\system32&gt; Get-VM<br>
    Name State&nbsp;&nbsp; CPUUsage(%) MemoryAssigned(M) Uptime&nbsp;&nbsp; Status<br>
    ---- -----&nbsp;&nbsp; ----------- ----------------- ------&nbsp;&nbsp; ------<br>
    Alt&nbsp; Off&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00:00:00 Работает нормально<br>
    <strong>Task:</strong><br>
    Set up an ActiveDirectory/Login<br>
    <strong>Decision:</strong><br>
    $ ssh -X tuser@thost1<br>
    $ su -<br>
    # apt-get install task-auth-ad-sssd<br>
    # net time set -S thost.ru<br>
    # system-auth write ad thost.ru thost1 thost 'tuser' 'tpassword'<br>
    Using short domain name -- thost<br>
    Joined 'thost1' to dns domain 'thost.ru'<br>
    Successfully registered hostname with DNS<br>
    failed to call wbcGetDisplayName: WBC_ERR_WINBIND_NOT_AVAILABLE<br>
    Could not lookup sid S-1-5-21-965402400-3010625364-1855727791-513<br>
    failed to call wbcGetDisplayName: WBC_ERR_WINBIND_NOT_AVAILABLE<br>
    Could not lookup sid S-1-5-21-965402400-3010625364-1855727791-512<br>
    # wbinfo -t<br>
    checking the trust secret for domain thost via RPC calls succeeded<br>
    # acc<br>
    2 keyboards found<br>
    qt.qpa.xcb: could not connect to display<br>
    qt.qpa.plugin: Could not load the Qt platfothost plugin "xcb" in "" even though it was found.<br>
    This applthostation failed to start because no Qt platfothost plugin could be initialized. Reinstalling the applthostation may fix this problem.<br>
    Available platfothost plugins are: eglfs, linuxfb, minimal, minimalegl, offscreen, vnc, xcb.<br>
    # exit<br>
    $ exit<br>
    $ ssh -X tuser@thost1<br>
    $ su -<br>
    # acc<br>
    2 keyboards found<br>
    QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/.private/root/runtime-root'<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    WARNING: (alterator lookout evaluation): imported module (alterator presentation events) overrides core binding `when'<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    libpng warning: thostCP: known incorrect sRGB profile<br>
    # vim /etc/net/ifaces/eth0/resolv.conf<br>
    # cat /etc/net/ifaces/eth0/resolv.conf<br>
    nameserver IpAddr1<br>
    # hostnamectl set-hostname thost1.thost.ru<br>
    # cat /etc/resolv.conf<br>
    # Generated by resolvconf<br>
    # Do not edit manually, use<br>
    # /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.<br>
    search thost.ru<br>
    nameserver 127.0.0.1<br>
    # vim /etc/resolv.conf<br>
    # cat /etc/resolvconf.conf<br>
    # Configuration for resolvconf(8)<br>
    # See resolvconf.conf(5) for details<br>
    resolv_conf_head='# Do not edit manually, use\n# /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.'<br>
    resolv_conf=/etc/resolv.conf<br>
    # These interfaces will always be processed first.<br>
    interface_order='lo lo[0-9]* lo.*'<br>
    # These interfaces will be processed next, unless they have a metrthost.<br>
    dynamthost_order='tap[0-9]* tun[0-9]* vpn vpn[0-9]* wg[0-9]* ppp[0-9]* ippp[0-9]*'<br>
    #Configuration files for named subscriber.<br>
    named_zones=/var/lib/bind/etc/resolvconf-zones.conf<br>
    named_options=/var/lib/bind/etc/resolvconf-options.conf<br>
    #Configuration files for dnsmasq subscriber.<br>
    dnsmasq_conf=/etc/dnsmasq.conf.d/60-resolvconf<br>
    dnsmasq_resolv=/etc/resolv.conf.dnsmasq<br>
    name_servers=127.0.0.1<br>
    # vim /etc/resolvconf.conf<br>
    # cat /etc/resolvconf.conf<br>
    # Configuration for resolvconf(8)<br>
    # See resolvconf.conf(5) for details<br>
    resolv_conf_head='# Do not edit manually, use\n# /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.'<br>
    resolv_conf=/etc/resolv.conf<br>
    # These interfaces will always be processed first.<br>
    #interface_order='lo lo[0-9]* lo.*'<br>
    interface_order='lo lo[0-9]* lo.* eth0'<br>
    search_domains=thost.ru<br>
    # These interfaces will be processed next, unless they have a metrthost.<br>
    dynamthost_order='tap[0-9]* tun[0-9]* vpn vpn[0-9]* wg[0-9]* ppp[0-9]* ippp[0-9]*'<br>
    #Configuration files for named subscriber.<br>
    named_zones=/var/lib/bind/etc/resolvconf-zones.conf<br>
    named_options=/var/lib/bind/etc/resolvconf-options.conf<br>
    #Configuration files for dnsmasq subscriber.<br>
    dnsmasq_conf=/etc/dnsmasq.conf.d/60-resolvconf<br>
    dnsmasq_resolv=/etc/resolv.conf.dnsmasq<br>
    #name_servers=127.0.0.1<br>
    # resolvconf -u<br>
    # cat /etc/resolv.conf<br>
    # Generated by resolvconf<br>
    # Do not edit manually, use<br>
    # /etc/net/ifaces/&lt;interface&gt;/resolv.conf instead.<br>
    search thost.ru<br>
    nameserver IpAddr1<br>
    ...<br>
    nameserver 8.8.8.8<br>
    # hostname<br>
    thost1.thost.ru<br>
    # dig _kerberos._udp.thost.ru SRV | grep ^_kerberos<br>
    _kerberos._udp.thost.ru. 600 IN SRV 0 100 88 M-1.thost.ru.<br>
    ...<br>
    _kerberos._udp.thost.ru. 600 IN SRV 0 100 88 T-1.thost.ru.<br>
    # dig _kerberos._tcp.thost.ru SRV | grep ^_kerberos<br>
    _kerberos._tcp.thost.ru. 600 IN SRV 0 100 88 M-c.thost.ru.<br>
    ...<br>
    _kerberos._tcp.thost.ru. 600 IN SRV 0 100 88 T-1.thost.ru.<br>
    # cat /etc/krb5.conf | grep default_realm<br>
    default_realm = thost.ru<br>
    # default_realm = EXAMPLE.COM<br>
    # cat /etc/krb5.conf | grep dns_lookup_realm<br>
    dns_lookup_realm = false<br>
    # cat /etc/krb5.conf | grep dns_lookup_kdc<br>
    dns_lookup_kdc = true<br>
    # exit<br>
    $ ssh -X tuser@thost1<br>
    # kinit tuser<br>
    # klist<br>
    Tthostket cache: KEYRING:persistent:0:krb_ccache_CCjHpN1<br>
    Default principal: a-r@thost.ru<br>
    Valid starting&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expires&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Servthoste principal<br>
    10.08.2022 12:30:34&nbsp; 10.08.2022 22:30:34&nbsp; krbtgt/thost.ru@thost.ru<br>
    &nbsp;&nbsp; &nbsp;renew until 17.08.2022 12:30:32<br>
    # apt-get install samba-client<br>
    # cat /etc/samba/smb.conf | grep realm<br>
    &nbsp;&nbsp; &nbsp;realm = thost.ru<br>
    # cat /etc/samba/smb.conf | grep workgroup<br>
    &nbsp;&nbsp; &nbsp;workgroup = thost<br>
    # cat /etc/samba/smb.conf | grep netbios<br>
    &nbsp;&nbsp; &nbsp;netbios name = thost1<br>
    # cat /etc/samba/smb.conf | grep security<br>
    &nbsp;&nbsp; &nbsp;security = ads<br>
    # cat /etc/samba/smb.conf | grep method<br>
    &nbsp;&nbsp; &nbsp;kerberos method = system keytab<br>
    # cat /etc/samba/smb.conf | grep idmap<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;idmap config * : range = 200000-2000200000<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;idmap config * : backend = sss<br>
    # vim /etc/samba/smb.conf<br>
    # cat /etc/samba/smb.conf | grep idmap<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;idmap config * : range = 200000-2000200000<br>
    ;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idmap config * : backend = sss<br>
    &nbsp;&nbsp; &nbsp;idmap config * : backend = tdb<br>
    # testpathost<br>
    Load smb config files from /etc/samba/smb.conf<br>
    Loaded servthostes file OK.<br>
    Weak crypto is allowed<br>
    Server role: ROLE_DOMAIN_MEMBER<br>
    Press enter to see a dump of your servthoste definitions<br>
    # Global parameters<br>
    [global]<br>
    &nbsp;&nbsp; &nbsp;kerberos method = system keytab<br>
    &nbsp;&nbsp; &nbsp;machine password timeout = 0<br>
    &nbsp;&nbsp; &nbsp;realm = thost.ru<br>
    &nbsp;&nbsp; &nbsp;security = ADS<br>
    &nbsp;&nbsp; &nbsp;template homedir = /home/thost.ru/%U<br>
    &nbsp;&nbsp; &nbsp;template shell = /bin/bash<br>
    &nbsp;&nbsp; &nbsp;winbind use default domain = Yes<br>
    &nbsp;&nbsp; &nbsp;workgroup = thost<br>
    &nbsp;&nbsp; &nbsp;idmap config * : range = 200000-2000200000<br>
    &nbsp;&nbsp; &nbsp;idmap config * : backend = tdb<br>
    [share]<br>
    &nbsp;&nbsp; &nbsp;comment = Commonplace<br>
    &nbsp;&nbsp; &nbsp;path = /srv/share<br>
    &nbsp;&nbsp; &nbsp;read only = No<br>
    [homes]<br>
    &nbsp;&nbsp; &nbsp;browseable = No<br>
    &nbsp;&nbsp; &nbsp;comment = Home Directory for '%u'<br>
    &nbsp;&nbsp; &nbsp;read only = No<br>
    # net ads join -U tuser<br>
    Enter tuser's password:<br>
    Using short domain name -- thost<br>
    Joined 'thost1' to dns domain 'thost.ru'<br>
    No DNS domain configured for thost1. Unable to perfothost DNS Update.<br>
    DNS update failed: NT_STATUS_INVALID_PARAMETER<br>
    # cat /etc/hosts<br>
    127.0.0.1&nbsp;&nbsp; localhost.localdomain localhost<br>
    # vim /etc/hosts<br>
    # cat /etc/hosts<br>
    127.0.0.1&nbsp;&nbsp; localhost.localdomain localhost<br>
    127.0.0.1&nbsp;&nbsp; thost1.thost.ru thost1<br>
    # net ads join -U tuser<br>
    Enter tuser's password:<br>
    Using short domain name -- thost<br>
    Joined 'thost1' to dns domain 'thost.ru'<br>
    kerberos_kinit_password thost1$@thost.ru failed: Preauthentthostation failed<br>
    DNS update failed: kinit failed: Preauthentthostation failed<br>
    # vim /etc/hosts<br>
    # cat /etc/hosts<br>
    127.0.0.1&nbsp;&nbsp; thost1.thost.ru thost1<br>
    # net ads join -U tuser<br>
    Enter tuser's password:<br>
    Using short domain name -- thost<br>
    Joined 'thost1' to dns domain 'thost.ru'<br>
    # klist -k -e<br>
    Keytab name: FILE:/etc/krb5.keytab<br>
    KVNO Principal<br>
    ---- --------------------------------------------------------------------------<br>
    9 host/thost1.thost.ru@thost.ru (aes256-cts-hmac-sha1-96)<br>
    9 host/thost1@thost.ru (aes256-cts-hmac-sha1-96)<br>
    9 host/thost1.thost.ru@thost.ru (aes128-cts-hmac-sha1-96)<br>
    9 host/thost1@thost.ru (aes128-cts-hmac-sha1-96)<br>
    9 host/thost1.thost.ru@thost.ru (DEPRECATED:arcfour-hmac)<br>
    9 host/thost1@thost.ru (DEPRECATED:arcfour-hmac)<br>
    9 thost1$@thost.ru (aes256-cts-hmac-sha1-96)<br>
    9 thost1$@thost.ru (aes128-cts-hmac-sha1-96)<br>
    9 thost1$@thost.ru (DEPRECATED:arcfour-hmac)<br>
    8 host/thost1.thost.ru@thost.ru (aes256-cts-hmac-sha1-96)<br>
    8 host/thost1@thost.ru (aes256-cts-hmac-sha1-96)<br>
    8 host/thost1.thost.ru@thost.ru (aes128-cts-hmac-sha1-96)<br>
    8 host/thost1@thost.ru (aes128-cts-hmac-sha1-96)<br>
    8 host/thost1.thost.ru@thost.ru (DEPRECATED:arcfour-hmac)<br>
    8 host/thost1@thost.ru (DEPRECATED:arcfour-hmac)<br>
    8 thost1$@thost.ru (aes256-cts-hmac-sha1-96)<br>
    8 thost1$@thost.ru (aes128-cts-hmac-sha1-96)<br>
    8 thost1$@thost.ru (DEPRECATED:arcfour-hmac)<br>
    # apt-get install sssd-ad<br>
    # cat /etc/sssd/sssd.conf<br>
    [sssd]<br>
    config_file_version = 2<br>
    servthostes = nss, pam<br>
    # Managed by system facility command:<br>
    ## control sssd-drop-privileges unprivileged|privileged|default<br>
    user = _sssd<br>
    # SSSD will not start if you do not configure any domains.<br>
    domains = thost.ru<br>
    [nss]<br>
    [pam]<br>
    [domain/thost.ru]<br>
    id_provider = ad<br>
    auth_provider = ad<br>
    chpass_provider = ad<br>
    access_provider = ad<br>
    default_shell = /bin/bash<br>
    fallback_homedir = /home/%d/%u<br>
    debug_level = 0<br>
    ; cache_credentials = false<br>
    ad_gpo_ignore_unreadable = true<br>
    ad_gpo_access_control = pethostissive<br>
    ad_update_samba_machine_account_password = true<br>
    # vim /etc/sssd/sssd.conf<br>
    # cat /etc/sssd/sssd.conf<br>
    [sssd]<br>
    config_file_version = 2<br>
    servthostes = nss, pam<br>
    # Managed by system facility command:<br>
    ## control sssd-drop-privileges unprivileged|privileged|default<br>
    #user = _sssd<br>
    user=root<br>
    # SSSD will not start if you do not configure any domains.<br>
    domains = thost.ru<br>
    [nss]<br>
    [pam]<br>
    [domain/thost.ru]<br>
    id_provider = ad<br>
    auth_provider = ad<br>
    chpass_provider = ad<br>
    access_provider = ad<br>
    ;ldap_id_mapping = False<br>
    default_shell = /bin/bash<br>
    fallback_homedir = /home/%d/%u<br>
    debug_level = 0<br>
    ;use_fully_qualified_names = True<br>
    ; cache_credentials = True<br>
    ad_gpo_ignore_unreadable = true<br>
    ad_gpo_access_control = pethostissive<br>
    ad_update_samba_machine_account_password = true<br>
    # grep sss /etc/nsswitch.conf<br>
    passwd: files sss<br>
    shadow: tcb files sss<br>
    group: files [SUCCESS=merge] sss role<br>
    # control system-auth sss<br>
    # servthoste sssd status<br>
    active<br>
    # servthoste sssd start<br>
    # getent passwd tuser<br>
    tuser:*:1-9:1-3:в-н:/home/thost.ru/tuser:/bin/bash<br>
    # id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),1-8(администраторы dhcp),1-0(I-s),11-0(пользователи филиалы),1-1(tusert_users),1-9(i-n)<br>
    # net ads info<br>
    LDAP server: IpAddr2<br>
    LDAP server name: MOW-1.thost.ru<br>
    Realm: thost.ru<br>
    Bind Path: dc=thost,dc=RU<br>
    LDAP port: 389<br>
    Server time: Ср, 10 авг 2022 13:08:06 +08<br>
    KDC server: IpAddr2<br>
    Server time offset: 0<br>
    Last machine account password change: Ср, 10 авг 2022 12:50:51 +08<br>
    # net ads testjoin<br>
    Join is OK<br>
    # cat /etc/lightdm/lightdm.conf | grep greeter-hide-<br>
    # greeter-hide-users = True to hide the user list<br>
    #greeter-hide-users=false<br>
    greeter-hide-users = true<br>
    # cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-language<br>
    show-language-selector = false<br>
    # cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-indthostators<br>
    # vim /etc/lightdm/lightdm-gtk-greeter.conf<br>
    # cat /etc/lightdm/lightdm-gtk-greeter.conf | grep show-indthostators<br>
    show-indthostators=~a11y;~power;~session;~language<br>
    # vim /etc/lightdm/lightdm-gtk-greeter.conf<br>
    # cat /etc/lightdm/lightdm-gtk-greeter.conf | grep enter-<br>
    enter-username = true<br>
    # reboot<br>
    $ ssh -X tuser@thost1<br>
    <strong>Decision:</strong><br>
    $ su -<br>
    # apt-get install libnss-role<br>
    # groupadd -r localadmins<br>
    groupadd: группа «localadmins» уже существует<br>
    # groupadd -r remote<br>
    groupadd: группа «remote» уже существует<br>
    # control sshd-allow-groups enabled<br>
    # sed -i 's/AllowGroups.*/AllowGroups = remote/' /etc/openssh/sshd_config<br>
    # roleadd users cdwriter cdrom audio proc radio camera floppy xgrp scanner uucp fuse<br>
    # roleadd localadmins wheel remote vboxusers<br>
    # roleadd 'Domain Users' users<br>
    Error 156: No such group<br>
    # roleadd 'Пользователи домена' users<br>
    # roleadd 'Администраторы домена' localadmins<br>
    # rolelst<br>
    users:cdwriter,cdrom,audio,proc,radio,camera,floppy,xgrp,scanner,uucp,fuse,video,vboxusers,vboxadd<br>
    localadmins:wheel,remote,vboxusers,vboxadd<br>
    пользователи домена:users<br>
    администраторы домена:localadmins<br>
    powerusers:remote,vboxadd,vboxusers<br>
    vboxadd:vboxsf<br>
    # id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),11-0(пользователи филиалы),1-9(i-n),1-0(I-s),1-1(tusert_users),1-8(администраторы dhcp),100(users),80(cdwriter),22(cdrom),81(audio),19(proc),83(radio),440(camera),71(floppy),466(xgrp),467(scanner),14(uucp),483(fuse),488(video),481(vboxusers),455(vboxadd),454(vboxsf)<br>
    # roleadd 'I-s' localadmins<br>
    # roleadd 'I-s' wheel<br>
    # rolelst<br>
    users:cdwriter,cdrom,audio,proc,radio,camera,floppy,xgrp,scanner,uucp,fuse,video,vboxusers,vboxadd<br>
    localadmins:wheel,remote,vboxusers,vboxadd<br>
    пользователи домена:users<br>
    администраторы домена:localadmins<br>
    I-s:localadmins<br>
    powerusers:remote,vboxadd,vboxusers<br>
    vboxadd:vboxsf<br>
    # exit<br>
    $ exit<br>
    $ ssh -X tuser@thost1<br>
    $ su -<br>
    # id tuser<br>
    uid=1-9(tuser) gid=1-3(пользователи домена) группы=1-3(пользователи домена),11-0(пользователи филиалы),1-9(i-n),1-0(I-s),1-1(tusert_users),1-8(администраторы dhcp),100(users),80(cdwriter),22(cdrom),81(audio),19(proc),83(radio),440(camera),71(floppy),466(xgrp),467(scanner),14(uucp),483(fuse),488(video),481(vboxusers),455(vboxadd),454(vboxsf),101(localadmins),10(wheel),110(remote)<br>
    <strong>Task:</strong><br>
    Добавить сетевые папки<br>
    <strong>Decision:</strong><br>
    # apt-get install autofs<br>
    # vim /etc/auto.master<br>
    # cat /etc/auto.master<br>
    # Fothostat of this file:<br>
    # mountpoint map options<br>
    # For details of the fothostat look at autofs(8).<br>
    /mnt/auto&nbsp;&nbsp; /etc/auto.tab&nbsp;&nbsp; -t 5<br>
    /mnt/net&nbsp;&nbsp;&nbsp; /etc/auto.avahi -t 120<br>
    /mnt/.tdirectory&nbsp; /etc/auto.samba --ghost<br>
    # vim /etc/auto.samba<br>
    # cat /etc/auto.samba<br>
    s&nbsp;&nbsp;&nbsp; -fstype=cifs,multiuser,cruid=$USER,sec=krb5,domain=thost.ru,vers=1.0 ://thost/tdirectory1<br>
    o&nbsp;&nbsp;&nbsp; -fstype=cifs,multiuser,cruid=$USER,sec=krb5,domain=thost.ru,vers=1.0 ://thost/tdirectory2<br>
    # systemctl enable autofs<br>
    # systemctl start autofs<br>
    # ls -la /mnt/.tdirectory/<br>
    drwxr-xr-x 4 root root&nbsp;&nbsp;&nbsp; 0 авг 11 14:09 .<br>
    drwxr-xr-x 5 root root 4096 авг 11 14:09 ..<br>
    d????????? ? ?&nbsp;&nbsp;&nbsp; ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? o<br>
    d????????? ? ?&nbsp;&nbsp;&nbsp; ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? s<br>
    <strong>Task:</strong><br>
    Creating a Network Bridge interface<br>
    <strong>Decision:</strong><br>
    # mkdir /etc/net/ifaces/tethernet1<br>
    # cp /etc/net/ifaces/tethernet/* /etc/net/ifaces/tethernet1<br>
    # rm -f /etc/net/ifaces/tethernet/{i,r}*<br>
    # ls /etc/net/ifaces/tethernet1/<br>
    ipv4address&nbsp; options&nbsp; resolv.conf<br>
    # cat /etc/net/ifaces/tethernet1/options<br>
    BOOTPROTO=dhcp<br>
    TYPE=eth<br>
    NM_CONTROLLED=yes<br>
    DISABLED=yes<br>
    CONFIG_WIRELESS=no<br>
    SYSTEMD_BOOTPROTO=dhcp4<br>
    CONFIG_IPV4=yes<br>
    SYSTEMD_CONTROLLED=no<br>
    # vim /etc/net/ifaces/tethernet1/options<br>
    # ls /etc/net/ifaces/<br>
    default&nbsp; tethernet&nbsp; lo&nbsp; unknown&nbsp; tethernet1<br>
    # vim /etc/net/ifaces/tethernet1/options<br>
    # vim /etc/net/ifaces/tethernet1/options<br>
    # cat /etc/net/ifaces/tethernet1/options<br>
    BOOTPROTO=static<br>
    CONFIG_WIRELESS=no<br>
    CONFIG_IPV4=yes<br>
    HOST='tethernet'<br>
    ONBOOT=yes<br>
    TYPE=bri<br>
    # ls /etc/net/ifaces/tethernet/<br>
    ipv4address&nbsp; options&nbsp; resolv.conf<br>
    # service network restart<br>
    <strong>Task:</strong><br>
    Настройка сервера Postgresql+Pgadmin<br>
    <strong>Decision:</strong><br>
    # apt-get update<br>
    # apt-get install postgresql12-server<br>
    # /etc/init.d/postgresql initdb<br>
    # systemctl start postgresql<br>
    # systemctl enable postgresql<br>
    # pg_isready<br>
    <strong>Decision:</strong><br>
    # psql -U postgres<br>
    postgres=# CREATE USER tbuser WITH PASSWORD 'tbpassword';<br>
    postgres=# CREATE DATABASE tbbase;<br>
    postgres=# GRANT ALL PRIVILEGES ON DATABASE tbbase to tbuser;<br>
    postgres=# psql -U postgres -c "\l+"<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Список баз данных<br>
    &nbsp;&nbsp;&nbsp;&nbsp; Имя&nbsp;&nbsp;&nbsp;&nbsp; | Владелец | Кодировка | LC_COLLATE&nbsp; |&nbsp; LC_CTYPE&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; Права доступа&nbsp;&nbsp;&nbsp;&nbsp; | Размер&nbsp; | Табл. пространство |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Опис<br>
    ание&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
    -------------+----------+-----------+-------------+-------------+-----------------------+---------+--------------------+----------------------<br>
    ----------------------<br>
    &nbsp;tbbase | postgres | UTF8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ru_RU.UTF-8 | ru_RU.UTF-8 | =Tc/postgres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +| 8041 kB | pg_default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | postgres=CTc/postgres+|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | tbuser=CTc/postgres&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    &nbsp;postgres&nbsp;&nbsp;&nbsp; | postgres | UTF8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ru_RU.UTF-8 | ru_RU.UTF-8 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8185 kB | pg_default&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | default administrativ<br>
    e connection database<br>
    ...<br>
    postgres=# \c tbbase<br>
    tbbase=# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "tbuser";<br>
    tbbase=# ALTER DATABASE tbbase OWNER TO tbuser;<br>
    tbbase=# \q<br>
    <strong>Task:</strong><br>
    Сделаем так, чтобы с клиентской машины Redos мы могли подключаться к серверу AltLinux удаленно<br>
    <strong>Decision:</strong><br>
    # su - postgres -c "psql -c 'SHOW config_file;'"<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config_file&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
    -------------------------------------<br>
    &nbsp;/var/lib/pgsql/data/postgresql.conf<br>
    (1 строка)<br>
    # echo "listen_addresses = 'IpAddr3, IpAddr2, thost1'" &gt;&gt; /var/lib/pgsql/data/postgresql.conf<br>
    # cat /var/lib/pgsql/data/pg_hba.conf<br>
    ...<br>
    # "local" is for Unix domain socket connections only<br>
    local&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    # IPv4 local connections:<br>
    host&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 127.0.0.1/32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    ...<br>
    # vim /var/lib/pgsql/data/pg_hba.conf<br>
    # cat /var/lib/pgsql/data/pg_hba.conf | grep '10.38.'<br>
    # "local" is for Unix domain socket connections only<br>
    local&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    # IPv4 local connections:<br>
    host&nbsp;&nbsp;&nbsp; tbbase&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tbuser&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IpAddr2/21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; md5<br>
    host&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 127.0.0.1/32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trust<br>
    # systemctl restart postgresql<br>
    # systemctl status postgresql<br>
    $ psql -d tbbase -U tbuser -h thost1<br>
    <strong>Task:</strong><br>
    Для работы с базой в графическом интерфейсе установим Pgadmin<br>
    <strong>Decision:</strong><br>
    # apt-get install pgadmin3<br>
    # pgadmin3 &amp;<br>
    &nbsp;&nbsp; &nbsp;add server - name - tbuser - host - thost1- password - tbpassword - ok<br>
    # dnf install postgresql-server<br>
    # postgresql-setup initdb<br>
    # systemctl enable postgresql<br>
    # systemctl start postgresql<br>
    # pg_isready<br>
    $ psql -d tbbase -U tbuser -h thost1<br>
    tbbase=&gt; \du<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Список ролей<br>
    &nbsp;Имя роли |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Атрибуты&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Член ролей<br>
    ----------+-------------------------------------------------------------------------+------------<br>
    &nbsp;tbuser&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | {}<br>
    &nbsp;postgres | Суперпользователь, Создаёт роли, Создаёт БД, Репликация, Пропускать RLS | {}<br>
    <strong>Decision:</strong><br>
    $ sudo dnf install pgadmin4 pgadmin4-qt<br>
    $ pgadmin4-qt &amp;<br>
    &nbsp;&nbsp; &nbsp;root's password - add server - name - tbuser - host - thost1- password - tbpassword - ok<br>
    <strong>Task:</strong><br>
    Создать таблицы. В первой таблице отметим в каких зданиях находятся кабинеты.<br>
    <strong>Decision:</strong><br>
    CREATE TABLE offices (<br>
    &nbsp; id SERIAL PRIMARY KEY,<br>
    &nbsp; office VARCHAR,<br>
    &nbsp; building VARCHAR<br>
    );<br>
    INSERT INTO offices (office, building)<br>
    VALUES ('1', 'Улица1'),<br>
    ('2', 'Улица1'),<br>
    ('3', 'Улица1'),<br>
    ('4', 'Улица2'),<br>
    ('5', 'Улица2'),<br>
    ('6', 'Улица2'),<br>
    ('7', 'Улица2'),<br>
    ('8', 'Улица2'),<br>
    ('9', 'Улица2');<br>
    SELECT * FROM offices;<br>
    +====+========+===============+<br>
    | id | office | building&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+========+===============+<br>
    | 1&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp; | Улица1&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 2&nbsp; | 2&nbsp;&nbsp;&nbsp;&nbsp; | Улица1&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 3&nbsp; | 3&nbsp;&nbsp;&nbsp;&nbsp; | Улица1&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 4&nbsp; | 4&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 5&nbsp; | 5&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 6&nbsp; | 6&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 7&nbsp; | 7&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 8&nbsp; | 8&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    | 9&nbsp; | 9&nbsp;&nbsp;&nbsp; | Улица2&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;|<br>
    +----+--------+---------------+<br>
    <strong>Task:</strong><br>
    Вторая таблица отвечает за названия оборудований<br>
    <strong>Decision:</strong><br>
    CREATE TABLE devices (<br>
    &nbsp; id SERIAL PRIMARY KEY,<br>
    &nbsp; device VARCHAR,<br>
    &nbsp; title VARCHAR<br>
    );<br>
    INSERT INTO devices (device, title)<br>
    VALUES ('Atc', 'Panasonic kx-tda100ru'),<br>
    ('Bидеокамера белая', NULL),<br>
    ('Интерактиная доска с короткофокусным проектором', 'Promethean activeboard i78 mount dlp'),<br>
    ('Колонки', 'Sven sps-605'),<br>
    ('Компьютер', 'Nuc'),<br>
    ('Программно-аапаратный комплекс', 'Vipnet coordinator hw 1000'),<br>
    ('Сетевой фильтр', 'Sven platinum'),<br>
    ('Маршрутизатор', 'Mtuserrottuser'),<br>
    ('Сетевой фильтр', 'Makel с заземлением mpg 137'),<br>
    ('Роутер', 'Mtuserrottuser browder rb9516'),<br>
    ('Dvd-плеер', 'Pioner dv-310-k'),<br>
    ('Акустическая система', 'Electrovoice'),<br>
    ('Коммутатор', 'Kramer'),<br>
    ('Масштабатор видео и графики', 'Kramer'),<br>
    ('Микрофон делегата настольный', NULL),<br>
    ('Микрофонная стойка', 'Qutuser lok a300'),<br>
    ('Мультимедийный проектор', 'Epson eb-965h'),<br>
    ('Пульт микшерский', 'Soundcraft epm8'),<br>
    ('Система вентилляции и кондиционирования', NULL),<br>
    ('Эран моторизированный', 'Projecta compact electrol'),<br>
    ('Ноутбук', 'Acer aspire as5560g-4333g32mn'),<br>
    ('Bидеокамера серая', NULL),<br>
    ('Микрофон', 'Shure sh58'),<br>
    ('Акустическая система', 'Mackie sr1530z'),<br>
    ('Сетевой фильтр', 'Sven optima'),<br>
    ('Сетевой фильтр', 'Surge protector'),<br>
    ('Мультимедийный проектор', 'Optima ex612'),<br>
    ('Экран настенный', 'Screenmedia economy-p'),<br>
    ('Колонки', 'Logitech s120'),<br>
    ('Компьютер', 'Nuc mini pc kit'),<br>
    ('Сетевой фильтр', 'Pc pet'),<br>
    ('Интерактиная доска', '80'),<br>
    ('Короткофокусный проектор', 'Benq'),<br>
    ('Колонки', 'Microlab solo 1'),<br>
    ('Акустическая система', 'Eurosound eg-26w 2*6'),<br>
    ('Микшерный пульт', 'Eurosound compact-802'),<br>
    ('Планшет графический', 'Wacom pl-1600'),<br>
    ('Телевизор плазменный', 'Lg 50pa6500'),<br>
    ('Усилитель мощности', 'Eurosound xz-400'),<br>
    ('8 port video splitter', NULL);<br>
    SELECT * FROM devices;<br>
    +====+=================================================+======================================+<br>
    | id | device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+=================================================+======================================+<br>
    | 1&nbsp; | Atc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Panasonic kx-tda100ru&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 2&nbsp; | Bидеокамера белая&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 3&nbsp; | Интерактиная доска с короткофокусным проектором | Promethean activeboard i78 mount dlp |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 4&nbsp; | Колонки&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Sven sps-605&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 5&nbsp; | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Nuc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 6&nbsp; | Программно-аапаратный комплекс&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Vipnet coordinator hw 1000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 7&nbsp; | Сетевой фильтр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Sven platinum&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 8&nbsp; | Маршрутизатор&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Mtuserrottuser&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 9&nbsp; | Сетевой фильтр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Makel с заземлением mpg 137&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 10 | Роутер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Mtuserrottuser browder rb9516&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 11 | Dvd-плеер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Pioner dv-310-k&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 12 | Акустическая система&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Electrovoice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 13 | Коммутатор&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Kramer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 14 | Масштабатор видео и графики&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Kramer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 15 | Микрофон делегата настольный&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 16 | Микрофонная стойка&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Qutuser lok a300&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 17 | Мультимедийный проектор&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Epson eb-965h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 18 | Пульт микшерский&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Soundcraft epm8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 19 | Система вентилляции и кондиционирования&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 20 | Эран моторизированный&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Projecta compact electrol&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 21 | Ноутбук&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Acer aspire as5560g-4333g32mn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 22 | Bидеокамера серая&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 23 | Микрофон&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Shure sh58&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 24 | Акустическая система&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Mackie sr1530z&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 25 | Сетевой фильтр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Sven optima&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 26 | Сетевой фильтр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Surge protector&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 27 | Мультимедийный проектор&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Optima ex612&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 28 | Экран настенный&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Screenmedia economy-p&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 29 | Колонки&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Logitech s120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 30 | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Nuc mini pc kit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 31 | Сетевой фильтр&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Pc pet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 32 | Интерактиная доска&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 33 | Короткофокусный проектор&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Benq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 34 | Колонки&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Microlab solo 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 35 | Акустическая система&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Eurosound eg-26w 2*6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 36 | Микшерный пульт&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Eurosound compact-802&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 37 | Планшет графический&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Wacom pl-1600&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 38 | Телевизор плазменный&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Lg 50pa6500&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 39 | Усилитель мощности&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Eurosound xz-400&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    | 40 | 8 port video splitter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +----+-------------------------------------------------+--------------------------------------+<br>
    <strong>Task:</strong><br>
    Третья таблица отвечает за инвентарные номера оборудований, кабинетов и даты изменения<br>
    <strong>Decision:</strong><br>
    CREATE TABLE inventories (<br>
    &nbsp; id SERIAL PRIMARY KEY,<br>
    &nbsp; inventory VARCHAR,<br>
    &nbsp; device_id INT REFERENCES devices(id),<br>
    &nbsp; office_id INT REFERENCES offices(id),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp; quantity INT,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
    &nbsp; date TIMESTAMP<br>
    );<br>
    INSERT INTO inventories (inventory, device_id, office_id, quantity, date)<br>
    VALUES ('457', '1', '1', '1', '2017-12-12 12:12:12'),<br>
    (NULL, '2', '1', '1', '2017-12-12 12:12:12'),<br>
    ...<br>
    ('750', '30', '6', '1', '2021-09-12 12:12:12'),<br>
    ('707', '17', '6', '1', '2020-05-12 12:12:12'),<br>
    ('008', '4', '6', '1', '2020-09-12 12:12:12'),<br>
    ('010', '34', '9', '1', '2017-12-12 12:12:12'),<br>
    ('650', '5', '9', '1', '2017-12-12 12:12:12'),<br>
    ('556', '33', '9', '1', '2017-12-12 12:12:12'),<br>
    ('426', '32', '9', '1', '2017-12-12 12:12:12');<br>
    SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory&nbsp;&nbsp; | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1&nbsp; | 457&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 62 | 750&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2021-09-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 63 | 707&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2020-05-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 64 | 008&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2020-09-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 65 | 010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 66 | 650&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 67 | 556&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    <strong>Task:</strong><br>
    Мне нужно вывести информацию, где в первом столбце будет инвентарные номера, во втором столбце, устройство и его название, а в третьем столбце вывести кабинеты, где находятся те самые оборудования<br>
    <strong>Decision:</strong><br>
    SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='6';<br>
    +=============+=========================+=================+========+<br>
    | inventory&nbsp;&nbsp; | device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | office |<br>
    +=============+=========================+=================+========+<br>
    | 008&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Колонки&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Sven sps-605&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    | 707&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Мультимедийный проектор | Epson eb-965h&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    | 750&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Nuc mini pc kit | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+-------------------------+-----------------+--------+<br>
    <strong>Task:</strong><br>
    Заметил ошибку в таблице, есть лишнее оборудование в кабинете. его на самом деле нету в кабинете и значит не должно быть в таблице.<br>
    <strong>Decision:</strong><br>
    DELETE FROM inventories<br>
    WHERE id='64';<br>
    SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='6';<br>
    +===========+=========================+=================+========+<br>
    | inventory | device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | office |<br>
    +===========+=========================+=================+========+<br>
    | 707&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Мультимедийный проектор | Epson eb-965h&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-----------+-------------------------+-----------------+--------+<br>
    | 750&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Nuc mini pc kit | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-----------+-------------------------+-----------------+--------+<br>
    SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory&nbsp;&nbsp; | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1&nbsp; | 457&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 62 | 750&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 30&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2021-09-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 63 | 707&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2020-05-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 65 | 010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 66 | 650&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 67 | 556&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    <strong>Task:</strong><br>
    Появилось новое обрудование, и нужно его внести в таблицу.<br>
    <strong>Decision:</strong><br>
    INSERT INTO inventories (inventory, device_id, office_id, quantity, date)<br>
    VALUES ('testinv1', '39', '1', '1', '2017-12-12 12:12:12');<br>
    SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory&nbsp;&nbsp; | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1&nbsp; | 457&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 69 | testinv1&nbsp;&nbsp;&nbsp; | 39&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    <strong>Task:</strong><br>
    в предыдущей задаче не верные данные внес в таблицу, нужно подкорректировать.<br>
    <strong>Decision:</strong><br>
    UPDATE inventories<br>
    SET inventory='testinv2', office_id='9'<br>
    WHERE id='69';<br>
    SELECT * FROM inventories;<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | id | inventory&nbsp;&nbsp; | device_id | office_id | quantity | date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +====+=============+===========+===========+==========+=====================+<br>
    | 1&nbsp; | 457&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 2&nbsp; | (null)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    ...<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 68 | 426&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    | 69 | testinv2&nbsp;&nbsp;&nbsp; | 39&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2017-12-12 12:12:12 |<br>
    +----+-------------+-----------+-----------+----------+---------------------+<br>
    SELECT inventory, device, title, office<br>
    FROM inventories<br>
    INNER JOIN devices<br>
    ON inventories.device_id = devices.id<br>
    INNER JOIN offices<br>
    ON inventories.office_id = offices.id<br>
    WHERE office_id='9';<br>
    +=============+==========================+==================+========+<br>
    | inventory&nbsp;&nbsp; | device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | office |<br>
    +=============+==========================+==================+========+<br>
    | 650&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Компьютер&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Nuc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 426&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Интерактиная доска&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 556&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Короткофокусный проектор | Benq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | 010&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Колонки&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Microlab solo 1&nbsp; | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+--------------------------+------------------+--------+<br>
    | testinv2&nbsp;&nbsp;&nbsp; | Усилитель мощности&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Eurosound xz-400 | 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
    +-------------+--------------------------+------------------+--------+<br>
    <strong>Source:</strong>
</p>
<ul>
    <li>
        <a href="https://www.altlinux.org/ActiveDirectory/Login#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2">https://www.altlinux.org/ActiveDirectory/Login#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%BF%D0%B0%D0%BA%D0%B5%D1%82%D0%BE%D0%B2</a>
    </li>
    <li>
        <a href="https://www.altlinux.org/SSSD/AD">https://www.altlinux.org/SSSD/AD</a>
    </li>
    <li>
        <a href="https://www.altlinux.org/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B9_%D0%BC%D0%BE%D1%81%D1%82">https://www.altlinux.org/%D0%A1%D0%B5%D1%82%D0%B5%D0%B2%D0%BE%D0%B9_%D0%BC%D0%BE%D1%81%D1%82</a>
    </li>
    <li>
        <a href="https://www.altlinux.org/PostgreSQL#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA">https://www.altlinux.org/PostgreSQL#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA</a>
    </li>
    <li>
        <a href="https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/">https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/</a>
    </li>
    <li>
        <a href="https://o7planning.org/11353/install-pgadmin-on-ubuntu">https://o7planning.org/11353/install-pgadmin-on-ubuntu</a>
    </li>
    <li>
        <a href="https://redos.red-soft.ru/base/server-configuring/dbms/install-postgresql/?sphrase_id=53348">https://redos.red-soft.ru/base/server-configuring/dbms/install-postgresql/?sphrase_id=53348</a>
    </li>
    <li>
        <a href="https://redos.red-soft.ru/base/server-configuring/dbms/pgadmin4/">https://redos.red-soft.ru/base/server-configuring/dbms/pgadmin4/</a>
    </li>
</ul>