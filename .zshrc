# Path to your oh-my-zsh installation.
export ZSH=/Users/macrivel/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git adb cp osx rails ruby man python rbenv virtualenv xcode)

# User configuration
configtemplatetool="/Users/macrivel/tools/configtemplatetool/bin"
webappdeployer="/Users/macrivel/tools/webappdeployer"
maven="/Users/macrivel/tools/apache-maven-3.2.5"
android="/Users/macrivel/Library/Android/sdk/platform-tools"
export PYTHON_VIRTUALENV="/Users/macrivel/python"
export M2_HOME=$maven
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PYTHON_VIRTUALENV/bin:$android:$maven/bin:$configtemplatetool:$webappdeployer:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

export PORTAL_HOME="/Users/macrivel/servers/portal/tomcat"
export PORTAL_SRC="/Users/macrivel/code/uportal"

export CAS_HOME="/Users/macrivel/servers/cas"
export CAS_SRC="/Users/macrivel/code/cas/weblogin33"

export CONFIG_PROPERTIES="/usr/local/config"

export ADVISING_HOME="/Users/macrivel/servers/1stop/tomcat"
export ADVISING_SRC="/Users/macrivel/code/polyadvising"

export ORACLE_HOME="tools/oracle"
export TNS_ADMIN="$ORACLE_HOME/network/admin"
export PATH=$PATH:$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME

export API_HOME="/Users/macrivel/servers/api/generic-8.0.15"
export CLASSPATH="$CLASSPATH;.;$CONFIG_PROPERTIES"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

bindkey "^X^_" redo

# Functions
mktouch() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

tail_api() {
    tail -f /logs/api/catalina.out /logs/api/api-user.log /logs/api/service-api.log /logs/api/api-notifications.log
}

java8() {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
}
java7() {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
}

alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias cparchgen="mvn archetype:generate -DarchetypeCatalog=http://maven.its.calpoly.edu/maven2/"
alias updateenv="grep -E "^setenv" /etc/launchd.conf | xargs -t -L 1 launchctl"
alias mktouch=mktouch
alias portal-up="$PORTAL_HOME/bin/catalina.sh run"
alias portal-down="$PORTAL_HOME/bin/catalina.sh stop"
alias onestop-up="$ADVISING_HOME/bin/catalina.sh run"
alias onestop-down="$ADVISING_HOME/bin/catalina.sh stop"
alias api-up="$API_HOME/bin/catalina.sh run"
alias api-down="$API_HOME/bin/catalina.sh stop"
alias code="~/code"
# Hosts
alias premote="ssh -A macrivel@p-remote.its.calpoly.edu"
alias pbuild="ssh -A macrivel@p-build.its.calpoly.edu"

alias stash="~/.rbenv/versions/2.4.1/bin/stash"
# Load rbenv automatically
eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f /Users/macrivel/.travis/travis.sh ] && source /Users/macrivel/.travis/travis.sh
