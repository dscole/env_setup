import re
import sys
import tempfile
import subprocess


def _helper(matchObj):
    if matchObj.groups()[0]:
        return matchObj.group(0)
    else:
        return "\n" * matchObj.group(0).count('\n')


def json_minify(origStr, strip_space=False):
    '''
    Remove c-style comments from a json string.

    Implementation:
    Match (a string) OR (a multi line comment) OR (a single line comment).
    Then use re.sub function that accepts a function object that gets
    called on every match that's expected to return the replacement string.
    In that helper function the match is returned untouched if it's a
    string and if a comment was matched an empty string is returned.
    The only tricky part is to get a correct match for strings since you
    need to take care of any possible escapes (for example "\"" should be
    a match, as well as "\\", but "\\\" isn't a complete string since the
    last quote is escaped)
    '''
    str_cmt = re.compile(r'(?ms)("[^"\\]*(?:\\.[^"\\]*)*")|(/\*.*?\*/)|(//.*?\n)')
    return str_cmt.sub(_helper, origStr)


def main():
    if len(sys.argv) == 1:
        infile = sys.stdin
    elif len(sys.argv) == 2:
        infile = open(sys.argv[1], 'rb')
    else:
        raise SystemExit(sys.argv[0] + " [infile]")
    with infile:
        json_comments_removed = json_minify(infile.read())
    with tempfile.NamedTemporaryFile() as tmp_json_file:
        tmp_json_file.write(json_comments_removed)
        tmp_json_file.seek(0)
        return_code = subprocess.call(['json-glib-validate', tmp_json_file.name])
        if (return_code != 0):
            raise SystemExit(return_code)

if __name__ == '__main__':
    main()
