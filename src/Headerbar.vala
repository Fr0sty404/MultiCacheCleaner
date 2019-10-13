/* Headerbar.vala
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


public class MyApp.HeaderBar : Gtk.HeaderBar {
    
    construct {
        set_title ("Multi Cache Cleaner");
        set_subtitle ("Let me clean your caches");
        
        set_show_close_button (true);
        
        var clean_all_button = new Gtk.Button.with_label ("Clean All");
        var menu_button = new Gtk.Button.from_icon_name ("dialog-information");
        
        clean_all_button.get_style_context ().add_class ("suggested-action");
        clean_all_button.valign = Gtk.Align.CENTER;
        
        clean_all (clean_all_button);
        
        menu_button.valign = Gtk.Align.CENTER;
        menu_function(menu_button);
        
        pack_start (clean_all_button);
        pack_end (menu_button);
       

        
        
        
    }
    
    
    private void clean_all (Gtk.Button button) {
         button.clicked.connect (() => {
		    	// Emitted when the button has been activated:
		    	
		    	try {
		    	    clean_cache ("/var/cache/xbps/*");
		    	    drop_cache_clear ("3" , "/proc/sys/vm/drop_caches");
		    
		    	} catch (Error e){
		    	}
		    	
		    });
    }
    
      // cleans up home temop dir that i made :D
     public void clean_cache (string path) {
        Posix.system("rm -rf " + path);
     }
     
     private void drop_cache_clear (string drop_choice , string path) {
         Posix.system ("echo " + drop_choice + " > " + path);
     }
     
     private void menu_function (Gtk.Button button) {
          button.clicked.connect (() => {
		    	 
        // Configure the dialog:
	            var dialog = new Gtk.AboutDialog ();
	            dialog.set_destroy_with_parent (true);
	            
	            dialog.set_modal (true);

	           
	            dialog.documenters = null; // Real inventors don't document.
	            dialog.translator_credits = null; // We only need a scottish version.

	            dialog.program_name = "Multi Cache Cleaner";
	            dialog.comments = "The best simple cache cleaner.";
	            dialog.copyright = "Copyleft 🄯 2019 Ryan Mcconkey , GPLv3";
	            dialog.version = "0.1";

	            dialog.license = """
	            
	            
	        Copyleft 🄯 2019 Ryan Mcconkey
                
                This program is free software: you can redistribute it and/or modify
                it under the terms of the GNU General Public License as published by
                the Free Software Foundation, either version 3 of the License, or
                (at your option) any later version.
                
                This program is distributed in the hope that it will be useful,
                but WITHOUT ANY WARRANTY; without even the implied warranty of
                MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
                GNU General Public License for more details.
                
                You should have received a copy of the GNU General Public License
                along with this program.  If not, see <http://www.gnu.org/licenses/>.
                """;
	            dialog.wrap_license = false;

	            dialog.website = "https://www.github.com/Fr0sty404";
	            

	            dialog.response.connect ((response_id) => {
		            if (response_id == Gtk.ResponseType.CANCEL || response_id == Gtk.ResponseType.DELETE_EVENT) {
		            	dialog.hide_on_delete ();
		            }
	            });
		    	
	            // Show the dialog:
	            dialog.present ();
		});
     }
    
}
