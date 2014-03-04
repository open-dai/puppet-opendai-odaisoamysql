# Class: odaisoamysql
#
# This module manages odaisoamysql
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class odaisoamysql {
  $bam      = hiera('bam', undef)
  $greg      = hiera('greg', undef)
  $am      = hiera('am', undef)
  $bps      = hiera('bps', undef)
  $esb      = hiera('esb', undef)
  class { 'mysql::server':
    config_hash => {
      root_password => hiera('mysqlsoapwd', ""),
      bind_address  => $::ipaddress,
    }
  }
  Mysql::Db <<| tag == $bam["db_tag"] |>>
  Mysql::Db <<| tag == $bps["db_tag"] |>>
  Mysql::Db <<| tag == $am["db_tag"] |>>
  Mysql::Db <<| tag == $greg["db_tag"] |>>
  Mysql::Db <<| tag == $esb["db_tag"] |>>
  Database_user <<| tag == $bam["db_tag"] |>>
  Database_grant <<| tag == $bam["db_tag"] |>>
  Database_user <<| tag == $bps["db_tag"] |>>
  Database_grant <<| tag == $bps["db_tag"] |>>
  Database_user <<| tag == $esb["db_tag"] |>>
  Database_grant <<| tag == $esb["db_tag"] |>>
  Database_user <<| tag == $am["db_tag"] |>>
  Database_grant <<| tag == $am["db_tag"] |>>
  notice("mysql server and Db done")
}
