. ~/.git-completion.bash
# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

# example: importCerts somedomain.com:443 anyNickNameString
importCerts() { 
	echo "Q" | openssl s_client -connect "$1" -prexit 2>/dev/null | openssl x509 -out /tmp/cert
	sudo keytool -noprompt -importcert -alias "$2" -keystore $(/usr/libexec/java_home)/jre/lib/security/cacerts -storepass changeit -file /tmp/cert
}

clearCalendarCache(){
	rm -rf ~/Library/Calendars/Calendar\ Cache
	rm -rf ~/Library/Calendars/*.calendar/Events
	rm -rf ~/Library/Preferences/com.apple.iCal.plist
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export ANDROID_HOME=/usr/local/share/android-sdk

HISTFILESIZE=10000000

source ~/.bashrc
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=/Library/Java/Home

