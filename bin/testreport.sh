#! /bin/bash

set -e

# Change directory to the project directory that contains the .pytest folder
PYTEST_DIR="$(find . -name '.pytest' -type d | head -n 1)"
cd ${PYTEST_DIR%%".pytest"}

if [ $(stat -c '%U' .pytest ) != $USER ]; then
  echo "(II) .pytest directory not owned by user; attempt to reclaim it"
  sudo chown $USER .pytest
fi

echo "(II) Serving test report on local HTTP server."
echo "(II) Please load up web browser on port 8000 and 3000 to check these live reports"

# Launch the coverage report.
(python3 -m http.server -d .pytest/htmlcov/) & PID_COV=$!

# Launch the Xunit reader
xunit-viewer -r .pytest/junit.xml -o .pytest/junit-index.html -sw

# Close the coverage test server if it is still running
if ps -p $PID_COV > /dev/null; then
  kill $PID_COV
fi
