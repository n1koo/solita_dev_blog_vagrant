# -*- mode: ruby -*-
# vi: set ft=ruby :


BLOG_PATH = "../solita.github.com/"

Vagrant.configure("2") do |config|

    nodes = {
        'dev-blog' => { :ip  => '10.30.30.10', :memory => 512, :cpu => 1 }
    }

    nodes.each do |node_name, node_opts|
        config.vm.define node_name do |node_config|
            node_config.vm.hostname = "#{node_name}"
            node_config.vm.box = "centos65-x86_64-20131205.box"
            node_config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

            node_config.vm.network :private_network, ip: node_opts[:ip]
            node_config.vm.network :forwarded_port, host: 4000, guest: 4000

            config.vm.synced_folder "#{BLOG_PATH}", "/home/vagrant/solita.github.com/"

            node_config.vm.provider "virtualbox" do |v|
                v.gui = false
                unless node_opts[:memory].nil?
                    modifyvm_args = ['modifyvm', :id]
                    modifyvm_args << '--memory' << node_opts[:memory].to_s
                    modifyvm_args << '--cpus' << node_opts[:cpu].to_s
                    v.customize(modifyvm_args)
                end
            end
            
            config.vm.provision :shell, :path => "scripts/yum_packages.sh",  :args => "git nano python2.7"
            config.vm.provision :shell, :path => "scripts/install-rvm.sh",  :args => "stable", :privileged => false
            config.vm.provision :shell, :path => "scripts/install-ruby.sh", :args => "2.1.0 bundler", :privileged => false
            config.vm.provision :shell, :path => "scripts/blog_setup.sh", :privileged => false
        end
    end
end
