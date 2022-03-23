Summary: jpdfbookmarks
Name: jpdfbookmarks
Version: 3.0.2
Release: 1
License: Unknown
Vendor: Flaviano Petrocchi

%if "x" != "x"
URL: 
%endif

%if "x/opt" != "x"
Prefix: /opt
%endif

Provides: jpdfbookmarks

%if "x" != "x"
Group: 
%endif

Autoprov: 0
Autoreq: 0
%if "xalsa-lib, bzip2-libs, freetype, glibc, libX11, libXau, libXext, libXi, libXrender, libXtst, libpng, libxcb, xdg-utils, zlib" != "x" || "x" != "x"
Requires: alsa-lib, bzip2-libs, freetype, glibc, libX11, libXau, libXext, libXi, libXrender, libXtst, libpng, libxcb, xdg-utils, zlib 
%endif

#comment line below to enable effective jar compression
#it could easily get your package size from 40 to 15Mb but
#build time will substantially increase and it may require unpack200/system java to install
%define __jar_repack %{nil}

%define package_filelist %{_tmppath}/%{name}.files
%define app_filelist %{_tmppath}/%{name}.app.files
%define filesystem_filelist %{_tmppath}/%{name}.filesystem.files

%define default_filesystem / /opt /usr /usr/bin /usr/lib /usr/local /usr/local/bin /usr/local/lib

%description
This software allows you to create and edit bookmarks on existing pdf files.

%global __os_install_post %{nil}

%prep

%build

%install
rm -rf %{buildroot}
install -d -m 755 %{buildroot}/opt/jpdfbookmarks
cp -r %{_sourcedir}/opt/jpdfbookmarks/* %{buildroot}/opt/jpdfbookmarks
%if "x" != "x"
  %define license_install_file %{_defaultlicensedir}/%{name}-%{version}/%{basename:}
  install -d -m 755 "%{buildroot}%{dirname:%{license_install_file}}"
  install -m 644 "" "%{buildroot}%{license_install_file}"
%endif
(cd %{buildroot} && find . -type d) | sed -e 's/^\.//' -e '/^$/d' | sort > %{app_filelist}
{ rpm -ql filesystem || echo %{default_filesystem}; } | sort > %{filesystem_filelist}
comm -23 %{app_filelist} %{filesystem_filelist} > %{package_filelist}
sed -i -e 's/.*/%dir "&"/' %{package_filelist}
(cd %{buildroot} && find . -not -type d) | sed -e 's/^\.//' -e 's/.*/"&"/' >> %{package_filelist}
%if "x" != "x"
  sed -i -e 's|"%{license_install_file}"||' -e '/^$/d' %{package_filelist}
%endif

%files -f %{package_filelist}
%if "x" != "x"
  %license "%{license_install_file}"
%endif

%post
xdg-desktop-menu install /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks.desktop
xdg-mime install /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks-MimeInfo.xml
xdg-desktop-menu install /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks_cli.desktop
        # register /usr/bin/jpdfbookmarks as a jpdfbookmarks in the alternatives system
        update-alternatives \
            --install \
                /usr/bin/jpdfbookmarks \
                jpdfbookmarks \
                /opt/jpdfbookmarks/bin/jpdfbookmarks \
                50 
        # register /usr/bin/jpdfbookmarks_cli as a jpdfbookmarks_cli in the alternatives system
        update-alternatives \
            --install \
                /usr/bin/jpdfbookmarks_cli \
                jpdfbookmarks_cli \
                /opt/jpdfbookmarks/bin/jpdfbookmarks_cli \
                50 
%preun
#
# Remove $1 desktop file from the list of default handlers for $2 mime type
# in $3 file dumping output to stdout.
#
_filter_out_default_mime_handler ()
{
  local defaults_list="$3"

  local desktop_file="$1"
  local mime_type="$2"

  awk -f- "$defaults_list" <<EOF
  BEGIN {
    mime_type="$mime_type"
    mime_type_regexp="~" mime_type "="
    desktop_file="$desktop_file"
  }
  \$0 ~ mime_type {
    \$0 = substr(\$0, length(mime_type) + 2);
    split(\$0, desktop_files, ";")
    remaining_desktop_files
    counter=0
    for (idx in desktop_files) {
      if (desktop_files[idx] != desktop_file) {
        ++counter;
      }
    }
    if (counter) {
      printf mime_type "="
      for (idx in desktop_files) {
        if (desktop_files[idx] != desktop_file) {
          printf desktop_files[idx]
          if (--counter) {
            printf ";"
          }
        }
      }
      printf "\n"
    }
    next
  }

  { print }
EOF
}


#
# Remove $2 desktop file from the list of default handlers for $@ mime types
# in $1 file.
# Result is saved in $1 file.
#
_uninstall_default_mime_handler ()
{
  local defaults_list=$1
  shift
  [ -f "$defaults_list" ] || return 0

  local desktop_file="$1"
  shift

  tmpfile1=$(mktemp)
  tmpfile2=$(mktemp)
  cat "$defaults_list" > "$tmpfile1"

  local v
  local update=
  for mime in "$@"; do
    _filter_out_default_mime_handler "$desktop_file" "$mime" "$tmpfile1" > "$tmpfile2"
    v="$tmpfile2"
    tmpfile2="$tmpfile1"
    tmpfile1="$v"

    if ! diff -q "$tmpfile1" "$tmpfile2" > /dev/null; then
      update=yes
      trace Remove $desktop_file default handler for $mime mime type from $defaults_list file
    fi
  done

  if [ -n "$update" ]; then
    cat "$tmpfile1" > "$defaults_list"
    trace "$defaults_list" file updated
  fi

  rm -f "$tmpfile1" "$tmpfile2"
}


#
# Remove $1 desktop file from the list of default handlers for $@ mime types
# in all known system defaults lists.
#
uninstall_default_mime_handler ()
{
  for f in /usr/share/applications/defaults.list /usr/local/share/applications/defaults.list; do
    _uninstall_default_mime_handler "$f" "$@"
  done
}


trace ()
{
  echo "$@"
}
xdg-desktop-menu uninstall /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks.desktop
xdg-mime uninstall /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks-MimeInfo.xml
uninstall_default_mime_handler jpdfbookmarks-jpdfbookmarks.desktop application/pdf
xdg-desktop-menu uninstall /opt/jpdfbookmarks/lib/jpdfbookmarks-jpdfbookmarks_cli.desktop
update-alternatives --remove jpdfbookmarks /usr/bin/jpdfbookmarks || true 
update-alternatives --remove jpdfbookmarks_cli /usr/bin/jpdfbookmarks_cli || true    
%clean
