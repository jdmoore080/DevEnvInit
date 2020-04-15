rem if http proxy is needed for git, set this variable
rem SET CONF_GIT_PROXY=http://proxy.foo.com:8080
SET CONF_GIT_PROXY=

REM root folder in which you will call git clone.  Do not use a Drive root (e.g. C:\)
SET CONF_POSHGIT_STARTDIR=c:\github-personal

REM USER and EMAIL can be blank (set XXX=) if you want to force prompting

REM standard user info for git operations
SET CONF_GIT_DEFAULT_USER=John Doe
SET CONF_GIT_DEFAULT_EMAIL=johndoe@users.noreply.github.com

REM optional settings if a particular dir needs different git credentials for child repos
SET CONF_GIT_SECONDARY_USER=Jane Doe
SET CONF_GIT_SECONDARY_EMAIL=janedoe@users.noreply.github.com
SET CONF_GIT_SECONDARY_PATH=C:/github-personal/
