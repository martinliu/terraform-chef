name 'mydocker'
maintainer 'Martin Liu'
maintainer_email '67120666@qq.com'
license 'All Rights Reserved'
description 'Installs/Configures mydocker'
long_description 'Installs/Configures mydocker'
version '0.2.4'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'docker', '~> 4.1.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/mydocker/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/mydocker'
