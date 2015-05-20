default['chef-dash']['package']['version'] = '435+gitca47358'
default['chef-dash']['package']['install_method'] = 'apt'

default['chef-dash']['pipelinestages'] = 3

# Debian Package Repo
default['chef-dash']['debrepo']['url'] = 'https://dash.pingworks.net/debian'
default['chef-dash']['debrepo']['dist'] = 'squeeze'
default['chef-dash']['debrepo']['comp'] = ['main']
default['chef-dash']['debrepo']['keyserver'] = 'keyserver.ubuntu.com'
default['chef-dash']['debrepo']['key'] = 'C18F5E6F'

# Regex
default['chef-dash']['regex']['pname'] = '^[a-zA-Z0-9]+\$'
default['chef-dash']['regex']['bundle'] = '^([a-zA-Z0-9]+-[0-9]+|[a-zA-Z]+\.[0-9]+\.[0-9a-f]+|[0-9]+\.[0-9a-f]+|[0-9]+\.[a-f0-9]+\.[0-9]+)\$'
default['chef-dash']['regex']['branch'] = '^[0-9a-zA-Z_-]+\$'
default['chef-dash']['regex']['stage'] = '^([1234567890]|first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth)\$'
default['chef-dash']['regex']['status'] = '^(passed|in_progress|failed)\$'
default['chef-dash']['regex']['env'] = '^testenv[0-9][0-9]\$'
default['chef-dash']['regex']['content'] = '^(latest|[0-9]+)\$'

# Paths
default['chef-dash']['repodir'] = '/data/repo'
default['chef-dash']['datadir'] = '/data/envs'
default['chef-dash']['contentdir'] = '/data/content'

# Jenkins URL
default['chef-dash']['jenkins']['url'] = "/jenkins"

# Scripts
default['chef-dash']['scripts']['impl'] = 'localfs'
default['chef-dash']['scripts']['sshlogin'] = 'jenkins@dash.int'
default['chef-dash']['scripts']['warnonerror'] = 0
default['chef-dash']['scripts']['locktimeout'] = 30
default['chef-dash']['scripts']['bundlename'] = '${PNAME}.${BUILD_ID}.${REV}'

# Repo Config
default['chef-dash']['repo']['ownerhome'] = '/home/repo'
default['chef-dash']['repo']['owner'] = 'repo'
default['chef-dash']['repo']['group'] = 'repo'

# Backend Config
default['chef-dash']['backend']['defaultbranch'] = 'ALL'

# Frontend Config
default['chef-dash']['frontend']['toolbar']['left']['logourl'] = 'resources/img/icons/Dashboard-green.png'
default['chef-dash']['frontend']['toolbar']['left']['logowidth'] = '48'
default['chef-dash']['frontend']['toolbar']['left']['logoheight'] = '38'
default['chef-dash']['frontend']['toolbar']['left']['title'] = 'Dashboard'
default['chef-dash']['frontend']['toolbar']['links'] = "{
                id: 'JenkinsButton',
                text: 'Jenkins',
                url: '#{node['chef-dash']['jenkins']['url']}/'
            },
            {
                id: 'RepoButton',
                text: 'Repo',
                url: '/repo/'
            },
            {
                id: 'EnvButton',
                text: 'Environments',
                handler: function() {
                    this.findParentByType('toolbar').fireEvent('hideCommentWindow');
                    this.findParentByType('toolbar').fireEvent('hideDeployWindow');
                    this.findParentByType('toolbar').fireEvent('showEnvironmentsWindow');
                }
            }"

default['chef-dash']['frontend']['bundlegrid']['title'] = 'Bundles in Branch: {0}'
default['chef-dash']['frontend']['bundlegrid']['repolink'] = '<a href="/repo/{0}/{1}" target="_blank" style="color: black">{1}</a>'
default['chef-dash']['frontend']['bundlegrid']['vcslink'] = '<a href="https://github.com/pingworks/dash/commit/{1}" target="_blank" style="color: black">{1}</a>'
default['chef-dash']['frontend']['bundlegrid']['vcsrepolink'] = '<a href="https://github.com/pingworks/dash/" target="_blank" style="color: black">{0}</a>'
default['chef-dash']['frontend']['bundlegrid']['reload'] = '300000'
default['chef-dash']['frontend']['bundlegrid']['deployment']['enabled'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['deployment']['required'] = "{
                field: 'stage1',
                value: 3
            }"
default['chef-dash']['frontend']['bundlegrid']['triggerJenkinsJob']['enabled'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['triggerJenkinsJob']['required'] = "{
                field: 'stage1',
                value: 3
            }"

default['chef-dash']['frontend']['bundlegrid']['colwidth']['timestamp'] = '180'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['committer'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['pname'] = '90'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['branch'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['revision'] = '90'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['repository'] = '90'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['bundle'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage1'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage2'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage3'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage4'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage5'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage6'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage7'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage8'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage9'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage10'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['build'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['changes'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['deployment'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['triggerJenkinsJob'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['editComment'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['comment'] = '60'

default['chef-dash']['frontend']['bundlegrid']['label']['timestamp'] = 'Created'
default['chef-dash']['frontend']['bundlegrid']['label']['committer'] = 'Committer'
default['chef-dash']['frontend']['bundlegrid']['label']['pname'] = 'Pline'
default['chef-dash']['frontend']['bundlegrid']['label']['branch'] = 'Branch'
default['chef-dash']['frontend']['bundlegrid']['label']['revision'] = 'CommitId'
default['chef-dash']['frontend']['bundlegrid']['label']['repository'] = 'VCS'
default['chef-dash']['frontend']['bundlegrid']['label']['bundle'] = 'Bundle'
default['chef-dash']['frontend']['bundlegrid']['label']['stage1'] = '1st'
default['chef-dash']['frontend']['bundlegrid']['label']['stage2'] = '2nd'
default['chef-dash']['frontend']['bundlegrid']['label']['stage3'] = '3rd'
default['chef-dash']['frontend']['bundlegrid']['label']['stage4'] = '4th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage5'] = '5th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage6'] = '6th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage7'] = '7th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage8'] = '8th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage9'] = '9th'
default['chef-dash']['frontend']['bundlegrid']['label']['stage10'] = '10th'
default['chef-dash']['frontend']['bundlegrid']['label']['build'] = 'Build'
default['chef-dash']['frontend']['bundlegrid']['label']['changes'] = 'Changes'
default['chef-dash']['frontend']['bundlegrid']['label']['deployment'] = 'Deploy Test'
default['chef-dash']['frontend']['bundlegrid']['label']['triggerJenkinsJob'] = 'Deploy Prod'
default['chef-dash']['frontend']['bundlegrid']['label']['editComment'] = 'Edit Comment'
default['chef-dash']['frontend']['bundlegrid']['label']['comment'] = 'Comment'

default['chef-dash']['frontend']['bundlegrid']['hidden']['timestamp'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['committer'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['pname'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['branch'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['revision'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['repository'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['bundle'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage1'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage2'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage3'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage4'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage5'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage6'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage7'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage8'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage9'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage10'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['build'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['changes'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['deployment'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['triggerJenkinsJob'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['editComment'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['comment'] = 'true'

default['chef-dash']['frontend']['bundlegrid']['flex']['deployment'] = '1'
default['chef-dash']['frontend']['bundlegrid']['flex']['triggerJenkinsJob'] = '1'
default['chef-dash']['frontend']['bundlegrid']['flex']['comment'] = '0'

default['chef-dash']['frontend']['jobresult']['text'] = "<div style=\"white-space: nowrap;\"><img src=\"{6}\" alt=\"{2}\" class=\"{7}\">&nbsp;<a href=\"#{node['chef-dash']['jenkins']['url']}/{1}\" target=\"_blank\">{0}</a>: Tests: {3}, skipped: {4}, failed: {5}</div>"
default['chef-dash']['frontend']['jobresult']['title'] = '{1} stage Jobs for Bundle {2}'

default['chef-dash']['frontend']['build']['triggerRestartUrl'] = "#{node['chef-dash']['jenkins']['url']}/job/Deployment/buildWithParameters?token=Aezei3oph9xu"

default['chef-dash']['frontend']['deployment']['triggerUrl'] = "#{node['chef-dash']['jenkins']['url']}/job/Deployment/buildWithParameters?token=Omi7foh4gu7d"
default['chef-dash']['frontend']['deployment']['showUrl'] = "#{node['chef-dash']['jenkins']['url']}/job/Deployment/"
default['chef-dash']['frontend']['deployment']['feature']['content']['enabled'] = 'false'
default['chef-dash']['frontend']['deployment']['feature']['dbreset']['enabled'] = 'false'

default['chef-dash']['frontend']['triggerJenkinsJob']['triggerUrl'] = "#{node['chef-dash']['jenkins']['url']}/job/DeploymentProd/buildWithParameters?token=Omi7foh4gu7d"
default['chef-dash']['frontend']['triggerJenkinsJob']['showUrl'] = "#{node['chef-dash']['jenkins']['url']}/job/DeploymentProd/"
default['chef-dash']['frontend']['triggerJenkinsJob']['title'] = 'Deployment to production'
default['chef-dash']['frontend']['triggerJenkinsJob']['text'] = 'Do you really want to deploy to production?'
default['chef-dash']['frontend']['triggerJenkinsJob']['inputFields'] = '[]'
default['chef-dash']['frontend']['triggerJenkinsJob']['label']['cancel'] = 'Cancel'
default['chef-dash']['frontend']['triggerJenkinsJob']['label']['run'] = 'Go go go !!'
default['chef-dash']['frontend']['triggerJenkinsJob']['params']['bundle'] = "{
                name: 'branch_bundle',
                value: '{0}:{1}'
            }"



# Development
default['chef-dash']['dev']['senchacmdVersion'] = "4.0.4.84"
default['chef-dash']['dev']['phantomjsVersion'] = "1.9.0"
default['chef-dash']['dev']['seleniumVersion'] = "2.44.0"
default['chef-dash']['dev']['seleniumUrl'] = "http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-#{node['chef-dash']['dev']['seleniumVersion']}.jar"
default['chef-dash']['dev']['srcBaseDir'] = "/opt/app"
default['chef-dash']['dev']['srcDir'] = "dash"
default['chef-dash']['dev']['srcRepoUrl'] = "https://github.com/pingworks/dash.git"
default['chef-dash']['dev']['pgkRepoUrl'] = "http://repo.pingworks.net"
default['chef-dash']['dev']['user'] = "vagrant"
default['chef-dash']['dev']['group'] = "vagrant"
default['chef-dash']['dev']['userHome'] = "/home/vagrant"
