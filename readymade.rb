Monsoon::Readymade.configure do |readymade|

  readymade.name             = "mtx-cookbooks"
  readymade.description      = "Create fast and easy Debian/Ubuntu boxes on Monsoon"
  readymade.version          = "0.0.1"
  readymade.maintainer       = "Motorox"
  readymade.maintainer_email = "motorox.srl@gmail.com"

  # Define Templates
  # ===============================================================================
  #
  # These templates are being used for inital provisioning of instances. They
  # are also available on the UI, and can there be used to create a predefined
  # instance.
  #
  #readymade.template :app do |template|
  #  template.type         = "large_6_6"
  #  template.image.name   = "RHEL6-x86_64"

  #  template.add_tag "color", "blue"
  #  template.add_tag "prio",  "low"

  #  template.provision :chef do |chef|
  #    chef.timeout   = 600
  #    chef.log_level = :info

  #    chef.provision_attributes = {
  #      nginx: = {user: "test"}
  #    }

  #    chef.add_recipe "sap-nginx"
  #  end

  #  template.volume :vol0 do |volume|
  #    volume.capacity = 1
  #    volume.add_tag "nfs", "yes"
  #    volume.add_tag "acl", "everyone"
  #  end
  #end


  # Define Instances
  # ================================================================================
  #
  # Any instances defined here will be created when the automation is enabled
  # on a project.
  #
  # Set the node to a template defined above.
  #

  #readymade.instance :app0 do |instance|
  #  instance.template = :app
  #end


  readymade.template :"Ubuntu12.04 small" do |template|
    template.type         = "small_1_1"
    template.image.name   = "UBUNTU1204-x86_64"

    template.add_tag "color", "green"
    template.add_tag "prio",  "low"
    template.add_tag "shortName", "Poritrin"

    template.provision :chef do |chef|
      chef.timeout   = 1200
      chef.log_level = :debug

      chef.add_recipe "ubuntu"
      chef.add_recipe "sap-golang"
    end

    template.volume :vol0 do |volume|
      volume.capacity = 1
      volume.add_tag "nfs", "yes"
      volume.add_tag "acl", "everyone"
    end
  end

  readymade.template :"Debian small" do |template|
    template.type         = "small_1_1"
    template.image.name   = "DEBIAN7-x86_64"

    template.add_tag "color", "purple"
    template.add_tag "prio",  "low"
    template.add_tag "shortName", "Rossak"

    template.provision :chef do |chef|
      chef.timeout   = 1200
      chef.log_level = :debug

      chef.add_recipe "ubuntu"
      chef.add_recipe "sap-golang"
    end

#    template.volume :vol0 do |volume|
#      volume.capacity = 1
#      volume.add_tag "nfs", "yes"
#      volume.add_tag "acl", "everyone"
#    end
  end


  # Define Instances
  # ================================================================================
  #
  # Any instances defined here will be created when the automation is enabled
  # on a project.
  #
  # Set the node to a template defined above.
  #

  readymade.instance :gobuntu do |instance|
    instance.template = :"Ubuntu12.04 small"
  end

end
