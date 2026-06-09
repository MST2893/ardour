# cairomm
This library provides a C++ interface to cairo.

# General information

cairomm-1.0 and cairomm-1.16 are different parallel-installable ABIs.
This file describes cairomm-1.0.

Web site
 - https://www.cairographics.org/cairomm/

Download location
 - https://www.cairographics.org/releases/

Reference documentation
 - https://www.cairographics.org/documentation/cairomm/reference/
 - https://cairo.pages.freedesktop.org/cairomm

The reference documentation on the web describes a version of cairomm,
which is not ABI-compatible with the cairomm-1.0 ABI series.
Tarballs contain reference documentation. In tarballs generated with Meson,
see the untracked/docs/reference/html directory.

Mailing list
 - https://lists.cairographics.org/cgi-bin/mailman/listinfo/cairo

Git repository
 - https://gitlab.freedesktop.org/cairo/cairomm

Bugs can be reported to
 - https://gitlab.freedesktop.org/cairo/cairomm/-/issues

Patches can be submitted to
 - https://gitlab.freedesktop.org/cairo/cairomm/-/merge_requests

# Building

Whenever possible, you should use the official binary packages approved by the
supplier of your operating system, such as your Linux distribution.

See the examples directory for example code.

Use pkg-config to discover the necessary include and linker arguments. For instance,
```
  pkg-config cairomm-1.0 --cflags --libs
```
If you build with Autotools, ideally you would use PKG_CHECK_MODULES in your
configure.ac file.

## Building on Windows

See [MSVC-Builds](MSVC_NMake/MSVC-Builds.md)

## Building from a release tarball

Extract the tarball and go to the extracted directory:
```
  $ tar xf cairomm-@CAIROMM_VERSION@.tar.xz
  $ cd cairomm-@CAIROMM_VERSION@
```

It's easiest to build with Meson, if the tarball was made with Meson,
and to build with Autotools, if the tarball was made with Autotools.
Then you don't have to use maintainer-mode.

How do you know how the tarball was made? If it was made with Meson,
it contains files in untracked/docs/ and other subdirectories
of untracked/.

### Building from a tarball with Meson

Don't call the builddir 'build'. There is a directory called 'build' with
files used by Autotools.
```
  $ meson setup --prefix /some_directory --libdir lib your_builddir .
  $ cd your_builddir
```

If the tarball was made with Autotools, you must enable maintainer-mode:
```
  $ meson configure -Dmaintainer-mode=true
```

Then, regardless of how the tarball was made:
```
  $ ninja
  $ ninja install
```
You can run the tests like so:
```
  $ ninja test
```

### Building from a tarball with Autotools

If the tarball was made with Autotools:
```
  $ ./configure --prefix=/some_directory
```
If the tarball was made with Meson, you must enable maintainer-mode:
```
  $ ./autogen.sh --prefix=/some_directory
```

Then, regardless of how the tarball was made:
```
  $ make
  $ make install
```
You can build the examples and tests, and run the tests, like so:
```
  $ make check
```

## Building from git

Building from git can be difficult so you should prefer building from
a release tarball unless you need to work on the cairomm code itself.

jhbuild can be a good help
- https://gitlab.gnome.org/GNOME/jhbuild
- https://wiki.gnome.org/Projects/Jhbuild
- https://gnome.pages.gitlab.gnome.org/jhbuild

### Building from git with Meson

Maintainer-mode is enabled by default when you build from a git clone.

Don't call the builddir 'build'. There is a directory called 'build' with
files used by Autotools.
```
  $ meson setup --prefix /some_directory --libdir lib your_builddir .
  $ cd your_builddir
  $ ninja
  $ ninja install
```
You can run the tests like so:
```
  $ ninja test
```
You can create a tarball like so:
```
  $ ninja dist
```

### Building from git with Autotools

```
  $ ./autogen.sh --prefix=/some_directory
  $ make
  $ make install
```
You can build the examples and tests, and run the tests, like so:
```
  $ make check
```
You can create a tarball like so:
```
  $ make distcheck
```
or
```
  $ make dist
```
