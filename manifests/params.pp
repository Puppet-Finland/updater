#
# == Class: updater::params
#
# Defines some variables based on the operating system
#
class updater::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            $updater_package = 'yum-cron'
        }
        'Debian': {
            $updater_package = 'cron-apt'
            $updater_cron_command = '/usr/sbin/cron-apt'
        }
        default: {
            fail("Unsupported operating system ${::osfamily}!")
        }
    }
}
