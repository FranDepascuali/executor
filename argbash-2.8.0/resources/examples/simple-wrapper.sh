#!/bin/bash

# DEFINE_SCRIPT_DIR()
# ARG_POSITIONAL_INF([directory],[Directories to go through],[1])
# ARG_OPTIONAL_SINGLE([glob],[],[What files to match in the directory],[*])
# ARGBASH_WRAP([simple-parsing],[filename])
# ARG_HELP([This program tells you size of specified files in given directories in units you choose.])
# ARGBASH_SET_INDENT([  ])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.8.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
  local _ret=$2
  test -n "$_ret" || _ret=1
  test "$_PRINT_HELP" = yes && print_help >&2
  echo "$1" >&2
  exit ${_ret}
}


begins_with_short_option()
{
  local first_option all_short_options='uh'
  first_option="${1:0:1}"
  test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_directory=('' )
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_glob="*"
_arg_unit="b"
_arg_verbose="off"


print_help()
{
  printf '%s\n' "This program tells you size of specified files in given directories in units you choose."
  printf 'Usage: %s [--glob <arg>] [-u|--unit <arg>] [--(no-)verbose] [-h|--help] <directory-1> [<directory-2>] ... [<directory-n>] ...\n' "$0"
  printf '\t%s\n' "<directory>: Directories to go through"
  printf '\t%s\n' "--glob: What files to match in the directory (default: '*')"
  printf '\t%s\n' "-u, --unit: What unit we accept (b for bytes, k for kibibytes, M for mebibytes) (default: 'b')"
  printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
  _positionals_count=0
  while test $# -gt 0
  do
    _key="$1"
    case "$_key" in
      --glob)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_glob="$2"
        shift
        ;;
      --glob=*)
        _arg_glob="${_key##--glob=}"
        ;;
      -u|--unit)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_unit="$2"
        _args_simple_parsing_opt+=("${_key}" "$2")
        shift
        ;;
      --unit=*)
        _arg_unit="${_key##--unit=}"
        _args_simple_parsing_opt+=("$_key")
        ;;
      -u*)
        _arg_unit="${_key##-u}"
        _args_simple_parsing_opt+=("$_key")
        ;;
      --no-verbose|--verbose)
        _arg_verbose="on"
        _args_simple_parsing_opt+=("${_key}")
        test "${1:0:5}" = "--no-" && _arg_verbose="off"
        ;;
      -h|--help)
        print_help
        exit 0
        ;;
      -h*)
        print_help
        exit 0
        ;;
      *)
        _last_positional="$1"
        _positionals+=("$_last_positional")
        _positionals_count=$((_positionals_count + 1))
        ;;
    esac
    shift
  done
}


handle_passed_args_count()
{
  local _required_args_string="'directory'"
  test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require at least 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
}


assign_positional_args()
{
  local _positional_name _shift_for=$1
  _positional_names="_arg_directory "
  _our_args=$((${#_positionals[@]} - 1))
  for ((ii = 0; ii < _our_args; ii++))
  do
    _positional_names="$_positional_names _arg_directory[$((ii + 1))]"
  done

  shift "$_shift_for"
  for _positional_name in ${_positional_names}
  do
    test $# -gt 0 || break
    eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
    shift
  done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash
_args_simple_parsing=("${_args_simple_parsing_opt[@]}" "${_args_simple_parsing_pos[@]}")
script_dir="$(cd "$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")" && pwd)" || die "Couldn't determine the script's running directory, which probably matters, bailing out" 2

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash


script="$script_dir/simple.sh"
test -f "$script" || { echo "Missing the wrapped script, was expecting it next to me, in '$script_dir'."; exit 1; }

for directory in "${_arg_directory[@]}"
do
  test -d "$directory" || die "We expected a directory, got '$directory', bailing out."
  printf "Contents of '%s' matching '%s':\n" "$directory" "$_arg_glob"
  for file in "$directory"/$_arg_glob
  do
    test -f "$file" && printf "\t%s: %s\n" "$(basename "$file")" "$("$script" "${_args_simple_parsing_opt[@]}" "$file")"
  done
done

# ] <-- needed because of Argbash