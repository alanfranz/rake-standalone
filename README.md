# Rake Standalone

Rake standalone is just a prepackaged, stable API (Ruby version + Rake version) for [Rake](https://github.com/ruby/rake).

Because life is too short to convert spaces to tabs.

## Rationale

The world is full of good build tools. [GNU Make](https://www.gnu.org/software/make/), [CMake](https://cmake.org/),
[Bazel](http://bazel.io/), [Maven](https://maven.apache.org/), [Ant](http://ant.apache.org/). Many others exist.

Some of those are designed to cope with specific technologies, and work best with such. Others are or can be generic,
but require a bit of effort in order to perform random tasks (e.g. launch some command with some parameters)

In many situations what I would like would just be an "enhanced bash" - bash is sometimes just too fragile
to perform some of the tasks which are needed during a build.

One day I found that [Rake](https://github.com/ruby/rake) is a good generic tool to perform random tasks -
ruby's text manipulation capabilities make for a great make replacement tool.

There was **one major drawback**: rake versions differ across distributions, and Rakefiles themselves,
being just Ruby files, depend on the version of Ruby installed on the system. This makes it difficult
to write a Rakefile and expect it to reliably work on any system.

**Rake-standalone installs a separate ruby and rake, and provides a versioned executable that can be used
to run a specific version of the rake-standalone API**. It'll be possible to install multiple versions of rake-standalone
side-by-side and choose which one to use at runtime with a specific version.

## Rake Standalone API

| API Version        | Ruby Version           | Rake Version | Package name |
| --- |:---:|:---:|---:|
| 1     | 2.2.3 | 10.4.2 | rake-standalone-1 |

Rake Standalone will make the ```rakest<API_VERSION>``` and
```rakest``` executables available in your PATH. The first will always
enable using a specific API version, while the second will point to the
latest available rake-standalone version on your system (useful for development, but discouraged for distributing or releasing your software).

So, once you install ```rake-standalone-1``` you'll have ```rakest1``` and ```rakest``` executables available in your PATH.


## Example

*Rakefile.rb* content:
```
#!rakest1 -f
```

## Installing

### Prepackaged version

In order to use the prepackaged version, add the proper repository
for your distribution - see below - and install the package matching
the API version you require - see the [api table above](#rake-standalone-api)

As a general rule, I think I'll support the two latest
centos/RHEL distros, the two latest Fedoras, the two latest
Debian distros and, for Ubuntu, the two latest LTS distros
and the two latest non-LTS distros. If somebody else wants other distros supported, open a pull request (possibly with
  an attached patch).

#### YUM repo for Centos/RHEL 6/7

**/etc/yum.repos.d/rake-standalone-stable.repo**

```
[rake-standalone-stable]
name=rake-standalone-stable
baseurl=http://www.a9f.eu/yum/rake-standalone-stable/centos/$releasever/$basearch
repo_gpgcheck=1
gpgcheck=1
enabled=1
gpgkey=https://www.franzoni.eu/keys/D1270819.txt
```

A small note: that should be OK for CentOS and RHEL, but other
derivatives (SL, Oracle, ...) sometimes change the meaning of
$releasever in a non-compatibile fashion. Substitute such variable
with your major (i.e 6 or 7) if that's your scenario.

#### YUM/DNF repo for Fedora 22 and 23

**/etc/yum.repos.d/rake-standalone-stable.repo**

```
[rake-standalone-stable]
name=rake-standalone-stable
baseurl=http://www.a9f.eu/yum/rake-standalone-stable/fedora/$releasever/$basearch
repo_gpgcheck=1
gpgcheck=1
enabled=1
gpgkey=https://www.franzoni.eu/keys/D1270819.txt
```

#### APT for Ubuntu and Debian

first, fetch my public key by using **either** line from below (uncomment and launch the second if the first fails)

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv D1270819
#curl https://www.franzoni.eu/keys/D1270819.txt | sudo apt-key add -
```


then, add the proper line for your distro and version, as shown below, in ```/etc/apt/sources.list``` (or add a new ```rake-standalone-stable.list``` file in ```/etc/apt/sources.list.d``` with the same content).

##### Ubuntu Precise

```
deb http://www.a9f.eu/apt/rake-standalone-stable/ubuntu precise main
```

##### Ubuntu Trusty

```
deb http://www.a9f.eu/apt/rake-standalone-stable/ubuntu trusty main
```

##### Ubuntu Vivid

```
deb http://www.a9f.eu/apt/rake-standalone-stable/ubuntu vivid main
```

##### Ubuntu Wily

```
deb http://www.a9f.eu/apt/rake-standalone-stable/ubuntu wily main
```

##### Debian Wheezy

```
deb http://www.a9f.eu/apt/rake-standalone-stable/debian wheezy main
```

##### Debian Jessie

```
deb http://www.a9f.eu/apt/rake-standalone-stable/debian jessie main
```


### From scratch

Nothing easier. Install an additional Ruby interpreter matching the required API version (I recommend using [ruby-build](https://github.com/sstephenson/ruby-build) if
you don't want to get crazy), possibly in some separate path
like ```/usr/local``` or ```/opt```. Then, if the ruby
you're building doesn't come with a rake gem with the right
version, just install it for such interpreter.

Then link such rake executable to be in PATH as ```rakest<API_VERSION>``` and, if it's the only rakest in your system, even as ```rakest```.

# Disclaimer

I'm not affiliated with Rake developers.
