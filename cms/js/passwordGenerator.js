
// http://www.somacon.com/p143.php
// return the value of the radio button that is checked
// return an empty string if none are checked or
// there are no radio buttons

function getCheckedValue(radioObj) {
        if(!radioObj)
                return "";
        var radioLength = radioObj.length;
        if(radioLength == undefined)
                if(radioObj.checked)
                        return radioObj.value;
                else
                        return "";
        for(var i = 0; i < radioLength; i++) {
                if(radioObj[i].checked) {
                        return radioObj[i].value;
                }
        }
        return "";
}


function use_password(field_name)
{
        if (document.forms.suggest.newpass.value.length > 0)
        {
        	var pass_field = document.getElementById(field_name);
        	pass_field.value = document.forms.suggest.newpass.value;
        }
}


function make_password()
{
        var p_len = getCheckedValue(document.forms.suggest.p_len);
        var p_method = getCheckedValue(document.forms.suggest.p_method);
        var i = 0;
        var p = '';
        var c;

        switch (p_method)
        {
                case '0':
                while (i < p_len)
                {
                        c = parseInt(Math.random() * 10) + 48;
                        p += String.fromCharCode(c);
                        i++;
                }
                break;

                case '1':
                while (i < p_len)
                {
                        c = parseInt(Math.random() * 36);
                        if (c >= 10)
                        {
                                c += 87;
                        }

                        else
                        {
                                c += 48;
                        }

                        p += String.fromCharCode(c);
                        i++;
                }
                break;

                case '2':
                while (i < p_len)
                {
                        c = parseInt(Math.random() * 62);
                        if (c >= 36)
                        {
                                // lowercase
                                c += 61;
                        }

                        else if (c >= 10)
                        {
                                // uppercase
                                c += 55;
                        }

                        else
                        {
                                // number
                                c += 48;
                        }

                        p += String.fromCharCode(c);
                        i++;
                }
                break;

                default:
                while (i < p_len)
                {
                       p += String.fromCharCode(parseInt(Math.random() * 95) + 31);
                        i++;
                }
                break;
        }

        document.forms.suggest.newpass.value = p;
}