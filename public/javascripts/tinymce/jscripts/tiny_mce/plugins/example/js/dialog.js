/*tinyMCEPopup.requireLangPack();

var ExampleDialog = {
	init : function() {
		var f = document.forms[0];

		// Get the selected contents as text and place it in the input
		f.someval.value = tinyMCEPopup.editor.selection.getContent({format : 'text'});
		f.somearg.value = tinyMCEPopup.getWindowArg('some_custom_arg');
	},

	insert : function() {
		// Insert the contents from the input into the document
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, document.forms[0].someval.value);
		tinyMCEPopup.close();
	}
};

*/

tinyMCEPopup.requireLangPack();

var ExampleDialog = {
  init : function() {},

    insert : function() {
      alt = document.forms[0].alt.value;
      url = document.forms[0].url.value;
      css_class = document.forms[0].css_class.value;
      img_html = '<img src="' + img_src + '" alt="' + alt + '" class="' + css_class + '" />';
      if (url.length > 0) {
        img_html = img_html.link(url)
      }
      tinyMCEPopup.editor.execCommand('mceInsertContent', false, img_html);
      tinyMCEPopup.close();
    }
/*
  edit : function(url) {
    var name = 'editable_image_window';
    var features = 'height=600,width=1000,location=0,menubar=0,resizable=1,scrollbars=1,toolbar=0';
    window.open(url, name, features);
  },

  show_edited_image : function(image_id) {
    new Ajax.Request('/backstage/tinymce_images/' + image_id.toString(), { evalJS:'force', method:'get' });
    return false;
  }
*/
};

tinyMCEPopup.onInit.add(ExampleDialog.init, ExampleDialog);

