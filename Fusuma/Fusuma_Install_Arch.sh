 #!/usr/bin/env bash
yay -Syu ruby # Install Ruby
if [[bash: yay: command not found]]
then
    <
        # Install yay
        echo Yay not found, installing
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        # Install Fusuma and Fusuma Plugins
        sudo gem install fusuma --no-user-install
        # Install Fusuma Sendkey plugin dependencies
        yay -S libevdev base-devel
        sudo gem install revdev --no-user-install
        sudo gem install bundler --no-user-install
        # Install Fusuma Sendkey plugin
        sudo gem install fusuma-plugin-sendkey --no-user-install
        yay -S wmctrl # Install wmctrl
        sudo gem install fusuma-plugin-wmctrl --no-user-install # Install Fusuma wmctrl plugin
        sudo gem install --no-user-install fusuma-plugin-keypress # Install Fusuma Kepress plugin
        sudo gem install fusuma-plugin-tap --no-user-install # Install Fusuma Tap plugin

        # Install Fusuma System Service
        cp -r Fusuma.sh ~/
        sudo cp -r fusuma.service /lib/systemd/system/fusuma.service
        sudo systemctl daemon-reload # Reload Systemctl Daemons
        sudo systemctl enable fusuma.service

        # Install my custom fusuma config
        mkdir -p ~/.config/fusuma
        cp -r config.yml ~/.config/fusuma && sudo cp -r config.yml /usr/lib/ruby/gems/3.0.0/gems/fusuma-2.5.1/lib/fusuma

        # Start Fusuma
        sudo systemctl start fusuma.service
    >
else
    <
        # Install Fusuma and Fusuma Plugins
        sudo gem install fusuma --no-user-install
        # Install Fusuma Sendkey plugin dependencies
        yay -S libevdev base-devel
        sudo gem install revdev --no-user-install
        sudo gem install bundler --no-user-install
        # Install Fusuma Sendkey plugin
        sudo gem install fusuma-plugin-sendkey --no-user-install
        yay -S wmctrl # Install wmctrl
        sudo gem install fusuma-plugin-wmctrl --no-user-install # Install Fusuma wmctrl plugin
        sudo gem install --no-user-install fusuma-plugin-keypress # Install Fusuma Kepress plugin
        sudo gem install fusuma-plugin-tap --no-user-install # Install Fusuma Tap plugin

        # Install Fusuma System Service
        cp -r Fusuma.sh ~/
        sudo cp -r fusuma.service /lib/systemd/system/fusuma.service
        sudo systemctl daemon-reload # Reload Systemctl Daemons
        sudo systemctl enable fusuma.service

        # Install my custom fusuma config
        mkdir -p ~/.config/fusuma
        cp -r config.yml ~/.config/fusuma && sudo cp -r config.yml /usr/lib/ruby/gems/3.0.0/gems/fusuma-2.5.1/lib/fusuma

        # Start Fusuma
        sudo systemctl start fusuma.service
        nano Install_Completed.txt

    >
fi
