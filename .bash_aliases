# ----------------------------------------------------------------------------
# Create a directory and cd into it.
#
# Ex:
#        ~$ mkcd foo/bar    # create a "foo/bar" directory from ~
#        ~/foo/bar$         # now the  current/working directory is ~/foo/bar
# ----------------------------------------------------------------------------
mkcd() {
    mkdir -p "$@" && cd "$_";
}
