# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    nodes = {
        'dev_blog' => { :ip  => '10.30.30.10', :memory => 768 }
    }

    nodes.each do |node_name, node_opts|
        config.vm.define node_name do |node_config|
            node_config.vm.hostname = "#{node_name}}"
            node_config.vm.box = "centos65-x86_64-20131205.box"
            node_config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"


            node_config.vm.network :private_network, ip: node_opts[:ip]
            node_config.vm.network :forwarded_port, host: 4000, guest: 4000
            node_config.vm.synced_folder(".", nil, :disabled => true, :id => "vagrant-root")

            node_config.vm.provider "virtualbox" do |v|
                v.gui = false
                unless node_opts[:memory].nil?
                    modifyvm_args = ['modifyvm', :id]
                    modifyvm_args << '--memory' << node_opts[:memory].to_s
                    v.customize(modifyvm_args)
                end
            end

            config.vm.provision :shell do |s|
              s.path = "yum_packages.sh"
              s.args = "git nano"
            end

            config.vm.provision :shell, :path => "ruby.sh"
            config.vm.provision :shell, :path => "blog_setup.sh"
    end
end
