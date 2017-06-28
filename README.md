Yale PUI Plugin
------------------------------

This is an ArchivesSpace plugin to customize the public interface as follows:
* Transform record identifier series-level component ids from Arabic to Roman.
* Suppress extents with a number "0".
* Suppress note headers for notes over 65k that have been split due to AS
database limits.  Labels for split notes follow the convention of a numeral
prefix e.g. "(1) My Split Note", "(2) My Split Note", etc.
* Add a link to the OPAC on resource pages using the OPAC Id in a user_defined
string_2.


This plugin will run under ArchivesSpace v2.1 or higher.

Developed by Hudson Molonglo for Yale University.

# Getting Started

Download the latest release from the Releases tab in Github:

  https://github.com/hudmol/aspace_yale_pui/releases

Unzip the release and move it to:

    /path/to/archivesspace/plugins

Unzip it:

    $ cd /path/to/archivesspace/plugins
    $ unzip aspace_yale_pui-vX.X.zip

Enable the plugin by editing the file in `config/config.rb`:

    AppConfig[:plugins] = ['some_plugin', 'aspace_yale_pui']

(Make sure you uncomment this line (i.e., remove the leading '#' if present))

See also:

  https://github.com/archivesspace/archivesspace/blob/master/plugins/README.md

# Configuration

The OPAC link is currently generated from the OPAC Id in the resource's user
defined `string_2` field.  If your OPAC Id is stored elsewhere, please modify
the file `public/models/resource_ext.rb` to return the value from your desired
field.  The link header, label and URL may be modified via the locales
e.g. `public/locales/en.yml` for English.  Please note, the OPAC Id is passed
to the `opac_link_url` and you can move this value within the URL with the
`%{opac_id}` notation.

