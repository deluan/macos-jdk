export JAVA_PERM_SIZE="-XX:PermSize=128m -XX:MaxPermSize=256m"
export JAVA_OPTS="-Xms256m -Xmx1024m"
export MAVEN_PERM_SIZE="-XX:MaxPermSize=256m"
export MAVEN_OPTS="-Xmx512m"

export JAVA_AVAILABLE_VERSIONS=
alias java_home=/usr/libexec/java_home

jdk() {
  if [ ! "$JAVA_AVAILABLE_VERSIONS" ]; then
    JAVA_AVAILABLE_VERSIONS=$(java_home -V 2>&1 >/dev/null | \
        grep x86_64 | cut -f 2 -dE | tr -d " " | cut -f 1 -d'"' | cut -f 1 -d "." | \
        sort | tr '\n\' ' ')
  fi

  if [[ -n "$1" && $JAVA_AVAILABLE_VERSIONS =~ $1 ]]; then
    version=`java_home -V 2>&1 >/dev/null | grep "Java SE $1" | cut -f 1 -d ","`
    export JAVA_HOME=$(java_home -v $version)
    java -version 2>&1

    if [ $1 -lt 8 ]; then
      JAVA_OPTS="$JAVA_OPTS $JAVA_PERM_SIZE"
      MAVEN_OPTS="$MAVEN_OPTS $MAVEN_PERM_SIZE"
    fi
  else
    echo "Current version is: `java -version 2>&1`"
    echo
    echo "Available java versions: $JAVA_AVAILABLE_VERSIONS"
    java_home -V 2>&1 >/dev/null | grep x86_64
    echo
  fi
}

if [ -n ~/.jdkversion ]; then
  jdk `cat ~/.jdkversion` 2>&1 >/dev/null
else
  export JAVA_HOME=$(java_home)
fi
