#!/bin/bash
SCRIPT_NAME=`basename "$0"`
SCRIPT_PATH=${0%`basename "$0"`}
PLUGIN_PATH="/home/${USER}/.local/share/rhythmbox/plugins/rhythmbox_hide/"
GLIB_SCHEMA="org.gnome.rhythmbox.plugins.rhythmbox_hide.gschema.xml"
GLIB_DIR="/usr/share/glib-2.0/schemas/"

#build the dirs
mkdir -p $PLUGIN_PATH

#copy the files
cp -r "${SCRIPT_PATH}"* "$PLUGIN_PATH"

#remove the install script from the dir (not needed)
rm "${PLUGIN_PATH}${SCRIPT_NAME}"

#install the glib schema
echo "Installing the plugin schemas (password needed)"
sudo cp "${PLUGIN_PATH}${GLIB_SCHEMA}" "$GLIB_DIR"
sudo glib-compile-schemas "$GLIB_DIR"
