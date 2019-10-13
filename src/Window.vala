/* Window.vala
 *
 * Copyleft 🄯2019 Ryan Mcconkey
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */



public class MyApp.Window : Gtk.ApplicationWindow {
    
    public Window (Application app) {
        Object (
            application: app
        );
      
    }
    
    construct {
        
        window_position = Gtk.WindowPosition.CENTER;
        set_default_size (520 , 150);
        
        
        
        
        // Create some buttons ;-P
        var xbps_cache_button = new Gtk.Button.with_label("Clean XBPS Cache");
        var clean_page_cache_button = new Gtk.Button.with_label ("Clean Page Cache");
        var clean_dentries_and_inodes_button = new Gtk.Button.with_label ("Clean Dentries & Inodes");
        var clean_all_drop_caches_button = new Gtk.Button.with_label ("Clean all Drop Caches");
    
        // The Box:
	    Gtk.Box box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
	    box.pack_start (xbps_cache_button, false, false, 0);
	    box.pack_start (clean_page_cache_button, false , false , 0);
	    box.pack_start (clean_dentries_and_inodes_button, false , false , 0);
	    box.pack_start (clean_all_drop_caches_button, false , false , 0);
        
        box.set_spacing (20);
        box.halign = Gtk.Align.CENTER;
        box.valign = Gtk.Align.CENTER;
        this.add (box);
        
        xbps_cache_func (xbps_cache_button);
        cache_clear (clean_page_cache_button , "1" , "/proc/sys/vm/drop_caches");
        cache_clear (clean_dentries_and_inodes_button , "2" , "/proc/sys/vm/drop_caches");
        cache_clear (clean_all_drop_caches_button , "3" , "/proc/sys/vm/drop_caches");
        
        var headerbar = new MyApp.HeaderBar ();
        set_titlebar (headerbar);
        
        
        
        
        
        show_all ();
    }
    
    
    
     // cleans up home temop dir that i made :D
     public void clean_cache (string path) {
        Posix.system("rm -rf " + path);
     }
     
     private void drop_cache_clear (string drop_choice , string path) {
         Posix.system ("echo " + drop_choice + " > " + path);
     }
     
     
     
     
     // function for the xbps cache button
     private void xbps_cache_func (Gtk.Button button) {
         
        // When the XBPS cache button is clicked, clean the dir ;-P
	    button.clicked.connect (() => {
	        var xbps_cache_garbo = "/var/cache/xbps/*";
           
		    	// Emitted when the button has been activated:
		    	
		    	try {
		    	    clean_cache (xbps_cache_garbo);
		    
		    	} catch {
		    	    
		    	}
		    	
		    });
     }
     
     
     // function for the xbps cache button
     private void cache_clear (Gtk.Button button , string path , string drop_choice) {
         
        // When the XBPS cache button is clicked, clean the dir ;-P
	    button.clicked.connect (() => {
		    	// Emitted when the button has been activated:
		    	
		    	try {
		    	    drop_cache_clear (drop_choice , path);
		    
		    	} catch {
		    	    
		    	}
		    	
		    });
     }
}
