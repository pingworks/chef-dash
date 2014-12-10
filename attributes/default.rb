# Dash Scripts Sources
default['chef-dash']['scripts']['gitrepo']['url'] = 'https://github.com/pingworks/dash.git'

default['chef-dash']['scripts']['install_path'] = '/opt/dash/scripts'
default['chef-dash']['scripts']['config_path'] = '/etc/dash-scripts'

default['chef-dash']['scripts']['config_always_update'] = true

# Repo Config
default['chef-dash']['repo']['dir'] = '/data/repo'
default['chef-dash']['repo']['ownerhome'] = '/home/repo'
default['chef-dash']['repo']['owner'] = 'repo'
default['chef-dash']['repo']['group'] = 'repo'

# Backend Config
default['chef-dash']['backend']['repodir'] = '/data/repo'
default['chef-dash']['backend']['datadir'] = '/data/envs'
default['chef-dash']['backend']['contentdir'] = '/data/content'
default['chef-dash']['backend']['paramregex']['bundle'] = '/^[0-9]+$/'
default['chef-dash']['backend']['paramregex']['branch'] = '/^[0-9a-zA-Z-_]+$/'
default['chef-dash']['backend']['paramregex']['stage'] = '/^[0-9]$/'
default['chef-dash']['backend']['paramregex']['envid'] = '/^testenv[0-9][0-9]$/'
default['chef-dash']['backend']['paramregex']['contentversion'] = '/^(latest|[0-9]+)$/'
default['chef-dash']['backend']['defaultbranch'] = 'develop'

# Frontend Config
default['chef-dash']['frontend']['toolbar']['left']['title'] = 'Dashboard'
default['chef-dash']['frontend']['toolbar']['links'] = "{
                id: 'JenkinsButton',
                text: 'Jenkins',
                url: '/jenkins/'
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
default['chef-dash']['frontend']['bundlegrid']['triggerJenkinsJob']['enabled'] = 'true'

default['chef-dash']['frontend']['bundlegrid']['colwidth']['timestamp'] = '180'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['committer'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['revision'] = '90'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['repository'] = '90'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['bundle'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage1'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage2'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['stage3'] = '40'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['build'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['changes'] = '120'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['deployment'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['triggerJenkinsJob'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['editComment'] = '60'
default['chef-dash']['frontend']['bundlegrid']['colwidth']['comment'] = '60'

default['chef-dash']['frontend']['bundlegrid']['label']['timestamp'] = 'Created'
default['chef-dash']['frontend']['bundlegrid']['label']['committer'] = 'Committer'
default['chef-dash']['frontend']['bundlegrid']['label']['revision'] = 'CommitId'
default['chef-dash']['frontend']['bundlegrid']['label']['repository'] = 'VCS'
default['chef-dash']['frontend']['bundlegrid']['label']['bundle'] = 'Bundle'
default['chef-dash']['frontend']['bundlegrid']['label']['stage1'] = '1st'
default['chef-dash']['frontend']['bundlegrid']['label']['stage2'] = '2nd'
default['chef-dash']['frontend']['bundlegrid']['label']['stage3'] = '3rd'
default['chef-dash']['frontend']['bundlegrid']['label']['build'] = 'Build'
default['chef-dash']['frontend']['bundlegrid']['label']['changes'] = 'Changes'
default['chef-dash']['frontend']['bundlegrid']['label']['deployment'] = 'Deploy Test'
default['chef-dash']['frontend']['bundlegrid']['label']['triggerJenkinsJob'] = 'Deploy Prod'
default['chef-dash']['frontend']['bundlegrid']['label']['editComment'] = 'Edit Comment'
default['chef-dash']['frontend']['bundlegrid']['label']['comment'] = 'Comment'

default['chef-dash']['frontend']['bundlegrid']['hidden']['timestamp'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['committer'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['revision'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['repository'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['bundle'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage1'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage2'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['stage3'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['build'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['changes'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['deployment'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['triggerJenkinsJob'] = 'false'
default['chef-dash']['frontend']['bundlegrid']['hidden']['editComment'] = 'true'
default['chef-dash']['frontend']['bundlegrid']['hidden']['comment'] = 'true'

default['chef-dash']['frontend']['bundlegrid']['flex']['deployment'] = '1'
default['chef-dash']['frontend']['bundlegrid']['flex']['triggerJenkinsJob'] = '1'
default['chef-dash']['frontend']['bundlegrid']['flex']['comment'] = '0'

default['chef-dash']['frontend']['jobresult']['text'] = '<div style="white-space: nowrap;"><img src="{6}" alt="{2}" class="{7}">&nbsp;<a href="/jenkins/{1}" target="_blank">{0}</a>: Tests: {3}, skipped: {4}, failed: {5}</div>'
default['chef-dash']['frontend']['jobresult']['title'] = '{1} stage Jobs for Bundle {2}'

default['chef-dash']['frontend']['build']['triggerRestartUrl'] = '/jenkins/job/Deployment/buildWithParameters?token=Aezei3oph9xu'

default['chef-dash']['frontend']['deployment']['triggerUrl'] = '/jenkins/job/Deployment/buildWithParameters?token=Omi7foh4gu7d'
default['chef-dash']['frontend']['deployment']['showUrl'] = '/jenkins/job/Deployment/'
default['chef-dash']['frontend']['deployment']['feature']['content']['enabled'] = 'false'
default['chef-dash']['frontend']['deployment']['feature']['dbreset']['enabled'] = 'false'

default['chef-dash']['frontend']['triggerJenkinsJob']['triggerUrl'] = '/jenkins/job/DeploymentProd/buildWithParameters?token=Omi7foh4gu7d'
default['chef-dash']['frontend']['triggerJenkinsJob']['showUrl'] = '/jenkins/job/DeploymentProd/'
