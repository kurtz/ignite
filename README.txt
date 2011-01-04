# Ignite - Social networking

A modern and open social networking solution for Joomla 1.5 and Joomla 1.6.

- [General information](http://ignite.tuiyo.co.uk/)
- [Issue tracking and bug reporting](https://github.com/Tuiyo/ignite/issues)
- [Mainline source code](https://github.com/Tuiyo/ignite)
- [Follow us on Twitter](http://twitter.com/com_tuiyo)

## Development

### 1. Get the source

It's recommended you clone the repository `git://github.com/tuiyo/ignite.git`:

    git clone --recursive https://github.com/tuiyo/ignite.git

### 4. Installation instructions

Do not install as a normal joomla component,

* [Download](https://github.com/drstonyhills/ignite/archives/master) the component
* Extract and FTP to your Joomla 1.5 sever (Please, Please Please, treat as an ALPHA release)
* Add required tables to your datbase, by running ALL the queries in the [install.sql file](https://github.com/drstonyhills/ignite/blob/master/administrator/components/com_tuiyo/install.mysql.utf8.sql) 
* install tables

    INSERT INTO jos_components
    VALUES(34, 'Tuiyo 2.0', 'option=com_tuiyo', 0, 0, 'option=com_tuiyo', 'Tuiyo Community Manager', 'com_tuiyo', 0, 'js/ThemeOffice/component.png', 0, '', 1);


NB. This is a developer preview and it is expected that people can either find their way creating packages from the files provided at this point or install from directory. Anyway follow the instructions above!

### 3. Documentation and Support

At this early stage documentation is still very scanty. However i am pretty open to any suggestions and request via email.

## License

This applications is dual licensed under the terms of the new LGPL 2.1 and the TUDA 2.0 (Tuiyo User and Developer Agreement)