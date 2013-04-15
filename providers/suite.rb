SYSCHECK_DEPENDENCIES = %w{bc}

action :nothing do
  provide_script
end

action :run do
  provide_script
  run_script
end

def provide_script
  install_syscheck
  create_script
end

def install_syscheck_dependencies
  SYSCHECK_DEPENDENCIES.each do |pkg|
    package pkg
  end
end

def install_syscheck
  install_syscheck_dependencies
  bash "Install syscheck binary" do
    code %{sh -c "`curl https://raw.github.com/locochris/syscheck/master/install.sh`"}
  end
end

def script_path
  "#{node['syscheck']['syschecks_dir']}/#{new_resource.name}"
end

def create_script
  cookbook_file script_path do
    source new_resource.source
    mode '0755'
  end
end

def run_script
  ruby_block 'Print syscheck output' do
    block do
      puts Mixlib::ShellOut.new(script_path).run_command.stdout
    end
  end
end
