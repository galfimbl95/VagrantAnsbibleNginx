ENV['VAGRANT_SERVER_URL'] = 'https://vagrant.elab.pro'

Vagrant.configure("2") do |nginxsrv|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_ed25519.pub").first.strip
    nginxsrv.vm.box = "ubuntu/focal64"
    nginxsrv.vm.hostname = "nginxsrv"
    nginxsrv.vm.network "private_network", ip: "192.168.56.50"

    # Подготовка пользователя
    nginxsrv.vm.provision "shell", inline: <<-SHELL

        # Создание пользователя user
        useradd -d /home/user/ -m -G sudo user

        # Наводим красоту, чтобы работали автокомплиты, алиасы и т.д.
        # cp /home/vagrant/.bashrc /home/user/.bashrc
        # cp /home/vagrant/.profile /home/user/.profile

        # Копирование ssh ключа с хоста в виртуальную машину
        mkdir /home/user/.ssh/
        chmod 0700 /home/user/.ssh/
        chown -R user:user /home/user/.ssh/
        echo #{ssh_pub_key} >> /home/user/.ssh/authorized_keys

        # Разрешаем пользователю user выполнять sudo без пароля
        touch /etc/sudoers.d/user
        echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
    SHELL
end