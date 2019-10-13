# MultiCacheCleaner
Multi Cache Cleaner written in Vala/Gtk-3.0 for Void Linux 


# Dependencies

Gtk 3.0 and vala compiler

# How to use

This software makes it simple to clean the XBPS cache stored in your /var/cache/xbps directory and it can also clean your drop_caches for your ram ( do so at your own risk ). The button at the top will clean it all with one simple click.
This software requires a GUI sudo like kdesu or lxqt-sudo to access root permisions to clean the caches or it won't work. 
This software is to be considered experimental as this is my first project working with vala and gtk.

# How to compile from source

To compile from source you need to do:

valac --pkg gtk+-3.0 --pkg posix Application.vala Window.vala main.vala -o anyname
