#!/usr/bin/env python
# Scan a logfile for lines begining with warn/warning/error

# Ignore these lines if they appear in a log
ignore = [
    "Error: Module vboxguest is not currently loaded"
    ]


################################################################################

import re
import string
import sys


def check_file(filename):
    ignored_lines = []
    warn_lines = []
    error_lines = []

    with open(filename) as f:
        for line in f:
            line = line.strip()
            if line in ignore:
                ignored_lines.append(line)

            elif re.match('^(warn|warning)[\s%s]' %
                          re.escape(string.punctuation),
                          line, re.IGNORECASE):
                warn_lines.append(line)

            elif re.match('^error[\s%s]' %
                          re.escape(string.punctuation),
                          line, re.IGNORECASE):
                error_lines.append(line)

            else:
                pass

    print 'File: %s' % filename
    print '%d ignored lines' % len(ignored_lines)
    print '%d warnings' % len(warn_lines)
    for line in warn_lines:
        print '  %s' % line
    print '%d errors' % len(error_lines)
    for line in error_lines:
        print '  %s' % line

    return len(error_lines)


def main(argv):
    total_errors = 0
    for filename in sys.argv[1:]:
        total_errors += check_file(filename)
    sys.exit(total_errors)


if __name__ == '__main__':
    main(sys.argv)



