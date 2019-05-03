# DevEnvInit

## Posh-Git installer
GH4W has been abandoned, but the only thing I really used it for was installing git and posh-git on my system. I've created this script/utility set to replace that.  In particular, I liked the way the powershell was configured so that the posh-git stuff did not pollute an 'ordinary' powershell session.

most of the comments below apply to gitInstConf.cmd.  Scripts for other utilities/scenarios have been separated into envInstConf.cmd, gitSSLConf.cmd (just rebundles the windows certs), and minbootstrap.cmd

As far as I can tell, GH4W did the following:
* Install/Configure portable git
* Install/Configure gitpad
* Install Posh-Git
* bundle the Windows root CAs into the git ssl ca list
* create shortcuts
* create a SSH key in github

My utility does all of that (maybe not so well) except for the SSH key.  I use choclately to install Git (not portable) and Posh-Git

The GH4W put many of the settings in the system .gitconfig, which I don't really agress with, but I've copied for now

Some of the settings are my own preferences:
* the posh-git color overrides
* use p4 for diff/merge
* git alias and color settings

I've also configured things the way they are if you select the powershell option (as opposed to git bash or cmd)

Biggest TODO is to handle upgrades to installed components
git for windows can also now be installed to use schannel, making the bundling of the windows certs unnecessary

## Credits
* git logo/icon: https://git-scm.com/downloads/logos
* powershell icon: ??
* overlay idea based on: https://www.hanselman.com/blog/AwesomeVisualStudioCommandPromptAndPowerShellIconsWithOverlays.aspx
* Get-Link.ps1: https://github.com/neilpa/cmd-colors-solarized
* pscolor.ps1: based on Update-Link.ps1 from https://github.com/neilpa/cmd-colors-solarized

* BundleWinCerts: (Don't think I copied anyone's code, If you recognize something, let me know)

* gitInstConf:
  * choclatey install: https://chocolatey.org/docs/installation
  * set reg path: https://stackoverflow.com/questions/31547104/how-to-get-the-value-of-the-path
  -environment-variable-without-expanding-tokens
  * poke env: https://mnaoumov.wordpress.com/2012/07/24/powershell-add-directory-to-environment-path-variable/
  * shortcut: https://stackoverflow.com/questions/9701840/how-to-create-a-shortcut-using-powershell
  
## Notes
Windows 10 1803+ installs a native ssh client and server, but the server is not enabled by default.
If you start a posh-git prompt and see the following error:

    unable to start ssh-agent service, error :1058
    Error connecting to agent: No such file or directory

make sure the service is present but disabled:
Get-service ssh-agent | Select \*

    Name                : ssh-agent
    RequiredServices    : {}
    CanPauseAndContinue : False
    CanShutdown         : False
    CanStop             : False
    DisplayName         : OpenSSH Authentication Agent
    DependentServices   : {}
    MachineName         : .
    ServiceName         : ssh-agent
    ServicesDependedOn  : {}
    ServiceHandle       : SafeServiceHandle
    Status              : *Stopped*
    ServiceType         : Win32OwnProcess
    StartType           : Disabled
    Site                :

fix this by enabling the service.  In an elevated powershell prompt:

Get-service ssh-agent | Set-Service -StartupType Manual