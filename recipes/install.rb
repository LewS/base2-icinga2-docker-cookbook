package 'tmux'
package 'lvm2'
package 'xfsprogs.x86_64'
package 'python27-jinja2'
package 'python27-pip'
package 'libcgroup'

unless node['base2']['environment']['platform'] == 'azure'
  service 'cgconfig' do
    action [:enable]
  end
end

package "docker"

service 'docker' do
  action [:enable]
end

include_recipe "base2-icinga2-docker::build_container"
