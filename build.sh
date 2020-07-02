rm -rf /workspace/elastic-apm
/sbin/apk add --no-cache git
ELASTIC_APM_VERSION="$(/usr/bin/awk -F '==' '/elastic-apm/ { print $2 }' requirements.txt)"
/usr/bin/git config --global advice.detachedHead false
/usr/bin/git clone --branch "v${ELASTIC_APM_VERSION}" --depth 1 https://github.com/elastic/apm-agent-python.git elastic-apm
cd elastic-apm || exit
/usr/local/bin/python setup.py bdist_wheel
