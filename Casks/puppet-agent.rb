cask 'puppet-agent' do
  if MacOS.version == :yosemite
    version '5.5.0-1'
    sha256 '3f30c36e9b39763839148aaea400193c7b52d8feea2765121f6dabace658ec25'
    # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
    url "https://downloads.puppetlabs.com/mac/puppet/10.10/x86_64/puppet-agent-#{version}.osx10.10.dmg"
    appcast 'https://downloads.puppetlabs.com/mac/puppet/10.10/x86_64/'
  elsif MacOS.version == :el_capitan
    version '5.5.0-1'
    sha256 'fe60c24d2b964f161599bf4594c9e871f161707375b81c6b1e998e8cfce13058'
    # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
    url "https://downloads.puppetlabs.com/mac/puppet/10.11/x86_64/puppet-agent-#{version}.osx10.11.dmg"
    appcast 'https://downloads.puppetlabs.com/mac/puppet/10.11/x86_64/'
  elsif MacOS.version == :sierra
    version '5.5.3-1'
    sha256 '89447a9dbe11facc046266f14c2b1c20cde6547fd015cf554e9b78245d69899d'
    # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
    url "https://downloads.puppetlabs.com/mac/puppet/10.12/x86_64/puppet-agent-#{version}.osx10.12.dmg"
    appcast 'https://downloads.puppetlabs.com/mac/puppet/10.12/x86_64/'
  else
    version '5.5.3-1'
    sha256 '8d86568968d0b950095e23f46832302f50fba2f88452e7504c4e1c3d0418bf46'
    # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
    url "https://downloads.puppetlabs.com/mac/puppet/10.13/x86_64/puppet-agent-#{version}.osx10.13.dmg"
    appcast 'https://downloads.puppetlabs.com/mac/puppet/10.13/x86_64/'
  end

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  depends_on macos: '>= :yosemite'

  pkg "puppet-agent-#{version}-installer.pkg"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                         'mcollective',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
